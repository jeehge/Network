/// Copyright (c) 2019 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation

//
// MARK: - Query Service
//

/// Runs query data task, and stores results in array of Tracks
class QueryService {
  //
  // MARK: - Constants
  // URLSession을 만들고 기본 세션 구성으로 초기화
  let defaultSession = URLSession(configuration: .default)
  
  //
  // MARK: - Variables And Properties
  //
  // 사용자가 검색을 수행 할 때 iTunes 검색 웹 서비스에 대한 GET 요청을 수행하는 데 사용하기 위해 선언
  var dataTask: URLSessionDataTask?
  var errorMessage = ""
  var tracks: [Track] = []
  
  //
  // MARK: - Type Alias
  //
  typealias JSONDictionary = [String: Any]
  typealias QueryResult = ([Track]?, String) -> Void
  
  //
  // MARK: - Internal Methods
  // 네트워크 요청
  func getSearchResults(searchTerm: String, completion: @escaping QueryResult) {
    // 1. 새 사용자 쿼리의 경우 dataTask 개체를 다시 사용하기를 원하므로 이미 존재하는 모든 데이터 작업을 취소한다.
    dataTask?.cancel()
    
    // 2. 쿼리 URL에 사용자의 검색 문자열을 포함 시키려면 iTunes 검색 기본 URL에서 URLComponents를 작성한 다음 쿼리 문자열을 설정한다. 검색 문자열이 escape 된 문자를 사용 하도록 한다. 오류 메시지를 반환하면 미디어 및 엔티티 구성 요소를 생략.
    if var urlComponents = URLComponents(string: "https://itunes.apple.com/search") {
      urlComponents.query = "media=music&entity=song&term=\(searchTerm)"
      
      // 3. urlComponents의 url 속성은 선택 사항이므로 url로 압축을 풀고 nil이면 일찍 반환
      guard let url = urlComponents.url else {
        return
      }
    
      // 4. 생성한 세션에서 쿼리 url과 데이터 작업이 완료될 때 호출할 완료 핸들러를 사용하여 URLSessionDataTask를 초기화
      dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in
        defer {
          self?.dataTask = nil
        }
        
        // 5. 요청이 성공하면 응답 데이터를 트랙 배열로 구문 분석하는 도우미 메서드 updateSearchResults를 호출
        if let error = error {
          self?.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
        } else if
          let data = data,
          let response = response as? HTTPURLResponse,
          response.statusCode == 200 {
          
          self?.updateSearchResults(data)
          
          // 6. 완료 핸들러에 트랙을 전달하기 위해 메인 큐로 전환
          DispatchQueue.main.async {
            completion(self?.tracks, self?.errorMessage ?? "")
          }
        }
      }
      
      // 7. 모든 작업은 기본적으로 일시 중단된 상태에서 시작. resume()을 호출하면 데이터 작업이 시작.
      dataTask?.resume()
    }
  }
  
  //
  // MARK: - Private Methods
  //
  private func updateSearchResults(_ data: Data) {
    var response: JSONDictionary?
    tracks.removeAll()
    
    do {
      response = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary
    } catch let parseError as NSError {
      errorMessage += "JSONSerialization error: \(parseError.localizedDescription)\n"
      return
    }
    
    guard let array = response!["results"] as? [Any] else {
      errorMessage += "Dictionary does not contain results key\n"
      return
    }
    
    var index = 0
    
    for trackDictionary in array {
      if let trackDictionary = trackDictionary as? JSONDictionary,
         let previewURLString = trackDictionary["previewUrl"] as? String,
         let previewURL = URL(string: previewURLString),
         let name = trackDictionary["trackName"] as? String,
         let artist = trackDictionary["artistName"] as? String {
        tracks.append(Track(name: name, artist: artist, previewURL: previewURL, index: index))
        index += 1
      } else {
        errorMessage += "Problem parsing trackDictionary\n"
      }
    }
  }
}


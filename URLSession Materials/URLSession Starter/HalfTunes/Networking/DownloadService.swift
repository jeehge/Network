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
// MARK: - Download Service
//

/// Downloads song snippets, and stores in local file.
/// Allows cancel, pause, resume download.
class DownloadService {
  //
  // MARK: - Variables And Properties
  //
  var activeDownloads: [URL: Download] = [:] // URL과 Download를 매핑
  
  /// SearchViewController creates downloadsSession
  var downloadsSession: URLSession!
  
  //
  // MARK: - Internal Methods
  //
  // TODO 9
  func cancelDownload(_ track: Track) {
  }
  
  // TODO 10
  func pauseDownload(_ track: Track) {
  }
  
  // TODO 11
  func resumeDownload(_ track: Track) {
  }
  
  func startDownload(_ track: Track) {
    // 1. 트랙으로 Download를 초기화
    let download = Download(track: track)
    // 2. 트랙의 미리보기 URL을 사용하여 URLSessionDownloadTask를 만들고 다운롣의 작업 속성을 설정
    download.task = downloadsSession.downloadTask(with: track.previewURL)
    // 3. 다운로드 작업 시작
    download.task?.resume()
    // 4. 다운로드가 진행 중임을 체크
    download.isDownloading = true
    // 5. URL을 ActiveDownload에 맵핑
    activeDownloads[download.track.previewURL] = download
  }
}

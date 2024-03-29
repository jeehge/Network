# Network

네트워크에 대해 공부해보자! 

그런데 나 뭘 공부해야 하는 걸까?

<br>

우선

Alamofire 👉 [링크](https://github.com/Alamofire/Alamofire)

부터 봐야겠다.

링크 타고 들어가자 마자 보이는 첫 문장

```Alamofire is an HTTP networking library written in Swift.```

<br>

Alamofire는 iOS, macOS를 위한 스위프트 기반 HTTP 네트워킹 라이브러리이다.

Apple의 Foundation networking 기반으로 인터페이스를 제공하여 일반적인 네트워킹 작업을 쉽게 할 수 있다.

<br>

Apple의 Foundation networking 기반 

이게 무엇일까 이것부터 시작해야겠다. 

<br>

# Foundation 👉 [링크](https://developer.apple.com/documentation/foundation)

```Access essential data types, collections, and operating-system services to define the base layer of functionality for your app.```

Essential Data Types, 컬렉션 및 운영 체제 서비스에 액세스하여 앱에 대한 기본 기능 레이어를 정의한다.

### Overview

Foundation 프레임워크는 데이터 저장, 텍스트 처리, 시간 및 날짜 계산, 정렬 및 필터링, 네트워킹을 통해 앱 및 프레임워크(다른 프레임워크를 말하는 듯)에 대한 기본 계층을 제공한다.

Foundation에서 정의한 클래스, 프로토콜, 데이터 타입은 macOS, iOS, watchOS, tvOS 등 모든 애플 SDK에 사용된다.

Foundation은 단어의 의미처럼 애플을 통해 제공되는 모든 앱들의 기본이 되는 프레임워크이다. 

### Networking

URL Loading System 👉 [링크](https://developer.apple.com/documentation/foundation/url_loading_system)

Bonjour 👉 [링크](https://developer.apple.com/documentation/foundation/bonjour)
 
<br>

오호 🤨

그럼 이제 내부적으로 내가 궁금했던 부분만 쏙쏙 뽑아서 예제로 함 봐야겠다

다른 사람의 코드를 보는 것 만큼 좋은 공부가 없다고 하니 실천해보자!

<br>


# raywenderlich


URLSession Tutorial: Getting Started 👉 [링크](https://www.raywenderlich.com/3244963-urlsession-tutorial-getting-started)

URLSession Tutorial에서는 `HTTP 요청을 만드는 방법`과 `일시 중지 및 재개`할 수 있는 방법을 공부할 수 있다.

iTunes 검색 API를 사용하여 다음 노래의 30초 미리보기를 다운로드 하는 앱을 만들어 봅시다.

백그라운드 이전을 지원하고 진행 중인 다운로드를 일시 중지, 다시 시작하거나 취소할 수 있습니다. 

<br>

UrlSession 👉 [링크](https://developer.apple.com/documentation/foundation/urlsession)

`UrlSession`은 HTTP 및 HTTPS 기반 요청을 처리하기 위한 클래스

`URLSession`은 요청을 보내고받는 핵심 객체이다. 

또한 `URLSessionConfiguration`을 통해 다음 세 가지 유형의 URL을 생성할 수 있다, 👉 [링크](https://developer.apple.com/documentation/foundation/urlsessionconfiguration)

`default` 기본 세션 구성할 때 사용 (저장 객체 사용 -> 쿠키)

`ephemeral` 캐시, 쿠키를 저장하지 않을 때 사용

`background` 앱이 백그라운드에 있을 때 다운로드/업로드 할 때 사용. 앱 자체가 시스템에 의해 일시 중단되거나 종료된 경우에도 전송은 계속 됨

<br>

`URLSessionConfiguration`을 사용하면 시간 초과 값, 캐싱 정책 및 HTTP 헤더와 같은 세션 속성을 구성할 수도 있다. 

`URLSessionTask`는 작업 개체를 나타내는 추상 클래스이다. 

세션은 데이터를 가져오고 파일을 다운로드하거나 업로드하는 실제 작업을 수행하는 하나 이상의 task를 생성한다.

<br>

### Session Task Types

구체적인 session task에는 세 가지 유형이 있다.

`URLSessionDataTask` 👉 [링크](https://developer.apple.com/documentation/foundation/urlsessiondatatask) : 서버로부터 데이터를 가져와서 메모리에 저장하는 GET 요청 대하 작업에 사용

`URLSessionUploadTask` 👉 [링크](https://developer.apple.com/documentation/foundation/urlsessionuploadtask) : POST 또는 PUT 메소드를 통해 디스크로 부터 웹 서비스로 파일으 업로드하는 작업에 사용

`URLSessionDownloadTask` 👉 [링크](https://developer.apple.com/documentation/foundation/urlsessiondownloadtask) : 원격 서비스로부터 파일을 임시 파일 위치로 다운로드하는 작업에 사용

<img width="624" alt="스크린샷 2022-02-12 오후 11 12 17" src="https://user-images.githubusercontent.com/8108570/153714754-8470f5b1-c552-45f2-8bb5-f115b838fd00.png">



작업을 일시 중지 또는 다시 시작 및 취소할 수 있다.
`URLSessionDownLoadTask`는 향후 재개를 위해 일시 중지할 수 있는 추가 기능이 있다.

일반적으로 `URLSesseion`은 두 가지 방법으로 데이터를 반환한다.

 - 작업이 성공적으로 끝나거나 에러가 발생할 때, 완료 핸들러를 통해
 - 세션을 만들 때 설정한 delegate에 메서드의 호출을 통해

<br>

### DataTask 및 DownloadTask

사용자의 검색 조건을 위해 iTunes Search API에 쿼리하는 data task를 만듬으로써 시작한다.

SearchViewController.swift에서 `searchBarsearchButtonClicked`는 스테이터스바의 네트워크 인디케이터를 사용해서, 네트워크 프로세서가 실행 중인 사용자르 표시한다. 그런 다음 네투워크 리퀘스트를 만들자 마자 QueryService.swift 안에서 처리하는 `getSearchResults(SearchTerm : Formultion :)`을 이후에 호출한다.

그런 다음 에서 스텁된 를 호출한다. 네트워크 요청을 하기 위해 빌드한다.

QueryService.swift에서 `// TODO 1`을 다음과 같이 바꾼다.

```
let defaultSession = URLSession(configuration: .default)
```

그리고 `// TODO 2` 

```
var dataTask: URLSessionDataTask?
```

defaultSession 을 생성하고 API로 GET 요청을 만들기 위해 우리가 사용할 URLSessionDataTask를 정의했다.

dataTask는 새로운 검색 문자열이 들어오 때마다 다시 초기화된다.

getSearchResults(searchTerm:completion:) 메소드의 내부를 다음을 변경한다.


```
// 1
dataTask?.cancel()
    
// 2
if var urlComponents = URLComponents(string: "https://itunes.apple.com/search") {
  urlComponents.query = "media=music&entity=song&term=\(searchTerm)"      
  // 3
  guard let url = urlComponents.url else {
    return
  }
  // 4
  dataTask = 
    defaultSession.dataTask(with: url) { [weak self] data, response, error in 
    defer {
      self?.dataTask = nil
    }
    // 5
    if let error = error {
      self?.errorMessage += "DataTask error: " + 
                              error.localizedDescription + "\n"
    } else if 
      let data = data,
      let response = response as? HTTPURLResponse,
      response.statusCode == 200 {       
      self?.updateSearchResults(data)
      // 6
      DispatchQueue.main.async {
        completion(self?.tracks, self?.errorMessage ?? "")
      }
    }
  }
  // 7
  dataTask?.resume()
}
```

번호가 매겨진 각 주석의 내용과 같다.

1. 새 사용자 쿼리의 경우, dataTask를 새로운 쿼리 재사용을 위해 이미 존재하는 모든 데이터 작업을 취소한다.
2. query URL 안에 사용자의 검색 문자열을 포함하려면 검색 기본 URL에서 URLComponents를 만든 다음 query string을 설정한다. 이렇게 하면 검새 문자열에 이스케이프된 문자가 사용된다. 오류 메시지가 표시되면 이 [게시물](https://forums.raywenderlich.com/t/urlsession-tutorial-getting-started-raywenderlich-com/73741/13)을 참조! 
3. urlComponents의 url 프로퍼티는 옵셔널이므로 안전하게 언래핑한다.
4. 생성한 세션에서 URLSessionDataTask를 생성한다. 그리고 작업이 완료될 때 호출할 completion handler를 함께 전달한다.
5. 요청이 성공하면 응답 데이터를 tracks 배열로 파싱하는 도우미 메서드 updateSearchResults를 호출한다.
6. completion handler에게 tracks를 전달하기 위해 main queue로 전환한다.
7. 모든 Task는 기본적으로 일시 중단된 상태로 시작된다. resume()을 호출해서 dataTask를 시작한다. 

`SearchViewController`에서 `getSearchResults(searchTerm:completion:)` 호출의 completion closure를 살펴보자!

네트워크 인디케이터를 숨긴 후 searchResults에 results를 저장한 다음 테이블 뷰를 업데이트한다.

<br>

Note. 기본 리퀘스트 메소드는 `GET`이다. 만약 `PUT, POST, DELETE`를 원한다면 `URLRequest.HTTPMethod` 프로퍼티를 설정하 다음 dataTask를 생성한다.

<br>

여기까지 작업 후 빌드하면 곡들의 검색 목록을 볼 수 있다. 그러나 download 하기 위해서 탭을 해도 아무 일도 일어나지 않는다.

음악을 저장하기 쉽게 `download task`를 사용할 것 이다.

** 참고사이트

이미 내가 공부 하려고 보고 있는 이 문서를 번역해 둔 착한 사람이 있다 👉 [링크](https://o-o-wl.tistory.com/50)


여러 개의 다운로드를 사용하기 위해 처음 해야할 일은 다운로드 활성 상태룰 유지하기 위한 사용자 정의 객체이다.

새로운 Download.swift 파일을 Model 폴더에 생성한다.

```
class Download {
  var isDownloading = false
  var progress: Float = 0
  var resumeData: Data?
  var task: URLSessionDownloadTask?
  var track: Track

  init(track: Track) {
    self.track = track
  }
}
```

`Download` 프로퍼티에 대한 설명은 다음과 같다.

- isDownloading : 다운로드가 정지 중인지 진행 중인지 표현
- progress: 0.0 ~ 1.0 사이의 다운로드 진행 상태르 보여주는 변수
- resumeData : 사용자가 download task 를 중지했을 때, 지금까지 생성된 Data를 저장한다. 만약 호 서버가 지원한다면 중지된 다운로드를 재개할 수 있다.
- task : 트랙을 다운로드 하는 URLSessionDownloadTask
- track : 다운로드할 대상 트랙, 이 트랙의 URL은 Download 객체의 식별자이다.

다음, DownloadService.swift 에서 // TODO 4 를 다음으로 바꾼다.

```
var activeDownloads: [URL: Download] = [:]
```

이 딕셔너리는 URL과 진행중인 Download를 매핑한다.

우리는 data task르 생성한 것처럼, download task 를 completion handler 와 함께 생성할 수 있다. 튜토리얼 뒷부분에서 다운로드 진행 상태를 업데이트하고 검사하 것이다. 그러므로 우리는 사용자 정의 델리게이트가 필요하다.



Apple의 URLSession 문서에 나열된 여러 session delegate 프로토콜이 있다. `URLSessionDownloadDelegate`는 download task 에 대한 이벤트르 처리한다.

우리는 `SearchViewController` 를 session delegate 로 설정할 필요가 있습니다. 그래서 지금 우리는 session delegate 프로토콜을 확장할 것이다.

SearchViewController.swift 에 아래오 같이 확장하자!

```
extension SearchViewController: URLSessionDownloadDelegate {
  func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask,
                  didFinishDownloadingTo location: URL) {
    print("Finished downloading to \(location).")
  } 
}
```

`URLSessionDownloadDelegate` 메소드는 다운로드가 끝났을 때 알리는 `urlSession(_:downloadTask:didFinishDownloadingTo:)` 메소드 단 하나만이 required 구혀 메소드이다.

모든 준비 작업을 완료했다.

이제 파일 다운로드를 할 수 있다.


download task 를 다루는 session 을 만든다.

```
lazy var downloadsSession: URLSession = {
  let configuration = URLSessionConfiguration.default
  
  return URLSession(configuration: configuration, 
                    delegate: self, 
                    delegateQueue: nil)
}()
```

여기에서, 기본 구성으로 별도의 session을 초기화하고 delegate 호출을 통해 URLSession 이벤를 수신할 수 있도록 지정했다.

이것은 progress의 task 진행 사항을 모니터링 하기에 유용하다.

delegateQueue를 nil로 설정하면 serial operation queue 를 만들어서 completion handler와 delegate 메소드를 모두 수행한다. 

다음 코드를 // TODO 7 에 넣는다.

```
downloadService.downloadsSession = downloadsSession
```

이렇게하면 `DownloadService` 의 `downloadsSession` 프로퍼티가 방금 정의한 session에 설정된다.

delegate 와 session 으로 구성되 상태에서 사용자가 트랙 다운로드를 요청할 때 마침내 download task 를 만들 준비가 되었다.

DownloadService.swift 에서 다으 구현으로 startDownload(_ :)의 내용을 바꾼다.

```
// 1
let download = Download(track: track)
// 2
download.task = downloadsSession.downloadTask(with: track.previewURL)
// 3
download.task?.resume()
// 4
download.isDownloading = true
// 5
activeDownloads[download.track.previewURL] = download
```

사용자가 table view cell의 다운로드 버튼을 탭하면, `TrackCellDelegate` 로 동작하는 `SearchViewController`가 cell의 `Track`을 식별한 다음 해당 `Track`에 대한 `startDownload(_ :)`를 실행한다.

`startDownload(_ :)` 에서 무슨 일이 일어나는지 보자!

1. Track 으로 Download 객체를 초기화한다.
2. 새 session 객체를 사용하여, Track의 preview URL로`URLSessionDownloadTask`를 만들고, download의 task 프로퍼티로 설정한다.
3. `resume()` 호출하여 download task 시작한다.
4. download가 진행 중임을 나타낸다.
5. 마지막으로, download URL을 `activeDlownloads`에서 `Download`에 매핑한다.


앱을 빌드 후 실행하고, 트랙을 검색하고, cell 에서 Download 버튼을 누른다. 잠시 후 다운로드가 완료되었음을 나타내는 디버그 콘솔에 메시지가 표시된다.

```
Finished downloading to file:///Users/mymac/Library/Developer/CoreSimulator/Devices/74A1CE9B-7C49-46CA-9390-3B8198594088/data/Containers/Data/Application/FF0D263D-4F1D-4305-B98B-85B6F0ECFE16/tmp/CFNetworkDownload_BsbzIk.tmp.
```

다운로드 버튼이 계속 표시되지만 곧 해결할 수 있다.


download task 가 완료되면 `urlSession(_ :downloadTask:didFinsihDownloadingTo:)` 메소드는 URL 임시 파일 영역에 저장한다.

task 는 메서드가 리턴되기 전에 앱 샌드박스 컨테이너 디렉터리 영역의 위치로 이동하는 것이다.


ShearchViewController.swift에서 `urlSession(_ :downloadTask:didFinsihDownloadingTo:)`의 print 문을 다음 코드로 바꾼다.

```
// 1
guard let sourceURL = downloadTask.originalRequest?.url else {
  return
}

let download = downloadService.activeDownloads[sourceURL]
downloadService.activeDownloads[sourceURL] = nil
// 2
let destinationURL = localFilePath(for: sourceURL)
print(destinationURL)
// 3
let fileManager = FileManager.default
try? fileManager.removeItem(at: destinationURL)

do {
  try fileManager.copyItem(at: location, to: destinationURL)
  download?.track.downloaded = true
} catch let error {
  print("Could not copy file to disk: \(error.localizedDescription)")
}
// 4
if let index = download?.track.index {
  DispatchQueue.main.async { [weak self] in
    self?.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], 
                               with: .none)
  }
}
```

각 단계에서 수행하는 작업은 다음과 같다.

1. Task 로 부터 original request URL을 추출하고, active downloads에서 일치하는 `Download`를 조회하고 해당 dictionary 에서 제거한다.
2. 그런 다음 URL(파일 이름 및 파일의 확장자)을 lastPathComponent를 앱의 Documents directory의 경로에 추가해서 영구적으로 저장할 로컬 파일 경로를 생성하는 영구적인 로커 파일 경로를 생성하는 `localFilePath(for:)` 메소드의 파라미터로 URL을 전달한다.
3. `fileManager`를 사용하면 다운로드 한 파일을 임시 파일 위치에서 원하는 파이 경로로 이동 시킨다. 먼저 복사 작업을 시작하기 전에 해다 위치에서 아이템을 지운다. 그리고 트랙의 `download` 프로퍼티를 true로 설정한다.
4. 마지막으로 download track의 index 프로퍼티와 일치하는 cell을 reload 한다.

프로젝트를 빌드하고 실행시켜 보자!

트랙을 다운로드하면 다운로드가 끝났을 때 우리는 파일의 위치를 볼 수 있다.

다운로드 버튼이 바로 사라지면, delegate 메서드가 track의 `downloaded`가 `true`로 설정하기 때문이다.

track을 탭하면 다음과 같이 AVPlayerViewController에서 재생된다.

<br>

다운로드 일시 중지, 재시작 및 취소

사용자가 다운로드를 중지하거나 완전히 취소하는 것을 원한다면 어떻게 해야 할까?

이 섹션에서는 다운로드 진행 중에 프로세스를 중지, 재개 그리고 취소 기능을 사용자가 이용할 수 있게 구현할 것이다.

먼저 사용자가 활성 다운로드를 취소할 수 있도록 허용합니다.

<br>

다운로드 취소

```
guard let download = activeDownloads[track.previewURL] else {
  return
}

download.task?.cancel()
activeDownloads[track.previewURL] = nil
```

다운로드를 취소하려면 활성 다운로드 사전의 해당 다운로드에서 다운로드 작업을 검색하고 cancel()을 호출하여 작업을 취소합니다.


Pausing Downloads

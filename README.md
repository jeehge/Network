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

`URLSessionDataTask` 👉 [링크](https://developer.apple.com/documentation/foundation/urlsessiondatatask) 서버로부터 데이터를 가져와서 메모리에 저장하는 GET 요청 대하 작업에 사용

`URLSessionUploadTask` 👉 [링크](https://developer.apple.com/documentation/foundation/urlsessionuploadtask) POST 또는 PUT 메소드를 통해 디스크로 부터 웹 서비스로 파일으 업로드하는 작업에 사용

`URLSessionDownloadTask` 👉 [링크](https://developer.apple.com/documentation/foundation/urlsessiondownloadtask) 원격 서비스로부터 파일을 임시 파일 위치로 다운로드하는 작업에 사용

<img width="624" alt="스크린샷 2022-02-12 오후 11 12 17" src="https://user-images.githubusercontent.com/8108570/153714754-8470f5b1-c552-45f2-8bb5-f115b838fd00.png">



작업을 일시 중단,








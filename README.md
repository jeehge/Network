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


UrlSession 👉 [링크](https://developer.apple.com/documentation/foundation/urlsession)

`UrlSession`은 HTTP 및 HTTPS 기반 요청을 처리하기 위한 클래스

<img width="565" alt="스크린샷 2021-12-22 오후 4 31 10" src="https://user-images.githubusercontent.com/8108570/147053105-202f2fbe-61eb-4e7a-b8f4-c2e5c505064d.png">

`URLSession`은 요청을 보내고받는 핵심 객체이다. 

세 가지 유형으로 제공되는 `URLSessionConfiguration`을 통해 생성한다.









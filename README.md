## Architect

* [아키텍쳐 패턴이란?](https://yoonah-dev.oopy.io/9aa8130e-c5b2-4929-a5de-a8ae344717cb)
* [MVC 정리](https://yoonah-dev.oopy.io/bca9a10e-9adc-4f4b-ac40-115424d02fbb)
* [MVP 정리](https://yoonah-dev.oopy.io/25e43b61-61e1-4972-b590-6a8eb52fea31)
* [MVVM 정리](https://yoonah-dev.oopy.io/9ce987de-36b7-476e-9744-66077124b379)
* [MVVM과 Clean Architecture](https://yoonah-dev.oopy.io/2c6aa722-a46b-47c3-a063-6b822a658940)

| Pattern | tutorial | Description |
|:---------:|:------:|-----|
| MVC | [`#1`](https://github.com/YoonAh-dev/Software-Design-Pattern/tree/main/Architecture-Pattern/MVC/MVC_tutorial_%231) | - [Example Page](https://velog.io/@kevinkim2586/iOS-Swift-%EA%B3%B5%EB%B6%80-6-MVC-Design-Pattern-%EB%B0%8F-%EC%A0%81%EC%9A%A9) <br/> - Model Business Logic 담당하는 구조체, 함수 따로 정의 <br/> - 모듈화  |
|  | [`#2`](https://github.com/YoonAh-dev/Software-Design-Pattern/tree/main/Architecture-Pattern/MVC/MVC_tutorial_%232) | - [Example Lecture](https://www.edwith.org/swiftapp/lecture/26620/) <br/> - Stanford iOS 강의 <br/> - Card 맞추기 게임 구현 <br/> - Card 모델의 로직을 구현하는 Concentration파일 사용  |
|  | [`#3`](https://github.com/YoonAh-dev/Software-Design-Pattern/tree/main/Architecture-Pattern/MVC/MVC_tutorial_%233) | - [Example Page](https://github.com/tailec/ios-architecture/tree/master/mvc/MVC/App) <br/> - MVC Example Repo <br/> - github search API 구현 <br/> - NetworkingService Protocol로 구현 <br/> - [Throttle](https://webclub.tistory.com/607) 기술 사용  |
| MVP | [`#1`](https://github.com/YoonAh-dev/Software-Design-Pattern/tree/main/Architecture-Pattern/MVP/MVP_Example) | - [Example Page](https://saad-eloulladi.medium.com/ios-swift-mvp-architecture-pattern-a2b0c2d310a3) <br/> - 미디엄 블로그 MVP 구성 예제 변형 <br/> - Traffic Light 버튼을 누르면 하단 Description Label이 변경되는 예시 <br/> - Storyboard 사용 <br> - Presenter Unit Test 코드 작성  |
| | [`#2`](https://github.com/YoonAh-dev/Software-Design-Pattern/tree/main/Architecture-Pattern/MVP/MVP_Example2) | - [Example Page](https://velog.io/@gomminjae/Swift-MVP) <br/> - Velog MVP 구성 예제 변형 <br/> - 버튼을 누르면 Welcome 멘트가 나오는 예시 <br/> - Storyboard 사용  |
| MVVM | [`#1`](https://github.com/YoonAh-dev/Software-Design-Pattern/tree/main/Architecture-Pattern/MVVM/MVVM_tutorial_%231) | - [Example Video](https://www.youtube.com/watch?v=qzXJckVxE4w) <br/> - Swift만 사용해서 MVVM 구성 예제 <br/> - `Person TableView` 구성 <br/> - 전체 TableView 구성을 코드로  |
|  | [`#2`](https://github.com/YoonAh-dev/Software-Design-Pattern/tree/main/Architecture-Pattern/MVVM/MVVM_tutorial_%232) | - [Example Playlist](https://www.youtube.com/playlist?list=PLziSvys01Oek7ANk4rzOYobnUU_FTu5ns) <br/> - RxSwift, RxCocoa, RxCoreData, RxDataSources, RxRelay, Action 사용해서 MVVM 구성 예제 <br/> - 메모앱 만들기 -> 다양한 기능(Create, Read, Update, Delete) <br/> - Coordinator 사용해서 Scene 이동 <br/> - Storage를 추가해서 메모리 저장  |
|  | [`#3`](https://github.com/YoonAh-dev/Software-Design-Pattern/tree/main/Architecture-Pattern/MVVM/MVVM_tutorial_%233) | - [Example Playlist](https://www.youtube.com/playlist?list=PLG9rdv7aU2N7LBcMoNCWXfKuckZL-WyKV) <br/> - `NewsAPI`를 사용해서 Articles Data 생성 <br/> - [의존성 주입](https://donggyu9410.medium.com/ios-and-swift-%EC%9D%98%EC%A1%B4%EC%84%B1-%EC%A3%BC%EC%9E%85-60faee384274)을 위해서 Protocol 사용 <br/> - RxSwift, RxCocoa, SDWebImage 사용  |
|  | [`#4`](https://github.com/YoonAh-dev/Software-Design-Pattern/tree/main/Architecture-Pattern/MVVM/MVVM_tutorial_%234) | - [Example Video](https://www.youtube.com/watch?v=ngblLvDceUw) <br/> - Swift만 사용해서 MVVM 구성 예제 <br/> - [User Data](https://api.androidhive.info/contacts/)를 사용  |
|  | [`#5`](https://github.com/YoonAh-dev/Software-Design-Pattern/tree/main/Architecture-Pattern/MVVM/Employee-MVVM-Example) | - [Example Page](https://medium.com/@abhilash.mathur1891/mvvm-in-ios-swift-aa1448a66fb4) <br/> - Closure 사용하여 binding 구현 MVVM 예제 <br/> - [Employee Data](http://dummy.restapiexample.com/api/v1/employees)를 사용  |
|  | [`#6`](https://github.com/YoonAh-dev/Software-Design-Pattern/tree/main/Architecture-Pattern/MVVM/Two-Way-Binding-MVVM) | - [Example Page](https://github.com/stevencurtis/SwiftCoding/tree/master/TwoWayBinding) <br/> - Vanilla Swift binding 구현 MVVM 예제 <br/> - Delegate, Closure, Observable Class, Bindable Class 사용해서 구현, [노션 블로그에 방식 작성](https://yoonah-dev.oopy.io/c2c639a9-9833-46be-bc2e-1d1e764ccd55)  |
| CleanArchitecture-MVVM | [`#1`](https://github.com/YoonAh-dev/Software-Design-Pattern/tree/main/Architecture-Pattern/CleanArchitecture-MVVM/CleanArchitecture-MVVM-Example) | - [Example Repository](https://github.com/kudoleh/iOS-Clean-Architecture-MVVM) <br/> - [CleanArchitecture-MVVM에 대한 설명](https://eunjin3786.tistory.com/207?category=837198) <br/> - Module를 사용한 Layer Framework <br/>  |


## Design
| Pattern | tutorial | Description |
|:---------:|:------:|-----|
| Factory Method | [`#1`](https://github.com/YoonAh-dev/Software-Design-Pattern/tree/main/Design-Pattern/FactoryMethod/Factory_tutorial) | - [Example Page](https://icksw.tistory.com/237) <br/> - [Example Page2](https://github.com/ochococo/Design-Patterns-In-Swift#-factory-method) <br/> - Player Factory화를 통한 단순 예제 <br/> - CurrencyDescribing Factory화를 통한 단순 예제 <br/> - `Product`, `Concrete Product`, `Creator`, `Factory` 생성  |
| | [`#2`](https://github.com/YoonAh-dev/Software-Design-Pattern/tree/main/Design-Pattern/FactoryMethod/Factory_tutorial2) | - [Example Page](https://velog.io/@ryan-son/%EB%94%94%EC%9E%90%EC%9D%B8-%ED%8C%A8%ED%84%B4-Factory-pattern-in-Swift) <br/> - UIComponent factory화 단순 예제 <br/> - `Product`, `Concrete Product`, `Factory` 생성  |
| Observer | [`#1`](https://github.com/YoonAh-dev/Software-Design-Pattern/tree/main/Design-Pattern/Observer/Observer_tutorial) | - [Example Page](http://throughkim.kr/2019/09/05/swift-observer/) <br/> - ScoreRecord에서 공통 기능을 추출해서 Observer로 만들기 <br/> - Observer는 점수 리스트에 변동이 생길 때마다 통보받음 <br/> - `Observer`, `Subject` 생성  |
| | [`#2`](https://github.com/YoonAh-dev/Software-Design-Pattern/tree/main/Design-Pattern/Observer/Observer_Tutorial2) | - [Example Page](https://icksw.tistory.com/257) <br/> - Store에서 Customer에게 notify주는 예제 <br/> - Subscribe한 Observer는 notify가 생길 때마다 통보받음 <br/> - `Publisher`, `Concrete Publisher`, `Subject` 생성  |
| Adapter | [`#1`](https://github.com/YoonAh-dev/Software-Design-Pattern/tree/main/Design-Pattern/Adapter/Adapter-Example) | - [Example Page](https://joycestudios.tistory.com/33) <br/> - [Example Page2](https://github.com/ochococo/Design-Patterns-In-Swift) <br/> - 기본적인 Adapter 구조 알아가기 <br/> |
|  | [`#2`](https://github.com/YoonAh-dev/Software-Design-Pattern/tree/main/Design-Pattern/Adapter/Login-Adapter) | - [Example Page](https://github.com/jaicoco/Swift_Design_Pattern_Study/tree/main/Structural%20Pattern/Adapter%20Pattern/Adapter%20Pattern) <br/> - 다른 Social Login에 맞춘 Adapter 사용 <br/> - LoginService를 생성해서 Adapter에 맞춰서 구현 <br/> |


## ETC
| Title | Data | Description
|:---------:|:------:|----|
| Coordinator | [Coordinator.pdf](https://github.com/YoonAh-dev/Software-Design-Pattern/files/11590836/Coordinator.pdf) | 마다가스카 코딩 클럽에서 발표했던 Coordinator Pattern 자료 |

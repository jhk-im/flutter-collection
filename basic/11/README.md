# Flash Chat

## 학습내용

### BottomSheet

* 하단에서 슬라이드 업되는 모달 형태의 위젯
* 종류
  * Persitent Bottom Sheet
    * 앱의 하단에 항상 표시되는 영구 Bottom Sheet
    * 앱의 메인 기능 중 하나를 보여줄 때 사용
  * Modal Bottom Sheet
    * 화면 하단에서 모달 형태의 Bottom Sheet로 기존 화면을 가리고 있는 형태
    * 추가 정보를 보여주거나 작업을 수행할 때 사용
* Scaffold 위젯에 구현되어 있음
* showModalBottomSheet() 메서드를 사용하여 표시
* 자체적으로 애니메이션 효과가 구현되어 있음 (Slide Up)

### Flutter App Architercture Pattern

* Bloc
  * Business Logic Component 약자
  * 앱의 비즈니스 로직을 관리하기 위한 패턴
  * 모든 앱 상태를 관리하고 UI와 분리된 상태를 제공
  * 비즈니스 로직을 확장하고 테스트하기 용이함
* Provider
  * 상태 관리를 위한 패턴
  * 상태를 빠르게 업데이트 하고 앱의 다른 부분에서 사용할 수 있는 공유 상태를 제공할 수 있음
  * 의존성 주입(Dependency Injection)과 같은 기술을 사용하여 상태와 비즈니스 로직을 분리함
* MVC, MVP, MVVM 아키텍처 패턴도 사용할 수 있음
  * 각 프로젝트의 크기와 복잡도에 따라 선택
* Clean Architecutre
  * 소프트웨어 의존성을 느슨하게 유지
  * 유연성과 확장성을 높이기 위한 패턴
  * 비즈니스 로직과 UI를 완전하게 분리하는 개발방법
  * 코드 재사용성, 유지보수성, 테스트 용이성을 높임

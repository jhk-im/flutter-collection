# BMI Calculator

## 학습내용

### Flutter Themes

* 앱 전체에서 색상과 폰트 스타일 공유
* 앱 전체 테마 정의 및 특정 부분의 생상과 폰트 스타일 정의
* 앱 전체 테마는 MaterialApp에서 생성된 루트의 Theme 위젯임

### Theme Widget

* 색상, 폰트 및 기타 디자인 속성 정의
* 일관된 디자인 유지 및 위젯들간 공유
* MaterialApp 트리 상단에 위치
* 정의된 테마는 앱 전체에서 사용됨
* ThemeData 객체를 생성하고 디자인 속성을 지정
* 특정 구성 요소에 대한 테마를 재정의 할 수 있음

```dart
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //primaryColor: Color(0xFF0A0E21),
        colorScheme: ColorScheme.dark()
            .copyWith(primary: Color(0xFF0A0E21), secondary: Colors.purple),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}
```

### Key Class

* 위젯을 고유하기 식별하기 위해 사용
* 모든 위젯은 key 속성을 가지고 있음
* abstract클래스 이며 다양한 하위 클래스를 가지고 있음
* 위젯을 동적으로 변경하거나 업데이트 할 때 유용
* GlobalKey 클래스는 전체 앱에서 유일한 식별자 생성
* ValueKey 클래스는 객체의 값에 따라 위젯을 구별
* 위젯 테스트에서 유용하고 사용

### Final vs Const

* Final
  * 런타임에서 값이 설정되고 이후에는 변경할 수 없음
  * 변수에 대한 값을 컴파일 단계에서 결정할 필요 없음
  * 초기화된 후 값 변경 및 값 할당 불가
* Const
  * 컴파일 단계에 값이 결정됨
  * 런타임에 변경될 수 없음을 보장함
  * 프로그램 실행 중간에 값이 변경되지 않음
  * 같은 값으로 여러번 초기화 될 수 있음

### GestureDetector Widget

* 사용자의 제스터를 감지하고 처리하는 위젯
* 일반적으로 부모 위젯으로 설정하여 자식 위젯에서 발생한 제스처 이벤트를 감지하여 적절한 처리 수행
* onTap, onDoubleTap 등 다양한 콜백 제공

### Slider Widget

* 사용자가 값을 선택하기 위한 슬라이드 제공
* 수치 값을 조절할 때 사용
* min, max, value 및 onChanged 콜백을 포함한 여러 매개변수를 가지고 있음
* 기본적으로 수평 슬라이더 이며 수직 슬라이더 생성도 가능함
* 테마와 스타일 변경 가능함

### Composition vs Inheritance

* 둘 다 객체 지향 프로그래밍에서 코드 재사용성을 증가시키는 데 사용되는 방법
* Composition
  * 두 개 이상의 클래스를 조합하여 더 복잡한 클래스를 만드는 것
  * 객체의 기능을 향상시키는 데 사용
  * 클래스 간의 강한 결합을 유발
  * 한 클래스가 다른 클래스의 인스턴스를 가지고 있는 형태
* Inheritance
  * 클래스 간의 계층 구조를 만들어 코드를 재사용하는 데 사용
  * 기존 클래스의 기능을 상속받아 새로운 클래스 생성
  * 클래스 간의 약한 결합을 유발

### ShapeBorder Class

* 컨테이너, 버튼과 같은 위젯의 모양을 변경할 수 있는 위젯
* 해당 클래스를 상속하여 원하는 모양을 정의하고, 사용자 지정 모양을 생성
* getOuterPath -> 외곽 경계선을 정의하는 메서드이며 Path 객체 반환
* paint -> 위젯을 그리는 메서드이며 주어진 Canvas 객체에서 ShapeBorder를 그리기 위해 사용

### Route and Navigation


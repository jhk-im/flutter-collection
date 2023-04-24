# Flash Chat

## 학습내용

### Flutter Hero Animations

* 위젯의 전환 애니메이션 구현
* 두개의 위젯 사이에서 수행
* Hero 위젯을 생성하고 고유한 tag 속성을 할당해야 함

```dart
Hero({
  Key? key,
  required this.tag,
  this.createRectTween,
  this.flightShuttleBuilder,
  this.placeholderBuilder,
  required this.child,
})
```

* tag: 애니메이션에서 공유되는 고유 식별자
* crateRectTween: 원래 위치와 대상 위치의 사각형을 변환하기 위한 Tween 생성기
* flightShuttleBuilder: 원래 위치와 대상 위치 사이의 애니메이션 컨테이너 생성기
* placeholderBuilder: Hero 애니메이션 진행 중 표시할 위젯 생성기
* child: Hero 애니메이션에서 공유되는 자식 위젯

### Animation Contoroller

* 애니메이션 시작, 중지, 일시중지 및 재개
* 애니메이션에 대한 지속시간 및 커브와 같은 설정 제공
* 프레임간 애니메이션 값 변화 추적
* SingleTickerProviderStateMixin / TickerProviderStateMixin
* 주요 속성 및 메서드
  * duration: 애니메이션 지속시간을 나타내는 Duration 객체
  * value: 애니메이션 값
  * status: 애니메이션 상태(forward, reverse, dismissed, completed)
  * forward: 애니메이션을 시작하고 애니메이션 값 증가
  * reverse(): 애니메이션을 뒤로 재생하고 애니메이션 값 감소
  * stop(): 애니메이션을 중지하고 애니메이션 값 보존
  * reset(): 애니메이션 값 0으로 재설정
  * dispose: 애니메이션 컨트롤러 제거

```dart
class MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller.forward();
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            child: Center(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (BuildContext context, Widget? child) {
                  return Text('${_animation.value}');
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

### CurvedAnimation

* 애니메이션을 특정 커브로 변환하는 데 사용
* 시작과 끝 값을 정의하는 Tween과 함께 사용됨

```dart
class MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ).drive(Tween<double>(begin: 0, end: 1));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller.forward();
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            child: Center(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (BuildContext context, Widget? child) {
                  return Opacity(
                    opacity: _animation.value,
                    child: child,
                  );
                },
                child: const Text('Hello'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

# Dicee

## 학습내용

### Expanded Widget

* Row, Column 또는 Flex의 자식 위젯을 사용하여 사용 가능한 공간을 채우도록 확장함
* 여러 자식 위젯이 확장되는 경우 사용 가능한 공간은 flex 펙터에 따라 분할
* Row, Column, Flex의 하위 위젯이어야 함
* Expanded 위젯에서 부모 위젯 까지의 경로에는 Stateless or Stateful 위젯만 포함되어야 함

```dart
    Row(
      children: [
        Expanded(
          child: Image.asset('images/dice1.png'),
        ),
        Expanded(
          child: Image.asset('images/dice2.png'),
        ),
      ],
    );
```

### TextButton Widget

* Material Design에서 사용
* 다른 콘텐츠와 함께 사용할 수 있음
* 버튼 위치가 명확하게 나타나도록 패딩으로 내용과 구분
* 다이얼로그나 카드에선 일반적으로 하나의 코너에 그룹으로 표시
* 리스트 중간과 같이 콘텐츠와 혼돈 될 가능성이 있는 곳은 권장하지 않음
* defaultStyleOf로 정의되어 있으며 매개변수를 사용하여 재정의 할 수있음
* TextButtonTheme으로 하위 트리 모든 TextButton 스타일 정의
* ThemeData.textButtonTheme으로 앱전체 TextButton 스타일 정의
* 자식으로 라벨을 가지고 있으며 Text, Icon 등의 위젯을 사용할 수 있음

```dart
        Expanded(
            child: TextButton(
                onPressed: () {
                  print('2');
                },
                child: Image.asset('images/dice2.png')),
        ),
```

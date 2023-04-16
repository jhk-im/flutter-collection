# MiCard

## 학습내용

### Hot Reload and Hot Restart

* StatelessWidget을 통해 App을 다시 생성
* 내부 build 메서드에 의해 변경이 있을 때 마다 호출되어 reload 실행
* Hot Reload는 UI만 초기화 되고 데이터는 잃지 않음
* Hot Restart는 UI와 데이터도 초기화 됨

### StatelessWidget

* UI를 구체적으로 설명하는 위젯 모음을 빌드
* 빌드 프로세스는 재귀적으로 호출됨
* UI가 구체적으로 완전한 상태가 될 때 까지 유지됨
* 동적으로 변경될 수 있는 구성 요소의 경우 사용하는 것이 좋음
* build 메서드의 호출
  * 위젯이 트리에 처음 삽입될 때
  * 위젯의 부모가 구성을 변경할 때
  * InheritedWidget이 변경될 때
* 위젯 재구성시 성능유지
  * 복잡한 UI의 경우 Flutter에서 지원하는 방식을 찾아서 적용
  * 재사용 가능한 UI요소는 helper method 대신 위젯을 사용할 것
  * const 위젯인 경우 Flutter에서 대부분 재구성 작업을 생략함
  * IngeritedWidget의 사용으로 자주 재구성이 될 경우 변경되는 부분을 하위 항목으로 push하여 Stateless 위젯을 여러개의 위젯으로 리팩토링
  * Stateless -> StatefulWidget으로 리팩토링할 때 StatefulWidget의 GlobalKeys를 사용할 수 있음

### Container Widget

* 레이아웃 박스
* Single-child layout widgets
* 자식 위젯을 패딩이로 감싸고 추가적인 제약 조건을 적용
* 기본적으로 hitTest에 대해 false 반환
  * hitTest?
    * 지정된 크기의 직사각형에서 주어진 지점이 decoration을 맞추는지 여부를 테스트
* 컨테이너의 그리기 순서
  * 지정된 변환 적용
  * 패딩 영역 채우기 위해 decoration 그림
  * 자식 위젯을 그림
  * foregroundDecoration을 그려 패딩영역 채움
* 다른 위젯을 결합하여 사용하므로 동작이 복잡함
* 요약
  * 순서대로 정렬 고려
  * 자식 크기 고려
  * 너비, 높이, 제약조건 고려
  * 부모에 맞게 확장
  * 가능한 작이지려 시도
* 상세
  * 자식, 정렬, 높이, 너비, 제약조건이 없고 부모가 무제한 제약조건을 제공하는 경우 가능한 작게 크기를 맞추려 시도
  * 자식, 정렬이 없고 높이, 너비, 제약 조건이 제공되면 해당 제약 조건과 부모의 제약조건의 조하에 따라 가능한 작아지려 시도
  * 자식, 정렬, 높이, 너비, 제약 조건이 없고 부모가 제한된 제약 조건을 제공하면 부모에 맞게 확장됨
  * 정렬이 있고 부모가 무제한 제약 조건을 제공하면 자식 주변에 크기를 맞추려 시도
  * 정렬이 있고 부모가 제한된 제약 조건을 제공하면 부모에 맞게 확장 후 정렬에 따라 자식을 위치시킴
  * 자식이 있지만 정렬, 높이, 너비, 제약 조건이 없으면 부모에서 제공하는 제약 조건을 자식에게 전달 후 자식 크기에 맞게 조정함

```dart
child: Container(
    height: 100.0,
    width: 100.0,
    //margin: EdgeInsets.all(20.0),
    //margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
    //margin: EdgeInsets.fromLTRB(30.0, 10.0, 50.0, 20.0),
    margin: EdgeInsets.only(left: 30.0),
    padding: EdgeInsets.all(20.0),
    color: Colors.white,
    child: Text('Hello'),
),
```

### Column, Row Widget

* Column
  * 수직으로 자식 위젯을 표시
  
* Row
  * 수평으로 자식 위젯을 표시

* 공통
  * Multi-child layout widget
  * 스크롤 x
  * 사용 가능한 공간을 채우기 위해 ExpandedWidget으로 자식 위젯을 감싸야 함

```dart
child: Column(
    //mainAxisSize: MainAxisSize.min,
    //mainAxisAlignment: MainAxisAlignment.center,
    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //verticalDirection: VerticalDirection.up,
    //crossAxisAlignment: CrossAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
        Container(
            height: 100.0,
            //width: double.infinity,
            color: Colors.white,
            child: Text('Container1'),
        ),
        SizedBox(
            height: 20.0,
        ),
        Container(
            height: 100.0,
            //width: double.infinity,
            color: Colors.blue,
            child: Text('Container2'),
        ),
        Container(
            height: 100.0,
            //width: double.infinity,
            color: Colors.red,
            child: Text('Container2'),
        ),
    ],
)
```

child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100.0,
                height: double.infinity,
                color: Colors.red,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.green,
                  )
                ],
              ),
              Container(
                width: 100.0,
                height: double.infinity,
                color: Colors.blue,
              ),
            ],
          ),
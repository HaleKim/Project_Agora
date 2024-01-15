void main(List<String> args) {
  var name = '형래'; //var은 변수 선언 때에 타입을 지정하지 않는 형태 - 메서드 내 지역 변수 선언 시 쓰임
  name = 'hale'; //var을 자주 사용하는 것이 권장되고, class의 속성 변수들을 설정할 때나 타입 지정하기

  var a;
  dynamic b; //a, b는 같은 dynamic 형 변수. 어떤 타입으로도 사용 가능, 사용 지양.

  String? hale = 'hale';
  hale = null; //null값을 직접 넣을 가능성이 있는 변수는 변수 타입 선언 끝에 ? 삽입
  hale?.isNotEmpty;
  if (hale != null) {
    hale.isNotEmpty;
  } //hale != null 과 hale? 는 같은 용도. 변수가 null이 아닌가? 하는 확신을 dart에게 주는 null-safety 기능

  final f = 12; //타입을 지정해주지 않아도 dart가 자동으로 인식하여 주고 어차피 수정 불가이니 final만 쓰기

  late final c; //나중에 api에서 데이터를 받아와서 넣어주어야 하는 등 데이터를 나중에 넣을 것이지만 미리
  //선언을 해야하는 변수에는 late를 붙일 수 있다. api에서 데이터를 가져올 때 유용.
  // print(c); << 실행되지 않는다.
//sex
  const d = 'dave'; //상수이지만, 컴파일 할 때 알아야 한다는, 고정되어 있는 값이 있어야 한다는 점에서
  //final과 다르다.앱이 실행중일 때 사용자에게 입력받아야 하는 값에는 사용할 수 없다는 의미.
}

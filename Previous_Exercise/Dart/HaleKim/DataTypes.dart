void main(List<String> args) {
  String name = 'hale'; //dart의 자료형들은 전부 class(객체)
  bool alive = true;
  int age = 24;
  double money = 11.11;
  num x = 12; //num은 int와 double의 부모 클래스. 정수도 소수도 들어갈 수 있다. x.~~() 와
  x = 1.1; //같이 변수마다 메서드 사용 가능

  var giveMeFive = true;
  var numbers = [
    1,
    2,
    3,
    4,
    if (giveMeFive) 5, //list 안에 불확실한 요소도 추가 가능. collection if
  ]; // List<int> numbers = [1,2,3,4,5] 도 가능. 끝에는 항상 콤마(,)로 마무리. 여러 줄로 보는게 유리.
  numbers.last; // = 1  .add() 등과 같은 메서드들도 마찬가지로 사용 가능.

  var eName = 'hale';
  var eAge = 24;
  var greeting =
      'Hello everyone, my name is $eName and I\'m ${eAge + 1}.'; //String Interpolation
  print(greeting); //String 안에 $변수 or ${변수와 계산식}, String 안에 ' 나 " 주의, \ 와 같이 사용

  var oldFriends = ['nico', 'lynn'];
  var newFriends = [
    'lewis',
    'ralph',
    'darren',
    for (var friend in oldFriends) //collection for
      "♡ $friend", //= for(var friend in oldFriends) {newFriends.add()}(하트빼고)
  ];
  print(newFriends);

  var player = {
    //Map = python의 dictionary key:value
    //Map<String, Object> Dart에서는 모든 것이 객체라서 Object가 최상위 클래스이고, object 자리에는 모든 형태가 다 올 수 있다는 의미. Map 사용은 지양. class 사용 권장
    'name': 'hale',
    'xp': 19.99,
    'superpower': false,
  };
  Map<int, bool> player2 = {
    1: true,
    2: false,
  }; //내부 요소로는 list, map 다 가능.map도 다른 것들의 요소가 될 수 있음.

  var/*= Set<int>*/ numbers2 = {1, 2, 3, 4}; //set은 list와 달리 중괄호 사용, 요소중복불가.
}

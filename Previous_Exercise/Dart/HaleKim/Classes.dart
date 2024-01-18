// ↓ class property에 final, static const 말고 그냥 const를 쓰면 안 되는 이유
//붕어빵 틀을 만들고(class를 코딩하며 정의하고) 붕어빵을 찍어낼 때
//(실제 런타임에서 class 인스턴스를 생성할 때) 붕어빵의 내용물,외형(만들어진 인스턴스의 속성들)
//들이 만들어지는데, 내가 붕어빵에 A라는 문자를 새기고 싶은데 붕어빵을 만들때마다 만들고 A를 새기면
//(한 번 새기면 변하지 않음.)붕어빵마다 조금씩 다른 A가, 붕어빵들끼리 공유되지 않는 상수값을 가지게 됨.
//붕어빵마다 각자의 고유한 상수를 가지게 된다는 것.
//상수는 정의상 변하지 않는 값을 의미하므로, 논리적으로 모순.
//아예 틀에 A를 새겨놓고 찍게 되면(코드짤때, 정의할때 static const로 선언하면)
//모든 붕어빵들이 동일한 A를(상수를) 공유하게 됨. 약간의 비문이 있는 예시

//const는 코딩 중에, 컴파일 할 때 미리 고정되어 있어야 하는 상수인데
//클래스의 인스턴스는 실제 런타임 때 생성되므로 클래스 안의 const 상수도 런타임 중에
//생성이 되게 된다는건데, 런타임 중에 생성되고 고정되는 값이 const를 갖는다는 게 논리적으로 x.

abstract class Human {
  //abstract(추상적인) class - 부모 클래스
  void walk();
}

enum Team { Red, Blue } //임의로 변수 타입 설정 내부는 자료형 선언 필요 없음.

class Player extends Human {
  //Human class 에게 상속받은 player class
  String name;
  int xp;
  Team team;

  // Player(this.name, this.xp, this.team); 생성자 - positional argument

  // Player({
  //   this.name = 'Anon',
  //   this.xp = 0,
  //   this.team = 'Red',
  // }); //생성자 - named argument_default value

  Player({
    required this.name,
    required this.xp,
    required this.team,
  }); //기본 생성자 - named argument_required

  Player.createBluePlayer({
    //named constructor
    required String name,
  })  : this.name = name, //생성자 class property 설정 syntax - 콜론(:) 사용
        this.xp = 0,
        this.team = Team.Blue;

  Player.createRedPlayer(String name) //positional parameters
      : this.name = name,
        this.xp = 0,
        this.team = Team.Red;

  Player.fromJson(Map<String, dynamic> playerJson)
      : name = playerJson['name'],
        xp = playerJson['xp'],
        team = playerJson['team'];

  void sayHello() {
    //player 메소드
    print(
        'Hello, my name is $name.'); //클래스 내의 메소드에서 클래스의 property를 사용할 때 this 불필요.
  } //메소드 내에서 같은 이름의 지역변수가 선언된게 아니라면 this를 사용하지 않는 게 권장.

  void walk() {
    print('$name is walking...');
  }
}

void main(List<String> args) {
  var player1 = Player(
    team: Team.Red,
    xp: 1000,
    name: 'Hale',
  ); //new는 필수 아님.
  // player1.name = 'Dave'; class instance property 변경

  var bluePlayer = Player.createBluePlayer(name: 'Dave');
  var redPlayer = Player.createRedPlayer('Chan');

  var apiData = [
    //Map<String, dynamic> 형태의 자료들을 가지는 List형 자료(json)
    {
      'name': 'Hale',
      'team': 'Red',
      'xp': 0,
    },
    {
      'name': 'Dave',
      'team': 'Red',
      'xp': 0,
    },
    {
      'name': 'Chan',
      'team': 'Red',
      'xp': 0,
    },
  ];

  apiData.forEach((playerJson) {
    //list 내의 요소들을 한 번씩 쭉 접근하는 함수 - List.foreach((list내요소의가명) {액션})
    var players = Player.fromJson(playerJson);
    players.sayHello();
  });

  // var me = Player(name: 'Hale', xp: 2000, team: 'Red');
  // me.name = 'a';
  // me.xp = 0;
  // me.team = '?';
  // =
  var me =
      Player(name: 'Hale', xp: 2000, team: Team.Red) //cascade notation(종속 표기법)
        ..name =
            'a' //꼭 객체 생성 직전이 아니여도 가능. 바로 전에 class가 있다면 자동으로 그 class를 가리킴. 여기서는 me 객체 - property 변경, 메소드 실행 등 모두 가능.
        ..xp = 0
        ..team = Team.Blue
        ..sayHello();
}

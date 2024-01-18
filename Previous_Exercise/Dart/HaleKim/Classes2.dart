class Human {
  //부모 클래스
  final String name;
  Human({required this.name}); //named argument
  void sayHello() {
    print('Hi my name is $name');
  }
}

mixin class Strong {
  //mixin class로 생성하면 단독 class로도 사용 가능
  //Mixin class - 생성자가 없는 class, 상속이 아니라 내용물을 그냥 건네줌.
  final double strengthLevel = 1500.99;
}

mixin QuickRunner {
  //mixin으로 생성하면 단독 사용 불가
  void runQuick() {
    print('Ruuuuuuuun!');
  }
}

mixin Tall {
  final double height = 1.99;
}

enum Team { blue, red } //Team enum 생성

class Player extends Human with Strong, QuickRunner, Tall {
  final Team team;

  Player({
    required this.team,
    required String name,
  }) : super(name: name); //super() 은 부모 클래스의 생성자를 불러오는 메소드

  @override
  void sayHello() {
    super.sayHello();
    print('and I play for $team');
  }
}

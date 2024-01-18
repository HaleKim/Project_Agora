void sayHello(String name) {
  //반환값이 없다. 출력만 함
  print("Hello $name nice to meet you!");
}

String sayHello2(String name) {
  //함수를 호출한 자리에 String을 반환한다.
  return "Hello $name nice to meet you!";
}
// = String sayHello2(String name) => "Hello $name nice to meet you!";
// 단순히 한 줄짜리 return 코드라면 중괄호 없이 => 사용 가능 (fat arrow syntax)

// String sayHello3({
//   String name = 'anon', int age = 99, String country = 'wakanda'
//   }) {
//   return "Hello $name, you are $age, and you come from $country";
// } user가 인수값을 입력하여 주지 않았을 때를 고려해 변수 디폴트 값 설정(default value)
String sayHello3({
  //named parameters(named argument)로 선언하려면 중괄호 필수
  required String name,
  required int age,
  required String country,
}) {
  return "Hello $name, you are $age, and you come from $country";
}

String sayHello4(String name, int age,
        [String? country = 'Korea']) => //optional positional parameters
    'Hello $name, you are $age years old from $country';

// String capitalizeName(String? name) {
//   if (name != null) {
//     return name.toUpperCase();
//   }
//   return 'Anon';
// } 길게 작성할 때
// String capitalizeName(String? name) => name != null ? name.toUpperCase() : 'Anon'; 조금 길게
//name != null 이 true이면 name.toUpperCase(), false면 'Anon' 반환
String capitalizeName(String? name) => name?.toUpperCase() ?? 'Anon'; //제일 짧게
//left ?? right 일 때 left가 null이 아니면 그대로 left 반환, null이면 right 반환
//?와 ??(QQ)는 둘 다 무언가를 return, 반환할 때만 사용 가능한 것으로 보임.

typedef ListOfInts = List<int>; //앞으로 List<int>를 ListOfInts 라고 불러도 된다. 라는 선언
ListOfInts reverseListOfNumbers(ListOfInts list) {
  var reversed = list.reversed;
  return reversed.toList();
}

void main(List<String> args) {
  String name = 'hale';
  int age = 25;
  String country = 'Korea'; //변수 설정(계속값으로입력하기귀찮아서)

  print(sayHello2(name));

  print(sayHello3(
    name: name,
    age: age,
    country: country,
  )); //named argument(인수 순서 무시하고 입력) -> 이를 위해 default value생성 or required 인수 설정 필요
  //sayHello3(); 는 실행되지 않음. 반대는 positional parameters

  print(
      sayHello4(name, age)); //country parameter은 optional이므로 없어도 디폴트값으로 동작 가능.

  capitalizeName(name);
  capitalizeName(null);
  String? name2;
  name2 ??= 'Dave'; //left ??= right left가 null이라면 right를 left에, null이 아니면 넘어감.
  //??가 들어가는 operator는 null과 관련된 것으로 기억.
}

import 'package:flutter/material.dart';
import 'package:toonflix/widgets/Button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(const App()); //widget 형 자료를 인수로 받는 함수
} //flutter의 모든 요소들은 widget이다. 레고 블럭과 같이 생각.

class App extends StatelessWidget {
  const App({super.key});

  //main의 runapp에 들어가있으므로 App이 root.
  //그냥 class인 App을 widget으로 만들어주기위해 core widget 중 하나인 statelesswidget 상속.
  @override
  Widget build(BuildContext context) {
    //뭐든 입력받아 화면에 띄워줌. widget들을 받아 ui로 띄워줌(return)..
    //widget을 사용하기 위해서는 반드시 build method를 구현해야함.
    return MaterialApp(
      home: Scaffold(
        //home 화면에 대한 정의
        //scaffold는 화면의 기본 골자.구성 및 구조가 되는 class
        backgroundColor: const Color(
            0xFF181818), //cumtomized 된 색을 사용하고 싶으면 Color() 이용 팔레트에서 fromARGB, fromRGBO 로도 사용 가능
        body: SingleChildScrollView(
          //user가 스크롤을 조작하게해주는 widget
          child: Padding(
            //여백을 주기 위한 class
            padding: const EdgeInsets.symmetric(
              //padding argument - 수직.수평 여백
              horizontal: 13,
            ),
            child: Column(
              //메인 column
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //메인 column children
                const SizedBox(
                  //크기를 가진 박스 생성 class, 간격 생성을 위해 사용.
                  height: 10,
                ),
                const Row(
                  //최상단 row
                  mainAxisAlignment: MainAxisAlignment
                      .end, //row main은 가로, column main은 세로 정렬.(가로 이동, 세로 이동.)
                  children: [
                    Column(
                      //최상단 text 정렬 column
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Hey, Selena',
                          style: TextStyle(
                              color: Colors.white, //정해진 색상을 사용하려면 Colors.~ 사용
                              fontSize: 28,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.8), //투명도
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Total balance',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 22,
                  ),
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                const Text(
                  '\$5 194 482',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, //children 사이에 공간을 만드는 속성.
                  children: [
                    Button(
                      text: 'Transfer',
                      bgColor: Color(0xFFF2B33A),
                      textColor: Colors.black,
                    ),
                    Button(
                      text: 'Request',
                      bgColor: Color(0xFF1F2123),
                      textColor: Colors.white,
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment
                      .end, //viewall을 밑으로 정렬(row에서 세로 이동이니 cross축)
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, //row에서 서로 거리 두게 가로 이동 -> main축
                  children: [
                    const Text(
                      'Wallets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const CurrencyCard(
                  name: 'Euro',
                  code: 'EUR',
                  amount: '6 428',
                  icon: Icons.euro_rounded,
                  isInverted: false,
                ),
                Transform.translate(
                  offset: const Offset(
                    0,
                    -20,
                  ),
                  child: const CurrencyCard(
                    name: 'Dollar',
                    code: 'USD',
                    amount: '55 622',
                    icon: Icons.monetization_on_outlined,
                    isInverted: true,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -40),
                  child: const CurrencyCard(
                    name: 'Rupee',
                    code: 'INR',
                    amount: '28 981',
                    icon: Icons.currency_rupee_rounded,
                    isInverted: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ); //Material은 google, cupertino는 apple
  } //모든 것은 widget. widget 안에 widget.. 그리고 widget은 class.
} //class 자체의 속성을 바꾸려면 해당 argument 입력, 요소를 넣으려면 child, children widget을 argument로 추가.
//const 자동완성 기능으로 인해 오류가 생길 때가 잦으니, 오류 내용을 확인하고
//const 에러이면 해당하는 const를 잘 찾아서 지워주기.

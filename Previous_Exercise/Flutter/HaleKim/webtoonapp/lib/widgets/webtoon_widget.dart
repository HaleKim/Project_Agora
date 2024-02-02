//홈화면에서의 웹툰 위젯 스크립트

import 'package:flutter/material.dart';
import 'package:webtoonapp/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //사용자의 제스처를 감지하는 위젯
      onTap: () {
        Navigator.push(
          //애니메이션을 이용하여 새로운 페이지로 이동시켜줌.
          context,
          // MaterialPageRoute(
          //   //MaterialPageRoute은 push의 route 자리에 statelesswidget을 랜더해주는 클래스. 애니메이션은 os의 기본 설정을 따름.
          //   builder: (context) => DetailScreen(
          //     title: title,
          //     thumb: thumb,
          //     id: id,
          //   ),
          PageRouteBuilder(
            //운영체제에 따르지 않는 애니메이션 적용
            transitionsBuilder: //트랜지션을 명시
                (context, animation, secondaryAnimation, child) {
              var begin = const Offset(0, 1);
              var end = Offset.zero;
              var curve = Curves.ease;
              //편리를 위한 변수 설정
              var tween = Tween(
                begin: begin,
                end: end,
              ).chain(
                //슬라이드의 시작점과 끝점을 정하는 tween
                CurveTween(
                  curve: curve,
                ),
                //curve에 대해 정의하는 curvetween
              );
              return SlideTransition(
                //슬라이드 애니메이션 리턴
                position: animation.drive(tween),
                child: child,
              );
            },
            pageBuilder: (context, animation, secondaryAnimation) =>
                DetailScreen(title: title, thumb: thumb, id: id),
            //새롭게 라우팅 할 위젯을 명시
            fullscreenDialog: true,
            //페이지를 풀스크린으로 라우팅할지 카드로 라우팅할지 결정
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            //tag가 같은 부분을 이어지게 애니메이션을 만들어주는 클래스
            tag: id,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      offset: const Offset(10, 10),
                      color: Colors.black.withOpacity(0.5),
                    )
                  ]),
              width: 220,
              child: Image.network(
                thumb,
                headers: const {'Referer': 'https://comic.naver.com'},
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}

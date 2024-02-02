//홈화면 스크립트

import 'package:flutter/material.dart';
import 'package:webtoonapp/models/webtoon_model.dart';
import 'package:webtoonapp/services/api_service.dart';
import 'package:webtoonapp/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //screen을 위한 기본적인 레이아웃과 설정 제공.
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true, //타이틀가운데로
        elevation: 2,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        //backgroundcolor은 기본적인 배경색이고, surfacetintcolor은 추가적인 색조를 설정해주는 속성.
        foregroundColor: Colors.green, //글자색
        title: const Text(
          '오늘의 웹툰',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder(
        //stateless widget에서도 데이터가 로딩되고 있는 중인지, 로딩됐는지 변화를 표현하는 것이 가능. futurebuilder.
        future: webtoons, //futures 인수를 통해 await를 알아서 해줌. 기다릴 값.
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //snapshot을 통해 변화를 알려줌. snapshot = state of future.
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot)),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(), //가운데에 빙글빙글 도는 로딩 표시.
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      //많은 요소들을 표현할 때는 ListView가 적절. not column, row ListView.builder가 더 최적화된 widget.(그냥 ListView는 한 번에 죄다 불러와서 메모리가 위험, ListView.builder은 현재화면만)
      // Listview.separated는 Listview.builder에서 요소 사이사이에 구분자를 넣어주는 기능 추가.
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        //ListView의 아이템을 만드는 함수를 받는 인수. 함수의 인수에는 List의 인덱스가 들어감.
        var webtoon = snapshot.data![index];
        // print(index);
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        //구분자를 넣는 함수를 넣는 인수
        width: 40,
      ),
    );
  }
}

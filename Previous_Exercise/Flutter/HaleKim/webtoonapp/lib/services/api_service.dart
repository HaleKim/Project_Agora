//API에 요청을 보내고 json 형식의 파일을 받아 class들로 구성된 list로 변환하는 class를 정의하는 스크립트

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoonapp/models/webtoon_detail_model.dart';
import 'package:webtoonapp/models/webtoon_episode_model.dart';
import 'package:webtoonapp/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    //API에서 webtoon json data를 받아와 webtoonModel class의 list로 저장하여 반환해주는 함수
    //async 함수에서는 반환값을 future안에 넣어야 한다.
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    //future은 안에 있는 값을 미래에 받을 것이라는 의미, 그 받은 결과값은 response
    //http.get 을 통해 서버에 request를 보내면 원하는 데이터를 받는 데에 시간이 오래 걸릴 수 있다. 코드가 데이터를 받지 않은 상태로 쭉쭉 넘어가면 안되므로, request를 보내는 부분에 await를 붙여 데이터를 받을 때 까지 대기하게 한다. await를 함수에서 사용하기 위해서는 함수를 async(비동기)로 정의해야 한다. 보통 future과 같은 타입과 await를 같이 사용.
    if (response.statusCode == 200) {
      final List<dynamic> webtoons =
          jsonDecode(response.body); //받은 string 값을 json으로 디코드
      //json 파일은 여러 개의 object들로 구성된 list로 인식됨.(Map<String, dynamic>)
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      } //webtoonmodel class들로 구성된 webtoonInstances list에 json에서 가져온 데이터들을 하나씩 저장.
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    //API에서 특정 webtoon json data를 받아와 WebtoonDetailModel class로 저장하여 반환해주는 함수
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    //API에서 특정 webtoon의 episode 들의 json data를 받아와 WebtoonEpisodeModel들의 list로 저장하여 반환해주는 함수
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}

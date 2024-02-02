class WebtoonModel {
  //json 형식으로 받아 온 웹툰의 정보들을 class 형식으로 저장하기 위한 class
  final String title, thumb, id;

  WebtoonModel.fromJson(Map<String, dynamic> json) //named constructor
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];

  /* 둘은 같으나, 잘 쓰이는 패턴은 아니다.
  late final String title, thumb, id;
    WebtoonModel(Map<String, dynamic> json) {
        title = json['title'];
        thumb = json['thumb'];
        id = json['id'];
        }
   */
}

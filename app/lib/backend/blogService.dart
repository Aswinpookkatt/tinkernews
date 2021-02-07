import 'package:http/http.dart' as http;
import 'package:news_app/models/newsModel.dart';
import 'dart:convert';


class Blog{

  List<NewsModel> blogdata = [];

  // to fetch blog on a different device enter the network ip value here

  var ip = "192.168.43.9";

  Future<void> getBlog() async {
    String url = "http://${ip}:5000/api/news";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {

          NewsModel article = NewsModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element["content"],
            Date : element["date"],
            articleUrl: element["url"],
          );
          blogdata.add(article);

        }
      });
    }
  }


}



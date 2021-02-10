import 'package:http/http.dart' as http;
import 'package:news_app/models/newsModel.dart';
import 'dart:convert';


class Blog{

  List<NewsModel> blogdata = [];



 // var ip = my netowork ip;  used when hosted locally
 
  Future<void> getBlog() async {
    //String url = "http://${ip}:5000/api/news";
    String hosted = "https://tinkernews.herokuapp.com/api/fetch";

    var response = await http.get(hosted);

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



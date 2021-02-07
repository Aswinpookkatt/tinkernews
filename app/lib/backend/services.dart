import 'package:http/http.dart' as http;
import 'package:news_app/models/newsModel.dart';
import 'dart:convert';

var MonthPicker={"1":"January","2":"February","3":"March","4":"April","5":"May",
  "6":"June","7":"July","8":"August","9":"September","10":"October","11":"November","12":"December"};
class News{
  var apiKey ="06a533810b95411cb4a3e36426d3bca6";
  List<NewsModel> news = [];

  Future<void> getNews(String category) async {
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=${category}&sortBy=publishedAt&language=en&apiKey=${apiKey}";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          var dateConvert = DateTime.parse(element['publishedAt']);
          var finalDate = " ${dateConvert.day} ${MonthPicker['${dateConvert.month}']} ${dateConvert.year}";
          NewsModel article = NewsModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            Date : finalDate,
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);

        }
      });
    }
  }


}

class NewsForCategorie {

  var apiKey = "06a533810b95411cb4a3e36426d3bca6";
  List<NewsModel> news = [];

  Future<void> getNewsForCategory(String category) async {


    String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=${apiKey}";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          var dateConvert = DateTime.parse(element['publishedAt']);
          var finalDate = "${MonthPicker['${dateConvert.month}']} ${dateConvert
              .day}";
          NewsModel article = NewsModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            Date: finalDate,
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}

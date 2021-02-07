class NewsModel{

  String title;
  String author;
  String description;
  String urlToImage;
  DateTime publshedAt;
  String content;
  String articleUrl;
  String Date;


  NewsModel({this.title,this.description,this.author,this.content,this.publshedAt,
    this.urlToImage, this.articleUrl,this.Date});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'url': urlToImage,
      'date': Date,
      'content' : content,
    };
  }

  Map<String, dynamic> toJson() =>{

      "title": title,
      "url": urlToImage,
      "date": Date,
      "content" : content,
    };
}
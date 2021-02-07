import 'package:flutter/material.dart';
import 'package:news_app/backend/services.dart';
import 'NewsTile.dart';

class tabbarContent extends StatefulWidget {
  final String text;
  tabbarContent(  this.text);




  @override
  _tabbarContentState createState() => _tabbarContentState();
}

class _tabbarContentState extends State<tabbarContent>  with SingleTickerProviderStateMixin {


  var newslist;
  bool _loading;

  void getNews() async {

    News news = News();
//    Blog b = Blog();
  //  await b.getBlog();

    //print(widget.text);
    await news.getNews(widget.text);
    newslist = news.news;
 //   newslist = b.blogdata;

    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading = true;
    getNews();

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _loading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[

              /// News Article
              Container(
                margin: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: newslist.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsTile(
                        imgUrl: newslist[index].urlToImage ?? "",
                        title: newslist[index].title ?? "",
                        desc: newslist[index].description ?? "",
                        content: newslist[index].content ?? "",
                        //posturl: newslist[index].articleUrl ?? "",
                        date : newslist[index].Date ?? "",
                      );
                    }),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

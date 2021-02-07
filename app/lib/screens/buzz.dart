import 'package:flutter/material.dart';
import 'package:news_app/backend/services.dart';
import 'package:news_app/widgets/NewsTile.dart';

class Buzz extends StatefulWidget {
  @override
  _BuzzState createState() => _BuzzState();
}

class _BuzzState extends State<Buzz> with SingleTickerProviderStateMixin  {

  var newslist;
  bool _loading;

  void getNews() async {

    News news = News();
    //print(widget.text);
    await news.getNews("general");
    newslist = news.news;

    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading = true;
    // second.getNews();
    getNews();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        toolbarHeight: 60.0,
        leading: Image.asset("assets/images/icon.jpg"),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("What's Buzzing",style: TextStyle(
          color: Colors.black,fontFamily: "FallingSky",fontSize: 23,
        ),),


      ),
      body:  SafeArea(
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
      ),

      backgroundColor: Colors.cyan,
    );
  }
}

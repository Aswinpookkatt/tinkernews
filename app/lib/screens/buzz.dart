import 'package:flutter/material.dart';
import 'package:news_app/backend/services.dart';
import 'package:news_app/models/bookmarkdb.dart';
import 'package:news_app/widgets/NewsTile.dart';
import 'package:toast/toast.dart';
var headlines;
class Buzz extends StatefulWidget {
  @override
  _BuzzState createState() => _BuzzState();
}

class _BuzzState extends State<Buzz> with SingleTickerProviderStateMixin  {


  bool _loading;

  void getNews() async {

    News news = News();
    //print(widget.text);
    await news.getNews("general");
    headlines = news.news;

    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(headlines==null){
      _loading = true;
      getNews();
    }
    else{
      _loading =false;
    }



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        toolbarHeight: 60.0,
        leading: Image.asset("assets/images/icon.jpg"),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("News Headlines",style: TextStyle(
          color: Colors.black,fontFamily: "FallingSky",fontSize: 23,fontWeight: FontWeight.bold
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
                        itemCount: headlines.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return NewsTile(
                            imgUrl: headlines[index].urlToImage ?? "",
                            title: headlines[index].title ?? "",
                            desc: headlines[index].description ?? "",
                            content: headlines[index].content ?? "",
                            //posturl: newslist[index].articleUrl ?? "",
                            date : headlines[index].Date ?? "",

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

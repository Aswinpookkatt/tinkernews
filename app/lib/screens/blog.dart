import 'package:flutter/material.dart';
import 'package:news_app/backend/blogService.dart';
import 'package:news_app/widgets/BlogTile.dart';


class TinkerBlog extends StatefulWidget {
  @override
  _TinkerBlogState createState() => _TinkerBlogState();
}

class _TinkerBlogState extends State<TinkerBlog> with SingleTickerProviderStateMixin {

  var Bloglist;
  bool _loading;

  void getBlog() async {

    Blog b = Blog();
    //print(widget.text);
    await b.getBlog();
    Bloglist = b.blogdata;

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
    getBlog();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        toolbarHeight: 60.0,
        leading: Image.asset("assets/images/icon.jpg"),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("TinkerBlog",style: TextStyle(
          color: Colors.black,fontFamily: "Avenir",  fontWeight: FontWeight.bold,fontSize: 23,
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
                      itemCount: Bloglist.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return BlogTile(
                          imgUrl: Bloglist[index].urlToImage ?? "",
                          title: Bloglist[index].title ?? "",
                          desc:Bloglist[index].description ?? "",
                          content: Bloglist[index].content ?? "",
                          date : Bloglist[index].Date ?? "",
                        );
                      }),
                ),

              ],
            ),
          ),
        ),
      ),

      backgroundColor:Colors.blue[800],
    );
  }
}

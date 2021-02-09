import 'package:flutter/material.dart';
import 'package:news_app/models/bookmarkdb.dart';
import 'package:news_app/widgets/NewsTile.dart';
import 'package:toast/toast.dart';
class Bookmark extends StatefulWidget {
  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  var _loading;
  List<Map<String,dynamic>> queryRows;
  @override
  void initState(){
    // TODO: implement initState
    _loading=true;
    _fetchData();
    super.initState();
  }
  void _fetchData ()async{
    queryRows  = await BookmarkHelper.instance.queryAll();
    print(queryRows);
    setState(() {
      _loading=false;
    });
    if(queryRows.isEmpty==true){
      Toast.show("No bookmarks added", context, duration:Toast.LENGTH_LONG, gravity: Toast.CENTER);
    }


  }
@override
  void didUpdateWidget(Bookmark oldWidget) {
    // TODO: implement didUpdateWidget
    _fetchData();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[800],
      appBar:  AppBar(
        toolbarHeight: 60.0,
        leading: Image.asset("assets/images/icon.jpg"),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Bookmarks",style: TextStyle(
          color: Colors.black,
        ),),

        ),
      body: SafeArea(
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
                      itemCount: queryRows.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return NewsTile(
                          id : queryRows[index]['id'] ?? "",
                          title: queryRows[index]['title'] ?? "",
                          date : queryRows[index]['date'] ?? "",
                          imgUrl: queryRows[index]['image'] ?? "",
                          desc: queryRows[index]['content']?? "",
                          pressed : queryRows[index]['pressed']?? "",
                         // content: queryRows[index].content ?? "",
                          //posturl: newslist[index].articleUrl ?? "",

                        );
                      }),
                ),


              ],
            ),
          ),
        ),
      ),



    );
  }


}

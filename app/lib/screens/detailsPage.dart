
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:news_app/models/bookmarkdb.dart';
import 'package:toast/toast.dart';

import 'bookmark.dart';



class DetailsPage extends StatefulWidget {


  final String imageUrl, newstitle, newscontent,postdate,pressed;
  final int id;


  const DetailsPage({Key key, this.id,this.postdate,this.pressed, @required this.imageUrl, @required this.newstitle, @required this.newscontent}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<Map<String,dynamic>> queryRows;
  int copyId;
  //BookmarkHelper _bookmarkHelper =  BookmarkHelper();
  final FlutterTts _flutterTts = FlutterTts();
  var ttsState,_bookmarkadded=false;
  var bookmarkpressedPreviously;
  var _playing = false;
  Icon _icon_play = Icon(Icons.play_arrow);
  Icon _icon_bookmark = Icon(Icons.bookmark_border,color: Colors.green[800],);
  @override
  void initState(){

    _playing = false;
    if(widget.pressed=="true"){
      _icon_bookmark = Icon(Icons.bookmark,color: Colors.green[800],);
    }


      _flutterTts.setStartHandler(() {
        setState(() {
          print("playing");
          _playing  = true;
          _icon_play= Icon(Icons.stop,color: Colors.white,);

        });
      });
      _flutterTts.setCompletionHandler(() {
        setState(() {
          print("Complete");
          _playing  = false;
          _icon_play = Icon(Icons.play_arrow,color: Colors.white,);

        });
      });
      _flutterTts.setErrorHandler((msg) {
        setState(() {
          _playing  = false;
          _icon_play = Icon(Icons.play_arrow,color: Colors.white,);
          print("error: $msg");

        });
      });

   // print(widget.pressed);
    if(widget.pressed == "true"){
      _icon_bookmark = Icon(Icons.bookmark,color: Colors.green[800],);
      _bookmarkadded = true;
    }
    else{
      _icon_bookmark = Icon(Icons.bookmark_border,color: Colors.green[800],);
    }

    super.initState();
  }





  _insertBookmark() async{

     int  i = await BookmarkHelper.instance.insert({
      BookmarkHelper.columnTitle: widget.newstitle,
      BookmarkHelper.columnDate : widget.postdate,
      BookmarkHelper.columnImg : widget.imageUrl,
      BookmarkHelper.columnContent : widget.newscontent,
      BookmarkHelper.columnPressed : "true"
    });
     copyId = i;
    print('THE INSERTED ID IS $i');

    setState(() {
      _icon_bookmark = Icon(Icons.bookmark,color: Colors.green[800],);
      _bookmarkadded = true;
    });

  }

  _deleteBookmark(int i)async{
    int rowsAffected= await BookmarkHelper.instance.delete(i);
    print(rowsAffected);
    print("removed from bookmark");
   setState(() {
     _icon_bookmark = Icon(Icons.bookmark_border,color: Colors.green[800],);
     _bookmarkadded = false;
   });

  }
 @override
  void didUpdateWidget(DetailsPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {


    Future _speak(String text) async{
      await _flutterTts.setLanguage("en-IN");
      await _flutterTts.setPitch(1);
      await _flutterTts.setSpeechRate(1.2);
      var result = await _flutterTts.speak(text);
      if (result == 1) setState(() => _playing = true);

    }

    Future _stop() async{
      var result = await _flutterTts.stop();
      if (result == 1) setState(() => _playing = false);

    }


    return WillPopScope(
      onWillPop: ()async{
        _stop();
        return true;
      },
      child: Container(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                         Image.network(
                          widget.imageUrl,
                          fit: BoxFit.cover,
                          height: 240.0,
                        ),
                    SizedBox(height: 12,),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Icon(
                                  Icons.date_range,
                                  size: 17.0,
                                  color: Colors.blue[800],
                                ),
                              ),
                              Text(
                                 widget.postdate,
                                style: TextStyle(
                                  fontSize: 12.0,
                                color: Colors.grey[800]),
                              ),
                              Spacer(),

                              IconButton(
                                onPressed: () {

                                  setState(() {


                                    if(_bookmarkadded == false && widget.pressed!="true"){

                                       _insertBookmark();
                                       _bookmarkadded = true;
                                       Toast.show("Added to bookmarks", context, duration:Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                                    }
                                    else{

                                      var id = widget.id;
                                      if(id==null){
                                        id = copyId;
                                      }
                                      _deleteBookmark(id);
                                      _bookmarkadded = false;
                                      Toast.show("Removed from bookmarks", context, duration:Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                                    }
                                  });

                                },
                                icon: _icon_bookmark,
                              ),

                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.newstitle,
                                style: TextStyle(
                                  fontFamily: "FallingSky",
                                  fontSize: 17.0,
                                  letterSpacing: 1.4,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.newscontent,
                              style: TextStyle(
                                fontFamily: "avenir",
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0,
                                letterSpacing: .6,
                                wordSpacing: 1.6,
                                height: 1.3,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _stop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Spacer(),

                ],
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            backgroundColor:Color(0xFFFF0505),
            child: IconButton(icon: _icon_play,
            onPressed: (){
              print(_playing);

                if(_playing == false){
                  var content = widget.newstitle+".\n"+widget.newscontent;
                  _speak(content);//
                  if (this.mounted) {
                    setState(() {
                      _icon_play = Icon(Icons.stop,color: Colors.white,);
                    });
                  }


                  print("works");
                }
                else {
                  if (this.mounted) {
                    setState(() {
                      _icon_play = Icon(Icons.play_arrow, color: Colors.white,);
                    });

                    _stop();
                  }
                }


            },),//PlayerWidget(),
            shape: CircleBorder(),
          ),
        ),
      ),
    );
  }
}

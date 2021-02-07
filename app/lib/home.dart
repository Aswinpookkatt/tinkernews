import 'dart:io';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/screens/About.dart';
import 'package:news_app/screens/blog.dart';
import 'package:news_app/screens/bookmark.dart';
import 'package:news_app/screens/buzz.dart';
import 'package:news_app/screens/homepage.dart';




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  void changePage(int index){
    setState((){
      currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    checkConnection();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void checkConnection() async{
    try{
      final result = await InternetAddress.lookup('google.com');
      if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
        print("Connected");
      }

    } on SocketException catch (_) {
      print("not connected");
      _showDialog(context);

    }


  }

  void _showDialog( BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: new Text("Error! No Internet"),
              content: new Text("Please Connect to Internet to continue"),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () {
                      checkConnection();
                      //Navigator.of(context).pop();
                      SystemNavigator.pop();
                    },
                    child: new Text("Exit"))
              ]
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 30,),
            DrawerHeader(child:Container(
              height: 140,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/"),
            ))
          ],
        ),
      ),

      body: <Widget>[
        Buzz(),
        TinkerBlog(),
        HomePage(),
        Profile(),
        Bookmark(),

      ][currentIndex],
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        opacity: 0,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                16)), //border radius doesn't work when the notch is enabled.
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.whatshot,
                color: Colors.cyan,
              ),
              activeIcon: Icon(
                Icons.whatshot,
                color: Colors.cyan,
              ),
              title: Text("Buzz")),
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.border_color,
                color: Colors.blue[800],
              ),
              activeIcon: Icon(
                Icons.border_color,
                color: Colors.blue[800],
              ),
              title: Text("Blog")),
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.home,
                color: Color(0xFFF9AC2F  ),
              ),
              activeIcon: Icon(
                Icons.home,
                color: Color(0xFFF9AC2F  ),
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.info,
                color: Color(0xFFFF0505),
              ),
              activeIcon: Icon(
                Icons.info,
                color: Color(0xFFFF0505),
              ),
              title: Text("About")),
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.bookmark,
                color: Colors.green[800],
              ),
              activeIcon: Icon(
                Icons.bookmark,
                color: Colors.green[800],
              ),
              title: Text("Bookmark")),

        ],
      ),


    );
  }
}




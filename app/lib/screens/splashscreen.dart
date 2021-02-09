import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/backend/blogService.dart';

import '../home.dart';
var Bloglist;

class SplashScreen extends StatefulWidget {
  final Color backgroundColor = Colors.white;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final splashDelay = 5;
  bool _loading;
  @override
  void initState() {
    super.initState();

    _loadWidget();
    _loading = true;
    getBlog();



  }

  void getBlog() async {

    Blog b = Blog();
    //print(widget.text);
    await b.getBlog();
    Bloglist = b.blogdata;

    setState(() {
      _loading = false;
    });
  }


  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: InkWell(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/icon.jpg',
                            height: 290,
                            width: 290,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                          ),
                        ],
                      )),
                ),
              Expanded(child: Text("TinkerNews",style: TextStyle(fontSize: 30,fontFamily:"times",fontWeight: FontWeight.bold,letterSpacing: 1.5),),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
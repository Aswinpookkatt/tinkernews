import 'package:flutter/material.dart';
import 'package:news_app/widgets/tabbarContent.dart';


String label;
class HomePage  extends StatefulWidget {


 HomePage({this.category});
 final String category;
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage > with SingleTickerProviderStateMixin{


  List<Tab> _tabList = [
    Tab(text:"Science"),
    Tab(text:"Technology"),
    Tab(text:"Entertainment"),
    Tab(text:"Business"),
    Tab(text:"Sports"),


  ];


  //tab controller
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // _loading = true;
   // second.getNews();
    // getNews();
    _tabController = TabController(vsync: this, length: _tabList.length);

  }
  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        toolbarHeight: 90.0,
        leading: Image.asset("assets/images/icon.jpg"),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("TinkerNews",style: TextStyle(
          color: Colors.black,fontFamily: "Avenir",  fontWeight: FontWeight.bold,fontSize: 23,
        ),),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: TabBar(
            indicatorColor:Colors.black ,
            labelColor: Colors.black,
            isScrollable: true,
            controller: _tabController,
            tabs: _tabList,
          ),
        ),

      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabList.map((Tab tab) {
            label = tab.text.toLowerCase();
          return tabbarContent(label);
        }).toList(),
      ),

      backgroundColor: Color(0xFFF9AC2F ),
    );
  }
}


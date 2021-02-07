import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final myController = TextEditingController();

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      myController.dispose();
      super.dispose();
    }


    _launchURL(String url) async {
    
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    Widget ProfileCard(){
      return Card(
        margin: EdgeInsets.all(8),
        child: Container(
          height: height*.90,
          padding: EdgeInsets.only(left: 10,top:23, right: 10),
          child: GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: ListView(

              children: [

                Text("About Us",style: TextStyle(
                    fontSize: 22,letterSpacing:1,
                    fontFamily: "avenir",
                    fontWeight: FontWeight.bold,
                  ),),

                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,

                          ),
                          boxShadow:[
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color:  Colors.black.withOpacity(.1),
                              offset:  Offset(0,5),
                            )
                          ],
                          shape:  BoxShape.circle,
                          image:DecorationImage(
                            fit: BoxFit.cover,
                            image:AssetImage("assets/images/icon.jpg"),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text("TinkerHub",style: TextStyle(
                      fontSize: 25,letterSpacing:1,
                      fontFamily: "avenir",
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
                SizedBox(height: height*.04,),

                Padding(
                    padding: const EdgeInsets.only(bottom:20.0),
                    child: Align(
                      child: Text(

                          "We are a community of tinkerers, makers, policy geeks & students and are working towards mapping and empowering people who share a passion to innovate.",
                        style: TextStyle(fontSize: 16,fontFamily: "avenir",wordSpacing: 2),
                      textAlign: TextAlign.justify,
                      ),
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom:20.0),
                    child: Text(
                        "TinkerHub Foundation is a not for profit organisation that is working on enabling people on technology learning and creation. We work with campus communities to create talent pool who can work in distruptive technologies for the common good.",
                        style: TextStyle(fontSize: 16,fontFamily: "avenir",wordSpacing: 2,),
                      textAlign: TextAlign.justify,
                    )
                ),

           SizedBox(height: height*.05,),

              Center(
                child:    RaisedButton(

                    onPressed: (){
                      _launchURL("http://join.tinkerhub.org/");
                    },

                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("Join Us",style: TextStyle(color: Colors.white),),
                )
              ),
                SizedBox(height: height*.05,),
              Row(
                    children: [
                      Expanded(
                        child:  IconButton(
                          onPressed: (){
                            _launchURL("https://www.facebook.com/tinkerhub/");
                          },
                          icon: FaIcon(FontAwesomeIcons.facebook,color: Colors.grey[600],),
                        ),
                      ),
                      Expanded(
                        child:  IconButton(
                          onPressed: (){
                            _launchURL("https://www.instagram.com/tinkerhub/");
                          },
                          icon: FaIcon(FontAwesomeIcons.instagram,color: Colors.grey[600],),
                        ),
                      ),
                      Expanded(
                        child:  IconButton(
                          onPressed: (){

                             _launchURL("https://www.youtube.com/channel/UCFojSagDFhBDSqLxDc1fjGQ/playlists");
                          },
                          icon: FaIcon(FontAwesomeIcons.youtube,color: Colors.grey[600],),
                        ),
                      ),


                      Expanded(
                        child:  IconButton(
                          onPressed: (){
                            _launchURL("https://t.me/TinkerHub");
                          },
                          icon:  FaIcon(FontAwesomeIcons.telegram,color: Colors.grey[600],),
                        ),
                      )
                    ],

              )

              ],

            ),
          ),
        ),

      );
    }
    return Scaffold(
      backgroundColor:Color(0xFFFF0505),

      body:ProfileCard(),



    );
  }
}

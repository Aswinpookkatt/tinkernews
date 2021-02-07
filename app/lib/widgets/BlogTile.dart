import 'package:flutter/material.dart';
import 'package:news_app/screens/detailsPage.dart';

class BlogTile extends StatelessWidget {
  final String imgUrl, title, desc, content,date,pressed;
  final int id;

  BlogTile({this.id,@required this.imgUrl,this.pressed, this.desc, @required this.title,@required this.content,this.date});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=> DetailsPage(
           // item: NewsTile[index],
              id : id,
              imageUrl :  imgUrl,
              newstitle : title,
              postdate : date,
              newscontent : desc,
              pressed: pressed,

          )
        ),
        );

      },
      child: Card(
        color: Color(0xfffedf4f5),
          margin: EdgeInsets.fromLTRB(10,0,10,12),

          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Hero(
              tag: title,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft:  Radius.circular(6))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          imgUrl,
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6),
                          child: Icon(Icons.date_range,size: 14,color: Colors.grey[800],),
                        ),
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 12.0,color: Colors.grey[800]
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:2),
                      child: Text(
                        title,
                        maxLines: 2,
                          style: TextStyle(
                            fontFamily: "FallingSky",
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
          )),
    );
  }
}

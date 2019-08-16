import 'package:flutter/material.dart';

class Faculty extends StatefulWidget
{
  FacultyPage createState()=> FacultyPage();
}
class FacultyPage extends State<Faculty> with SingleTickerProviderStateMixin
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.redAccent,
      body: Stack(
        children: <Widget>[
          Positioned.fill(
              top :50,
              bottom: 720,
              left:80,
              right:80,
              child:Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2,color: Colors.white),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(Icons.book,color: Colors.white,size: 32),
                      Text("I'm Faculty",style:new TextStyle(color: Colors.white,fontFamily: "OswaldR",fontSize: 18)),
                    ],
                  )
              )
          )
        ],
      ),
    );
  }

}
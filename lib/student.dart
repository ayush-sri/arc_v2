import 'package:flutter/material.dart';

class Student extends StatefulWidget
{
  StudentPage createState()=> StudentPage();
}
class StudentPage extends State<Student> with SingleTickerProviderStateMixin
{

  double _margin=15,_height=46,_width=250;

  Container BranchList(String title)
  {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      width: 50,
      child: Container(
       //child: RaisedButton(onPressed: _select)
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding:false,
      backgroundColor: Colors.blueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
            height: 42,
            width: 100,
            child: Image(image:AssetImage("assets/student.png")),
          ),
      Container(
          margin: EdgeInsets.fromLTRB(30, 40, 30, 0),
          padding: EdgeInsets.fromLTRB(15,0,0,0),
          height:_height,
          width:_width,
          decoration: BoxDecoration(
            border:Border.all(width: 1.2,color: Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
          child:  TextField(
            decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.black,fontFamily: 'OswaldR'),
                hintText: "Email or Phone",
                border: InputBorder.none
            ),
          )
      ),
          Container(
              margin: EdgeInsets.fromLTRB(30, 11, 30, 0),
              padding: EdgeInsets.fromLTRB(15,0,0,0),
              height:_height,
              width:_width,
              decoration: BoxDecoration(
                border:Border.all(width: 1,color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child:  TextField(
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black,fontFamily: 'OswaldR'),
                    hintText: "Password",
                    border: InputBorder.none
                ),
              )
          ),
          Container(
              margin: EdgeInsets.fromLTRB(30, 11, 30, 0),
              padding: EdgeInsets.fromLTRB(15,0,0,0),
              height:_height,
              width:_width,
              decoration: BoxDecoration(
                border:Border.all(width: 1,color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child:  TextField(
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black,fontFamily: 'OswaldR'),
                    hintText: "Roll number",
                    border: InputBorder.none
                ),
              )
          ),
          Container(
              margin: EdgeInsets.fromLTRB(30, 11, 30, 0),
              padding: EdgeInsets.fromLTRB(15,0,0,0),
              height:_height,
              width:_width,
              decoration: BoxDecoration(
                border:Border.all(width: 1,color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child:  TextField(
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black,fontFamily: 'OswaldR'),
                    hintText: "ERP ID",
                    border: InputBorder.none
                ),
              )
          ),
          Container(
              margin: EdgeInsets.fromLTRB(30, 11, 30, 0),
              padding: EdgeInsets.fromLTRB(15,0,0,0),
              height:_height,
              width:_width,
              decoration: BoxDecoration(
                border:Border.all(width: 1,color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 45,
                    child: Text("Branch",style: TextStyle(
                      fontFamily: "OswaldR",
                      color: Colors.black,
                      fontSize: 16
                    ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5,0,0,0),
                    width: 220,
                    child:
                    Padding(
                        padding: new EdgeInsets.fromLTRB(10,14,0,0),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            BranchList("CSE"),
                            BranchList("MECH"),
                            BranchList("CE"),
                            BranchList("EE"),
                            BranchList("ECE"),
                          ],
                        ),
                    ),
                  ),

                ],
              )
          ),
      /*Positioned.fill(
          top :60,
          bottom:400,
          left:80,
          right:80,
          child:Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2,color: Colors.black),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.school,color: Colors.black,size: 32),
                  Text("I'm Student",style:new TextStyle(color: Colors.black,fontFamily: "OswaldR",fontSize: 18)),
                ],
              )
          )
      ),*/

    ]
      )
    );
  }

}
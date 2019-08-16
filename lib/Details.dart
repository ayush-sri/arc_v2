import 'package:flutter/material.dart';
import 'package:arc_st/questions.dart';
import 'package:arc_st/attendance.dart';

class Details extends StatefulWidget
{
  Mynav createState()=> Mynav();
}
class Mynav extends State<Details>
{
  int _curr=0;
  bool _isVisible;
  Widget _currentTab(int index)
  {
    switch(index)
    {
      case 0: _isVisible=true;return new Questions();

      case 1: _isVisible=false;return new Attendance();
        break;
      default:
        return new Attendance();
    }
  }
  Mynav();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            color: Colors.green,
            height: 200.0,
            child: new Center(
            child: new Text("title",style:  Theme.of(context).textTheme.headline),
          ),
          ),
          _currentTab(_curr),
        ],
      ),
      floatingActionButton: new Opacity(opacity: _isVisible?1.0:0.0,
        child:new FloatingActionButton(
            elevation: 0.0,
            child:new Icon(Icons.add),
            backgroundColor:  Colors.tealAccent[400],
            onPressed:()
            {

            }
        ),),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _curr,
          onTap: (value){
            _curr=value;
            setState(() {

            });
          },
          items:[
            BottomNavigationBarItem(icon: new Icon(Icons.line_style),
                title: new Text("Question")),

            BottomNavigationBarItem(icon: new Icon(Icons.list),
                title: new Text("Students")),

          ]),
       floatingActionButtonLocation:
       FloatingActionButtonLocation.centerDocked,
       /* bottomNavigationBar: BottomNavigationBar(
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            items:[
             BottomNavigationBarItem(icon: new Icon(Icons.line_style),
             title: new Text("Question")),

             BottomNavigationBarItem(icon: new Icon(Icons.list),
                 title: new Text("Students")),

            ]),*/
    );
  }

}
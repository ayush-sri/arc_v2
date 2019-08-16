import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'Overview.dart';
import 'swipe.dart';

class Login extends StatefulWidget {
  LoginPage createState()=>LoginPage();
}
    // TODO: implement build


class LoginPage extends State<Login> with SingleTickerProviderStateMixin {
  Animation<double> animation,_contentAnimation;
  Animation<Offset> slide;
  AnimationController controller;
  String swi="Swipe or Register";
  String _password;
  bool passwordVisible=true;
  Timer timer;
  LoginPage(){
      const one = const Duration(seconds:3);
      new Timer.periodic(one, (timer){
       timer  = new Timer(Duration(milliseconds: 100), () {
          setState(() {
            if(swi=="press to login") {
              swi = "Swipe to Register";
            }
            else {
              swi = "press to login";
            }
          });
        }
        );
      }
      );
  }
  void _do()
  {
    setState(() {

    });
  }
  void _toggle()
  {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }
  void _forgot()
  {

  }
  @override
  void initState()
  {
    super.initState();
    passwordVisible=false;
    controller = AnimationController(duration: const Duration(milliseconds: 3000),vsync: this);
    //animation = Tween<double>(begin: 0.0,end: 1.0).animate(controller);
    _contentAnimation = Tween<double>(begin: 0.0, end: 1.0)//content animation
        .animate(CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    controller.repeat();
    //slide = Tween<Offset>(begin: Offset(, 0.0),end:Offset(0));
    RaisedButton btn = new RaisedButton(
      onPressed: _do,
      elevation: 1,
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20)),
      textColor: Colors.white,
      color: Colors.tealAccent[700],
      child: new Text("LOGIN",style: new TextStyle(fontFamily: 'OswaldR',fontSize: 20),)
    );
  }

  @override
  void dispose()
  {
    controller.dispose();
    super.dispose();
  }
  /*Color topRight = const Color(0xFFFF6EF9);
  Color mid = const Color(0xFFFFFFFF);
  Color bottomleft = const Color(0xFF5AD592);*/
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    //final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body:/*FadeTransition(opacity:animation ,
      child:*/ Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: new DecorationImage(image: new AssetImage("assets/background.jpg"), fit: BoxFit.cover)
            ),
          ),
          Positioned.fill(
            top:-500,
            child:new Image(image: new AssetImage("assets/logo.png")),
          ),
          Positioned.fill(
              top: 220,
              bottom: 545,
              right: 40,
              left: 40,
              child:Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0,color: Colors.white),borderRadius: BorderRadius.circular(15.0),
                ),
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: TextField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white,fontFamily: 'OswaldR'),
                      helperText: "Incase of Phone number go on with login",
                      helperStyle: TextStyle(color: Colors.white),
                      icon: Icon(Icons.person,color: Colors.white,),
                      border: InputBorder.none,
                      hintText: "Email or Phone"
                  ),
                ),
              )
          ),

          Positioned.fill(
              top: 315,
              bottom: 390,
              right: 40,
              left: 40,
              child:Stack(
                children: <Widget>[
                  Positioned.fill(
                      bottom: 54,
                      child:
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0,color: Colors.white),borderRadius: BorderRadius.circular(15.0),
                        ),
                        padding: EdgeInsets.fromLTRB(10,0, 0, 0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white,fontFamily: 'OswaldR'),
                            border: InputBorder.none,
                            hintText: "Password",
                            icon:
                            const Icon(Icons.lock,color: Colors.white,),
                            suffixIcon: IconButton(icon: Icon(passwordVisible?Icons.visibility:Icons.visibility_off),color: Colors.white,
                                onPressed:()
                                {
                                  setState(() {
                                    passwordVisible?passwordVisible=false:passwordVisible=true;
                                  });
                                }
                            )
                          ),
                          //onChanged:(val)=>this.opac=0.0:this.opac=1.0,
                          onSaved: (val) => _password=val,
                          obscureText: passwordVisible,
                          validator: (val){
                            val.length<8?"password too short":null;
                          },
                          /*
                  validator:(val)=> val.length < 8 ? 'Password too short':null,
                  onSaved:val => _password = val,
                  obscureText: _obsecureText,
                ),
                new FlatButton(onPressed: _toggle, child: new Text(data))*/
                        ),
                      ),
                  ),
                  /*Positioned.fill(
                      left: 180,
                      bottom: 48,
                      child: Opacity(opacity:1,
                      child: new FlatButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed:(){ _toggle();}
                          ,child: new Text(_obscureText?"Show":"Hide",style: new TextStyle(
                        color: Colors.white,
                      ),))
                        ,)
                  ),*/

                ],
              )
          ),
          Positioned.fill(
              top:422,
              bottom: 350,
              left: 60,
              right: 60,
              child: new GestureDetector(
                onTap: (){
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                  });
                },
              /*  onHorizontalDragStart:(e){
                  },
                onHorizontalDragUpdate: (e){
                  },
                onHorizontalDragEnd: (e){Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                },*/
                child: SwipeButton(
                  thumb: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(widthFactor:0.33,child: Icon(Icons.person_add,color: Colors.white,))
                    ],
                  ),
                  content:
                  AnimatedContainer(duration: Duration(seconds: 1),
                  padding: EdgeInsets.fromLTRB(65,5,0,0),//left, top, right, bottom
                  child: Text("LOGIN",style: new TextStyle(
                  fontFamily: 'OswaldR',
                  fontSize: 20,
                  color: Colors.white,
                    ),
                   ),
                  ),
                  onChanged: (result) {
                    print('onChanged $result');
                  },
                ),
              ),
          ),
          Positioned.fill(
            top:350,
            bottom: 200,
            left: 150,
            child:
            Center(
                  child:new RaisedButton(
                    onPressed: _forgot,
                    color: Colors.transparent,
                    elevation: 0.0,
                    highlightElevation: 0.0,
                    textColor: Colors.white,
                    child: Text("Forgot password"),
                  ),

            ),
          ),
          Positioned.fill(
              top:350,
              child:
              Center(
                  child:FadeTransition(
                      opacity:_contentAnimation,
                  child: Text(swi,
                    style: new TextStyle(color: Colors.white,fontFamily: 'OswaldR'),
                  ),)
              ),
          ),
        ]

      ),
      //)
    );


      // Add box decoration
      /*decoration: BoxDecoration(
// Box decoration takes a gradient
        gradient: LinearGradient(
// Where the linear gradient begins and ends
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
// Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.0,0.4,2.0],
          colors: [
*//* topRight,
              mid,
              bottomleft*//*
// Colors are easy thanks to Flutter's Colors
          topRight,
            mid,
            bottomleft
          ],
        ),

    ),*/
  }


}



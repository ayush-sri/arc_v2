import 'dart:async';

import 'package:flutter/material.dart';
import 'Login.dart';
import 'Overview.dart';

class SplashScreen extends StatefulWidget
{
  Splash createState()=> Splash();

}
class Splash extends State<SplashScreen>
{
  @override
  void initState()
  {
    super.initState();
    Timer(Duration(seconds: 3),(){
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Login()));
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: new DecorationImage(image: new AssetImage("assets/background.jpg"), fit: BoxFit.cover)
            ),
          ),
          Column(
            mainAxisAlignment:MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image(image:  new AssetImage("assets/logo.png")),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      "Initializing Resources",
                       style: TextStyle(
                        color: Colors.white,
                         fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

}
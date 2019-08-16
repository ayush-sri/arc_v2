import 'package:flutter/material.dart';
import 'student.dart';
import 'faculty.dart';

class Register extends StatefulWidget{
  RegisterPage createState()=> RegisterPage();

}
class RegisterPage extends State<Register> with SingleTickerProviderStateMixin
{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
    body: PageView(
        children: <Widget>[
          Student(),
          Faculty(),

     ],
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
   ),
    );
  }

}
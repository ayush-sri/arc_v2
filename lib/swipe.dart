import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'Register.dart';

var w = 50.0;
class SwipeDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.tealAccent,
        primaryColorLight: Colors.tealAccent,
      ),
      home: Scaffold(
        body: Align(
          alignment: Alignment(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SwipeButton(
              thumb: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(widthFactor:0.33,child: Icon(Icons.person_add,color: Colors.white,))
                ],
              ),
              content:
              Center(
                child: AnimatedContainer(duration: Duration(seconds: 1),
                  child: Text("LOGIN",style: new TextStyle(
                    fontFamily: 'OswaldR',
                    fontSize: 18,
                    color: Colors.white,
                  ),),
                ),
              ),
              onChanged: (result) {
                print('onChanged $result');
              },
            ),
          ),
        ),
      ),
    );
  }
}

enum SwipePosition {
  SwipeLeft,
  SwipeRight,
}

class SwipeButton extends StatefulWidget {
  const SwipeButton({
    Key key,
    this.thumb,
    this.content,
    BorderRadius borderRadius,
    this.initialPosition = SwipePosition.SwipeLeft,
    @required this.onChanged,
    this.height = 56.0,
  })  : assert(initialPosition != null && onChanged != null && height != null),
        this.borderRadius = borderRadius ?? BorderRadius.zero,
        super(key: key);

  final Widget thumb;
  final Widget content;
  final BorderRadius borderRadius;
  final double height;
  final SwipePosition initialPosition;
  final ValueChanged<SwipePosition> onChanged;

  @override
  SwipeButtonState createState() => SwipeButtonState();
}

class SwipeButtonState extends State<SwipeButton>
    with SingleTickerProviderStateMixin {
  final GlobalKey _containerKey = GlobalKey();
  final GlobalKey _positionedKey = GlobalKey();

  AnimationController _controller;
  Animation<double> _contentAnimation;
  Offset _start = Offset.zero;

  RenderBox get _positioned => _positionedKey.currentContext.findRenderObject();

  RenderBox get _container => _containerKey.currentContext.findRenderObject();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this);
    _contentAnimation = Tween<double>(begin: 1.0, end: 0.0)//content animation
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    if (widget.initialPosition == SwipePosition.SwipeRight) {
      _controller.value = 1.0;

    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      height: widget.height,
      child: Stack(
        key: _containerKey,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.teal[400],
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: ClipRRect(
              clipper: _SwipeButtonClipper(
                animation: _controller,
                borderRadius:BorderRadius.circular(40.0),
              ),
              borderRadius: BorderRadius.circular(40.0),
              child: SizedBox.expand(
                child: Padding(
                  padding: EdgeInsets.only(left: widget.height),
                  child: FadeTransition(
                    opacity: _contentAnimation,
                    child: widget.content,
                  ),
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) {
              return Align(
                alignment: Alignment((_controller.value * 2.0) - 1.0, 0.0),
                child: child,
              );
            },
            child: GestureDetector(
              onHorizontalDragStart:(e){//_onDragStart;
                setState(() {
                });
              w=50;
              },
              onHorizontalDragUpdate:(e){ //_onDragUpdate;
                setState(() {
                  if(e.globalPosition.dx>100.0)
                  w =e.globalPosition.dx;
                  else
                  w=50.0;
                });
              },
              onHorizontalDragEnd:(e){ //_onDragEnd;
              setState(() {
                if(w>180.0) {
                  w = 600.0;
                  new Timer(Duration(seconds: 1),(){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                    });
                  });
                }
                else
                  w=50.0;
              });},
              child: AnimatedContainer(duration: Duration(milliseconds: 700),
                key: _positionedKey,
                width: w,
                height: widget.height,
                decoration: BoxDecoration(
                  color: Colors.tealAccent[400],
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: widget.thumb,
              ),
            ),
          ),
        ],
      ),
    );
  }

}


class _SwipeButtonClipper extends CustomClipper<RRect> {
  const _SwipeButtonClipper({
    @required this.animation,
    @required this.borderRadius,
  })  : assert(animation != null && borderRadius != null),
        super(reclip: animation);

  final Animation<double> animation;
  final BorderRadius borderRadius;

  @override
  RRect getClip(Size size) {
    return borderRadius.toRRect(
      Rect.fromLTRB(
        size.width * animation.value,
        0.0,
        size.width,
        size.height,
      ),
    );
  }

  @override
  bool shouldReclip(_SwipeButtonClipper oldClipper) => true;
}

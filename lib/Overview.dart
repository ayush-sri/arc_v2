import 'package:arc_st/Details.dart';
import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.

          primarySwatch: Colors.teal,
          primaryTextTheme: TextTheme(
              title: TextStyle(
                  color: Colors.black
              )
          )
      ),
      home: new MyHomePage(title: 'ARC : Overview'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter += 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    int count=1;
    String title;
    Color colors;
    //List<Widget> children = new List.generate(count, (int i)=>new InputWidget(i));
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        elevation: 1.0,
        title: new Text(widget.title),
        backgroundColor: Colors.white,
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this would produce 2 rows.
        crossAxisCount: 2,
        padding: const EdgeInsets.all(4.0),
        // Generate 100 Widgets that display their index in the List
        children:new List<Widget>.generate(_counter, (index) {
          title="Nothing to show";
          return new GridTile(
            child: new InkResponse(
              enableFeedback: true,
              child: new Card(
                color: colors,
                child: new Center(
                  child: new Text(title,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
              ),

              onTap:(){ setState(() {
                // ignore: return_of_invalid_type_from_closure
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new Details()));

              }
              );
              },
            ),

          );
        }),
      ),

      floatingActionButton: new FloatingActionButton(
          child:new Icon(Icons.add),
          backgroundColor:  Colors.tealAccent[400],
          onPressed:()
          {
            setState(() {
              _counter=_counter+1;
            });
          }
          ),/* GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this would produce 2 rows.
          crossAxisCount: 2,*/
      // Generate 100 Widgets that display their index in the List
      /*   children: new List<Widget>.generate(1, (index) {
    return new GridTile(
    child: new Card(
    color: Colors.white,
    child: new Center(
    child: new Text("+",
    style: Theme.of(context).textTheme.display3,
         ),
        ),
       ),
      );
     }
    ),*//*
    */
      /*new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Mr. X gonna give it to ya :',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.

    );

    /*   void main() {
      runApp(MyApp());
    }

    class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    final title = 'Grid List';

    return MaterialApp(
    title: title,
    home: Scaffold(
    appBar: AppBar(
    title: Text(title),
    ),
    body: GridView.count(
    // Create a grid with 2 columns. If you change the scrollDirection to
    // horizontal, this would produce 2 rows.
    crossAxisCount: 2,
    // Generate 100 Widgets that display their index in the List
    children: List.generate(100, (index) {
    return Center(
    child: Text(
    'Item $index',
    style: Theme.of(context).textTheme.headline,
    ),
    );
    }),
    ),
    ),
    );
    }
    }*/
  }

  _onTileClicked(int index) {
    debugPrint("You tapped on $index");

  }
}


class InputWidget extends StatelessWidget{
  final int index;
  InputWidget(this.index);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Text("BCS 6001"+index.toString());
  }

}


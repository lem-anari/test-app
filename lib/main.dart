import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Test Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Random random = new Random();
  Color ind_color;
  int r;
  int g;
  int b;
  double o;

  void _changeBackground() {
    setState(() {
      r = random.nextInt(255);
      g = random.nextInt(255);
      b = random.nextInt(255);
      o = random.nextDouble();
      ind_color = Color.fromRGBO(r, g, b, o);
    });
  }

  @override
  void initState() {
    _changeBackground();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.login),
            tooltip: 'test login',
            onPressed: () {
              setState(() {
                Fluttertoast.showToast(
                    msg: "В дальнейшем возникнет возможность авторизоваться :)",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
              });
            },
          ),
         ],
      ),
      body: GestureDetector(
        onTap: () => _changeBackground(),
        child: Container(
          alignment: Alignment.center,
          color: ind_color,
          child: const Text(
            "Hey there",
            style: TextStyle(fontSize: 30, color: Colors.black),
            textDirection: TextDirection.ltr,
          ),
        ),
      ),

    drawer: Theme(
    data: Theme.of(context).copyWith(
      canvasColor: Colors.white
    ),
    child:
      Drawer(
        child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text('username'),
            accountEmail: new Text('email'),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
        ),
    new Divider(),
    ],
    ),)
    ));
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_gank/theme/theme.dart';

void main() => runApp(new MyHomePage());

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  AppTheme _appTheme = kAllAppThemes[0];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new MaterialApp(
      title:'干货集中营',
      home:new Center(

      ),
      theme: _appTheme.theme,
    );
  }
}

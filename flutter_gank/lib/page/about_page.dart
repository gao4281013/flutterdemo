import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gank/theme/theme.dart';

class AboutPage extends StatefulWidget {
  final AppTheme appTheme;
  final ValueChanged<AppTheme> onThemeChanged;


  AboutPage(this.appTheme, this.onThemeChanged);

  @override
  _AboutPageState createState() => new _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return new Container();
  }
}

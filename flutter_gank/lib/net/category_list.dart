import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_gank/ext/constant.dart' as ext;
import 'package:flutter_gank/ext/data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedList extends StatefulWidget {
  final String url;


  FeedList({Key key,this.url}):super(key:key);

  @override
  _FeedListState createState() => new _FeedListState();
}

class _FeedListState extends State<FeedList> {

  List data;

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
        child: new FutureBuilder(
            future: ext.get(widget.url),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              switch(snapshot.connectionState){
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return ext.bu
              }
            }),
        onRefresh: null);
  }
}

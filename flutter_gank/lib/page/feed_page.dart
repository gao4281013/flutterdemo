import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_gank/net/category_list.dart';
import 'package:flutter_gank/ext/constant.dart' as ext;

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => new _FeedPageState();
}

class _FeedPageState extends State<FeedPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
   tabController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(
        length: _allPages.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('分类阅读'),
        bottom: new TabBar(
            controller: tabController,
            indicatorColor: Theme.of(context).primaryColor,
            isScrollable: true,
            tabs: _allPages.map((_Page page){
              return new Tab(text: page.text);
            }).toList(),
        ),
        actions: <Widget>[
          new Padding(padding: const EdgeInsets.all(4.0),
          child: new IconButton(
              icon: new Icon(Icons.reorder),
              onPressed: (){

              }),
          ),

          new Padding(padding: const EdgeInsets.all(4.0),
            child: new IconButton(
                icon: new Icon(Icons.search),
                onPressed: (){

                }),
          ),

        ],
      ),

      body: new TabBarView(
          controller: tabController,
          children: _allPages.map((_Page page){
            return page.feedList;
          }).toList()),
    );
  }

}


class _Page {


  final IconData icon;
  final String text;
  final FeedList feedList;

  _Page({this.icon,
    this.text,
    this.feedList});

}

//存储所有的页面的列表

final List<_Page> _allPages = <_Page>[
  new _Page(text: "all",
      feedList: new FeedList(url: ext.generateCategoryUrl('all', 50, 0),)),
  new _Page(text: "Android",
      feedList: new FeedList(url: ext.generateCategoryUrl('Android', 50, 0),)),
  new _Page(text: "瞎推荐",
      feedList: new FeedList(url: ext.generateCategoryUrl('瞎推荐', 50, 0),)),
  new _Page(text: "iOS",
      feedList: new FeedList(url: ext.generateCategoryUrl('iOS', 50, 0),)),
  new _Page(text: "前端",
      feedList: new FeedList(url: ext.generateCategoryUrl('前端', 50, 0),)),
  new _Page(text: "拓展资源",
      feedList: new FeedList(url: ext.generateCategoryUrl('拓展资源', 50, 0),)),
  new _Page(text: "休息视频",
      feedList: new FeedList(url: ext.generateCategoryUrl('休息视频', 50, 0),)),
  new _Page(text: "福利",
      feedList: new FeedList(url: ext.generateCategoryUrl('福利', 50, 0),)),
];

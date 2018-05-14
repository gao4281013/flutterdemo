import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class PostPage extends StatefulWidget {

  final Map<String, dynamic> post;


  PostPage(this.post);

  @override
  _PostPageState createState() => new _PostPageState();
}

class _PostPageState extends State<PostPage> {

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  final flutterWebViewPlugin = new FlutterWebviewPlugin();

  StreamSubscription _onDestory;

  StreamSubscription<String> _onUrlChanged;

  StreamSubscription<WebViewStateChanged> _onStateChanged;

  final _history = [];

  void showSnack(String msg){
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(msg)));
  }

  bool loading = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flutterWebViewPlugin.close();

    _onDestory = flutterWebViewPlugin.onDestroy.listen((_){
      if(mounted){

      }
    });

    _onUrlChanged = flutterWebViewPlugin.onUrlChanged.listen((String url){
      if(mounted){
        setState(() {
          _history.add("onUrlChanged: $url");
        });
      }
    });


    _onStateChanged = flutterWebViewPlugin.onStateChanged.listen((WebViewStateChanged state){
      if(mounted){
        if(state != WebViewState.finishLoad){
          setState(() {
            _history.add("onStateChanged: ${state.type} ${state.url}");
            loading = false;
          });
        }else{
          loading = true;
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _onDestory.cancel();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();

    flutterWebViewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String title = widget.post['desc'] == null?'一个陌生的地方'
        :widget.post['desc'];
    return new WebviewScaffold(
        key: _scaffoldKey,
        url: widget.post['url'],
        withJavascript: true,
        appBar: new AppBar(
          title: new Text(title),
          actions: <Widget>[
            new Padding(padding: const EdgeInsets.all(4.0),
            child: new IconButton(
                icon: new Icon(Icons.refresh), onPressed: (){

            },),
            ),
           new Padding(padding: const EdgeInsets.all(4.0),
           child: new IconButton(
               icon: new Icon(Icons.share),
               onPressed: (){

               },),
           ),
          ],
        ),

    );
    }
}

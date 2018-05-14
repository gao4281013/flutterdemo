import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gank/ext/data_repository.dart';
import 'package:flutter_gank/page/post_page.dart';

final String  GATEGORY_URL_PREFIX = 'http://gank.io/data';

String generateCategoryUrl(feedType,pageSize,pageNum){
  return GATEGORY_URL_PREFIX+feedType+'/'+pageSize.toString()+'/'+pageNum.toString();
}

final Map<String,Color> tagColors = {
  'Android': const Color(0xff94859c),
  'iOS': const Color(0xff5B6356),
  '前端': const Color(0xffca8269),
  '瞎推荐': const Color(0xff9d3d3f),
  '拓展资源': const Color(0xffe4dc8b),
  '福利': const Color(0xffe5acbf),
  'App': const Color(0xff772f09),
  '休息视频': const Color(0xffa6c7b2),
};

Future<String> get(String url) async{
  var httpClient = new HttpClient();
  print(url);
  var request = await httpClient.getUrl(Uri.parse(url));
  var response = await request.close();
  return await response.transform(utf8.decoder).join();
}


Widget buildDailyListView(BuildContext context, AsyncSnapshot snapShot){
  Map<String, dynamic> value;
  List content = new List();
  value = jsonDecode(snapShot.data);
  DailyResponse response = DailyResponse.fromJson(value);

  if(response.error){
    return buildExceptionIndicator("网络请求错误");
  }else{
    if(response.category.length ==0){
      return buildExceptionIndicator("这里空空的什么也没有...");
    }else{
      response.category.forEach((row){
        content.addAll(response.results[row]);
      });
      print(content);
      return buildl
    }
  }

}


Widget buildListviewBuilder(context,List content){
  return new ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(2.0),
      itemCount: content == null ? 0 : content.length,
      itemBuilder: (context,i){
        return buildRow(context, content[i]);
      });
}

Widget buildRow(context,one){
  final ThemeData themeData = Theme.of(context);
  final TextStyle textStyle = themeData.textTheme.headline.copyWith(color: Colors.white);

  PostData postData = PostData.fromJson(one);
  print(postData);
  if(postData.type == '福利'){
    return new InkWell(
      onTap: (){
        Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context){
          return new PostPage(postData.toJson());
        }));
      },child:
    new Card(
         margin: new EdgeInsets.all(2.0),
         child: new Padding(padding: new EdgeInsets.all(8.0),
            child:
             new SizedBox(
               height: 300.0,
               child: new Stack(
                 children: <Widget>[
                   new Positioned.fill(
                       child:
                       new FadeInImage.assetNetwork(
                           placeholder: 'empty_data_png',
                           image: postData.url,
                           fit: BoxFit.cover,
                           repeat: ImageRepeat.repeat,)
                   ),
                   new Positioned(
                       bottom: 6.0,
                       left: 6.0,
                       right: 6.0,
                       child: new FittedBox(
                         fit: BoxFit.scaleDown,
                         alignment: Alignment.bottomLeft,
                         child: new Text(postData.desc,style: textStyle
                         ),
                       ),
                   ),
                 ],
               ),
             ),
         ),
    ),
    );
  } else {

  }

}


Widget buildExceptionIndicator(String message){
  return new Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      new Align(
        alignment: Alignment.center,
        child: new Image.asset('images/empty_data.png'),
      ),
      new Align(
        alignment: Alignment.center,
        child: new Text(message,style: const TextStyle(color: Colors.grey),
        ),
      ) 
    ],
  );

}


Widget buildLoadingIndicator(){
  return new Center(
    child: new Card(
      elevation: 4.0,
      child: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Wrap(
            direction: Axis.vertical,
            spacing: 8.0,
            children: <Widget>[
              new CupertinoActivityIndicator(),
              new Text('正在加载中...'),
            ],
            crossAxisAlignment: WrapCrossAlignment.center,
          ),
      ),
    ),
  );

}

import 'package:flutter/material.dart';
import 'package:flutter_gank/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  final AppTheme appTheme;
  final ValueChanged<AppTheme> onThemeChanged;


  AboutPage(this.appTheme, this.onThemeChanged);

  @override
  _AboutPageState createState() => new _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Set<String> mCartoonTags = new Set<String>();
  Set<String> mSelfTag = new Set<String>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mCartoonTags.add('斗破苍穹');
    mCartoonTags.add('萧炎');
    mCartoonTags.add('萧熏儿');
    mCartoonTags.add('最强弃少');
    mCartoonTags.add('叶默');
    mCartoonTags.add('穆小韵');
    mCartoonTags.add('一人之下');
    mCartoonTags.add('温暖的弦');
    mCartoonTags.add('温暖');
    mCartoonTags.add('占南弦');

    mSelfTag.add("Java");
    mSelfTag.add("Android");
    mSelfTag.add("Kotlin");
    mSelfTag.add("Flutter");
    mSelfTag.add("Dart");
    mSelfTag.add("Ionic");
    mSelfTag.add("SprintBoot");
    mSelfTag.add("Dagger");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('关于'),
        actions: <Widget>[
          new Padding(
              padding: const EdgeInsets.all(4.0),
             child: new IconButton(
                 icon: new Icon(Icons.color_lens),
                 onPressed: (){
                   _switchTheme();
                 }),
          )
        ],
      ),
      body: _createAbout(),
      floatingActionButton: new FloatingActionButton.extended(
          onPressed: (){
            _launchURL();
          },
          icon: new Icon(Icons.feedback),
          label: new Text("反馈")),
    );
  }


  Widget _createAbout(){

  }

  _launchURL() async{
    const url = 'mailto:onlyloveyd@gmail.com?subject=Issues&body=Issue:';
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Can not launch $url';
    }
  }

  _switchTheme(){
    var index = kAllAppThemes.indexOf(widget.appTheme);
    var nextIndex = index+1 == kAllAppThemes.length?0:index+1;
    widget.onThemeChanged(kAllAppThemes[nextIndex]);
  }

  List<Widget> _buildChips(tags,haveBg){
    List<Widget> widgets = new List();
    tags.forEach((tag){
      widgets.add(_buildChip(tag, haveBg));
    });
    print(widgets);
    return widgets;
  }

  Widget _buildChip(tag,haveBg){
    if(haveBg){
      return new Padding(
          padding: const EdgeInsets.all(4.0),
      child:
      new Chip(label: new Text(tag), backgroundColor:_nameToColor(tag),shape:
        new BeveledRectangleBorder(
          side: const BorderSide(
            width: 0.66,
            style: BorderStyle.solid,
            color: Colors.grey,
          ),
          borderRadius: new BorderRadius.circular(10.0),
        ),
      ),);
    }else{
      return new Padding(padding: const EdgeInsets.all(4.0),
        child:
        new Chip(label: new Text(tag),backgroundColor: _nameToColor(tag),),);
    }
  }

  Color _nameToColor(String name){
    assert(name.length>1);
    final int hash = name.hashCode & 0xffff;
    final double hue = 360.0 * hash /(1 << 15);
    return new HSVColor.fromAHSV(1.0, hue, 0.4, 0.09).toColor();
  }

}

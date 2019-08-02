
import 'package:flutter/material.dart';
import 'animated_widget.dart';
import 'constrains_page.dart';
import 'future_builder_page.dart';
import 'gesture_page.dart';
import 'offstage_page.dart';
import 'scrollview_page.dart';
import 'sliver_appBar_page.dart';
import 'slivers_page.dart';
import 'transform_page.dart';
import 'value_listen_builder_page.dart';


class SysWidgetPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SysWidgetPageState();
  }
}

class _SysWidgetPageState extends State<SysWidgetPage> {

  List<String> _list = ["AnimatedWidgetPage","ConstransiPage","FutureBuilderPage","GesturePage",
    "OffstagePage","ScrollviewPage","SliverAppBarPage","SliversPage","TransformPage","ValueListenBuilderPage",""];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SysWidgetPage"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return ListTile(
              title: Text("${_list[index]}:-------$index"),
              onTap: (){
                if(index == 0){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnimatedListSample()));
                }if(index == 1){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConstrainsPage()));
                }if(index == 2){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FutureBuilderPage()));
                }if(index == 3){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => GesturePage()));
                }if(index == 4){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OffStagePage()));
                }if(index == 5){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScrollViewPage()));
                }if(index == 6){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SliverAppBarPage()));
                }if(index == 5){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SliverPage()));
                }if(index == 5){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransformPage()));
                }if(index == 5){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ValueLisentedBuilderPage()));
                }else {
                }
              },
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: _list.length
      ),
    );
  }
}
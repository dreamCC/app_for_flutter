
import 'package:flutter/material.dart';
import 'http_page.dart';
import 'inherited_page.dart';
import 'regex_page.dart';
import 'root_bundle_page.dart';
import 'stream_controller.dart';
import 'widget_key_page.dart';
import 'dart_io_page.dart';


class SysUtilPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SysUtilPageState();
  }
}

class _SysUtilPageState extends State<SysUtilPage> {

  List<String> _list = ["HttpPage","InheritedPage","RegexPage","RootBundlePage","StreamControllerPage","WidgetKeyPage",
    "DartIoPage","",""];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SysUtilPage"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return ListTile(
              title: Text("${_list[index]}:-------$index"),
              onTap: (){
                if(index == 0){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HttpPage()));
                }if(index == 1){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => InheritedPage()));
                }if(index == 2){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegexPage()));
                }if(index == 3){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RootBundlePage()));
                }if(index == 4){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => StreamControllerPage()));
                }if(index == 5){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => WidgetKeyPage()));
                }if(index == 6){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DartIoPage()));
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
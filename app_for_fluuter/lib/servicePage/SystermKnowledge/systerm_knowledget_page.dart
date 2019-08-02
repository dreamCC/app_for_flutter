
import 'package:flutter/material.dart';
import 'SysUtil/sys_util_page.dart';
import 'SysWidget/sys_widget_page.dart';



class SystermKnowledgePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SystermKnowledgePageState();
  }
}

class _SystermKnowledgePageState extends State<SystermKnowledgePage> {

  List<String> _list = ["SysUtilPage","SysWidgetPage",""];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SystermKnowledge"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return ListTile(
              title: Text("${_list[index]}:-------$index"),
              onTap: (){
                if(index == 0){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SysUtilPage()));
                }if(index == 1){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SysWidgetPage()));
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
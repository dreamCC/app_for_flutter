
import 'package:flutter/material.dart';
import 'test_systerm_widget.dart';
import 'platform_view_page.dart';
import 'image_resources_page.dart';
import 'focus_page.dart';
import 'setvalue_page.dart';


class SysWidgetPage2 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SysWidgetPage2State();
  }
}

class _SysWidgetPage2State extends State<SysWidgetPage2> {

  List<String> _list = ["TestSystermWidgetPage","PlatformViewPage",'ImageResourcesPage','FocusPage',
  "SetValuePage"];



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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => TestSystermWidget()));
                }if(index == 1){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlatformViewPage()));
                }if(index == 2){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImageResourcesPage()));
                }if(index == 3){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FocusPage()));
                }if(index == 4){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SetValuePage()));
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

import 'package:flutter/material.dart';
import 'custom_paint_page.dart';

class CustomWidgetPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _CustomWidgetPageState();
  }
}

class _CustomWidgetPageState extends State<CustomWidgetPage> {

  List<String> _list = ["CustomPaintPage",""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomWidgetPage"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return ListTile(
              title: Text("${_list[index]}:-------$index"),
              onTap: (){
                if(index == 0){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomPaintPage()));
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
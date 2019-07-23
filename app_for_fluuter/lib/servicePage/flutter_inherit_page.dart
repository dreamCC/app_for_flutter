
import 'package:flutter/material.dart';

class FlutterInheritPage extends Hu {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FlutterInheritPageState();
  }
}

class _FlutterInheritPageState extends HuState<FlutterInheritPage> {

  @override
  void initState() {
    super.initState();

    this.title = "FlutterInheritPage";
  }
  
  
  @override
  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('header'),
        Divider()
      ],
    );
  }

}


// dart 语言中的继承关系，可以使用with，implement， extent来实现。
abstract class Hu extends StatefulWidget {

}


abstract class HuState<T extends Hu> extends State<T> with EmptyState {

  String title = "";


  Widget buildContent(BuildContext context);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: buildContent(context),
    );

  }

  @override
  void showEmptyView() {

  }
}


mixin EmptyState<T extends StatefulWidget> on State<T> {

  void showEmptyView();

}





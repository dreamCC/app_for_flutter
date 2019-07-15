

import 'package:flutter/material.dart';



class InheritedPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InheritedPageState();
  }
}

class _InheritedPageState extends State<InheritedPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedPage'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: InheritedShareInfo(
            name: 'hello,wold',
            child: Column(
              children: <Widget>[
                Text(InheritedShareInfo.of(context).name ?? 'name is null')

              ],
            )
        ),
      ),
    );
  }
}


class InheritedShareInfo extends InheritedWidget {

  String name;
  InheritedShareInfo({Key key, @required this.name, @required Widget child}):
        assert(name != null),
        assert(child != null),
        super(key: key, child: child);


  static InheritedShareInfo of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(InheritedShareInfo);
  }


  @override
  bool updateShouldNotify(InheritedShareInfo oldWidget) {

    return name != oldWidget.name;
  }

}
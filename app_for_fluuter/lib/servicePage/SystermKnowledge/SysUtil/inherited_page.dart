

import 'package:flutter/material.dart';



class InheritedPage extends StatefulWidget {



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InheritedPageState();
  }
}

class _InheritedPageState extends State<InheritedPage> {


  StringBuffer _name = StringBuffer('InheritedShareInfo');

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
            name: _name.toString(),
            child: Center(
              child: Column(
                children: <Widget>[

                  ChirldWidget(),
                  Divider(),
                  RaisedButton(
                    onPressed: (){
                      _name.write('-age');
                      setState(() { });
                    },
                    child: Text('改变值'),
                  ),
                  GestureDetector(
                    onTap: (){
                      print('-----GestureDetector-OnTap');
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                    ),
                    behavior: HitTestBehavior.deferToChild,
                  ),


                ],
              ),
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


class ChirldWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChirldWidgetState();
  }


}

class _ChirldWidgetState extends State<ChirldWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('ChirldWidget---initState');

  }



  @override
  Widget build(BuildContext context) {

    return Text(InheritedShareInfo.of(context).name ?? 'name is null');
  }

}


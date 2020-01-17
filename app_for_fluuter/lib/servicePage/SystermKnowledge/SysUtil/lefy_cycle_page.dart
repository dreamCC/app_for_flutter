
import 'package:flutter/material.dart';

class LefyCyclePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LefyCyclePage();
  }
}

class _LefyCyclePage extends State<LefyCyclePage> {


  int value = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('initState');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('didChangeDependencies');

  }

  @override
  void didUpdateWidget(LefyCyclePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('LefyCyclePage'),
      ),
      body: Column(
        key: UniqueKey(),
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Divider(),
          RaisedButton(
            onPressed: (){
              value++;
              setState(() {});
            },
            child: Text('SetState-$value'),
          ),
          ChirldWidget(),
        ],
      ),
    );
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
    print('_ChirldWidgetState-initState');

  }

  // 每次调用initState的时候才会调用。
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('_ChirldWidgetState-didChangeDependencies');

  }


  // 每次rebuild的时候都会调用。
  @override
  void didUpdateWidget(ChirldWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('_ChirldWidgetState-didUpdateWidget');

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('_ChirldWidgetStateild-build');


    return Container(
      width: 200,
      height: 50,
      color: Colors.purple,
    );
  }
}
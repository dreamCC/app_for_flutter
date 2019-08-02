import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'dart:async';

import 'dart:math';

class RootBundlePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState


    return _RootBundlePageState();
  }
}

class _RootBundlePageState extends State<RootBundlePage> {

  String _rootString;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("RootBundlePage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () async{

              _rootString = await rootBundle.loadString("assets/locationInfo.json");
              setState(() { });




            },
            child: Text('RootBundle'),
          ),
          Divider(),

          Text(_rootString ?? "未知")

        ],
      ),
    );
  }
}
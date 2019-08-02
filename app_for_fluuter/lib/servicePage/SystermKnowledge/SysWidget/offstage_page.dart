
import 'package:flutter/material.dart';

class OffStagePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OffStagePage();
  }
}

class _OffStagePage extends State<OffStagePage> {

  bool _isHidden = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('OffStagePage'),
      ),
      body: Column(
        children: <Widget>[
          Text('hello, wrold'),
          Divider(),
          Offstage(
            offstage: _isHidden,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.grey,
            ),
          ),
          Divider(),
          Container(
            width: 100,
            height: 100,
            color: Colors.purple,
          )
        ],
      ),
      floatingActionButton: IconButton(
          icon: Icon(Icons.priority_high),
          onPressed: (){
            setState(() {
              _isHidden = !_isHidden;
            });
          }
      ),
    );
  }
}
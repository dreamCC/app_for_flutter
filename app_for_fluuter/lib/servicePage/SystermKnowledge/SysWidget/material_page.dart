
import 'package:flutter/material.dart';

class MaterialPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MaterialPageState();
  }
}

class MaterialPageState extends State<MaterialPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MaterialPage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Material(
              color: Colors.blueAccent,
              shape: BeveledRectangleBorder(
                side: BorderSide(
                  color: Colors.purple,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              textStyle: TextStyle(color: Colors.red),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Text("斜角矩阵边框"),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
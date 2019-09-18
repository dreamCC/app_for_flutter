
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SummarizePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SummarizePageState();
  }
}

class _SummarizePageState extends State<SummarizePage> {



  GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SummarizePage"),
      ),
      body: Center(
        child: RaisedButton(
            onPressed: (){






            },

        ),
      ),
    );
  }
}





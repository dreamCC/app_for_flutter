
import 'package:flutter/material.dart';
import 'dart:async';

class StreamControllerPage extends StatelessWidget {

  final StreamController _streamController = StreamController();

  int _count = 0;

  Future futureFunction() async{

   return Future.delayed(Duration(seconds: 3));

  }

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            RaisedButton(onPressed: (){

              _streamController.sink.add(++_count);
            }),
            Divider(),

            StreamBuilder(
                stream: _streamController.stream,
                builder: (ctx,AsyncSnapshot snapshot){
                    return Text('StreamBuilder--${snapshot.data}');
                }
            ),

            FutureBuilder(
                builder: (context, snapShot) {
                  print(snapShot.connectionState);
                  return Text('StreamBuilder--${snapShot.connectionState}');

                },
              future: futureFunction(),
            )
          ],
        ),
      ),
    );
  }
}
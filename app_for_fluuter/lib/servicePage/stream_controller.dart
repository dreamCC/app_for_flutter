
import 'package:flutter/material.dart';
import 'dart:async';


/**
 * stream暴露在外的重要包含了。 StreamController， StreamSink ， Steam， StreamSubcripte四个对象
 * stream 可以跨widget 通知。我们使用的event_bus 就是基于streamController的封装。*/


StreamController streamController = StreamController.broadcast();

class StreamControllerPage extends StatelessWidget {



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

              streamController.sink.add(++_count);

            }),
            Divider(),

            StreamBuilder(
                stream: streamController.stream,
                builder: (ctx,AsyncSnapshot snapshot){
                    return Text('StreamBuilder--${snapshot.data}');
                }
            )
            ,
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
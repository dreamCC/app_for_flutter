
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:isolate';

class FuturePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FuturePageState();
  }
}

class _FuturePageState extends State<FuturePage> {


  Future<void> futureFunc() {


    return Future((){

        for(int i = 0, j=1000; i<j; i++){

        }
        print("futureFunc");
        throw Exception("--------Exception");

      });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("FuturePage"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () async{

              

              try{
                await futureFunc();
              }catch(error) {
                print("cathchError----$error");
              }

            },
            child: Text("Future"),
          ),
          Divider(),
          RaisedButton(
            onPressed: (){


              futureFunc().catchError((error){
                print("catchError----$error");
              });

            },
            child: Text("report error"),
          ),
        ],
      ),
    );
  }


}
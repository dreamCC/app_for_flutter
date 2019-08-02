
import 'package:flutter/material.dart';
import 'dart:io';

class DartIoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DartIoPageState();
  }
}

class _DartIoPageState extends State<DartIoPage> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("DartIoPage"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return ListTile(
              onTap: (){
//                final filePath = r"E:\back.txt";
//                File file = File(filePath);

                Directory directory = Directory('back.txt');
                directory.createSync();
                print(directory.absolute.path);
              },
              title: Text('$index'),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: 4
      )
    );
  }
}
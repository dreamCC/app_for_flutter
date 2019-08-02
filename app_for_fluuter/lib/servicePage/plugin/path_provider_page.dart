
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PathProviderPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _FileProviderPage();
  }
}

class _FileProviderPage extends State<PathProviderPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FileProviderPage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              onPressed: () async{
                Directory directory = await getTemporaryDirectory();
                print(directory.path);

              },
            child: Text('getTemporaryDirectory'),
          ),
          Divider(),
          RaisedButton(
            onPressed: () async{
              Directory directory = await getApplicationDocumentsDirectory();
              print(directory.path);
            },
            child: Text('getApplicationDocumentsDirectory'),
          ),
          Divider(),
          RaisedButton(
            onPressed: () async{
              Directory directory = await getExternalStorageDirectory();
              print(directory.path);
            },
            child: Text('getExternalStorageDirectory'),
          ),
          Divider(),
          RaisedButton(
            onPressed: () async{
              Directory directory = await getApplicationSupportDirectory();
              print(directory.path);
            },
            child: Text('getApplicationSupportDirectory'),
          )
        ],
      ),

    );
  }
}
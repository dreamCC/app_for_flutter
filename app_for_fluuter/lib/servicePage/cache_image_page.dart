
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CacheImagePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CacheImagePageState();
  }
}

class _CacheImagePageState extends State<CacheImagePage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('CacheImagePage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(onPressed: (){

          }, child: Text('fetchImage'),),
          Divider(),

          CachedNetworkImage(
            imageUrl: 'http://via.placeholder.com/200x400',
            errorWidget: (context, url, error){
              return Icon(Icons.error);
            },
            placeholder: (context, url){
              return CircularProgressIndicator();
            },
            width: 200,
            height: 400,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ShareDatasPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState


    return _ShareDatasPageDate();
  }
}

class _ShareDatasPageDate extends State<ShareDatasPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('SharePage'),
      ),
      body: Center(
        child: IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              SharedPreferences.getInstance().then((share){
                share.setString('name', 'sharePreferences-保存');
              });
            }
        ),
      ),
    );
  }
}

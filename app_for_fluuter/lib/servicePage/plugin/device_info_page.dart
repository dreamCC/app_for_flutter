
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';



class DeviceInfoPage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DeviceInfoPageState();
  }
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('DeviceInfo'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              DeviceInfoPlugin _plugin = DeviceInfoPlugin();
              _plugin.iosInfo.then((iosInfo){

                print(iosInfo.toString());
              });

              print(MediaQuery.of(context).size);
              print(MediaQuery.of(context).padding);
            },
            child: Text('获取设备信息'),
          ),
          Divider()
        ],
      ),
    );
  }
}
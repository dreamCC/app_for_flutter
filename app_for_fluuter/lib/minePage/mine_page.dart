import 'package:flutter/material.dart';


class MinePage  extends StatefulWidget {
  @override
  _MinePageState createState() =>  _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),

      ),

      // 抽屉效果
      drawer: Drawer(
        child: UserAccountsDrawerHeader(accountName: Text('David'), accountEmail: Text('ww.qq.com')),
      ),

    );
  }
}
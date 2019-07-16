import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:app_for_fluuter/common/event_bus.dart';
import 'package:app_for_fluuter/servicePage/event_bus_page.dart';

class HomePage  extends StatefulWidget {
  @override
  _HomePageState createState() =>  _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);


    bus.on().listen((ondate){
      print('HomePage-bus--收到消息:$ondate');
    });

    bus1.on().listen((ondate){
      print('HomePage-bus1--收到消息:$ondate');
    });

    EventBusUtil.instance.listen((value){
      print('homePage--收到消息:${value}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        bottom: TabBar(
            controller: _tabController,
            tabs: [
              Center(child: Text('One'),),
              Center(child: Text('Two'),),
              Center(child: Text('Three'),),
            ],
            labelColor: Colors.purple,
            unselectedLabelColor: Colors.white,
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: [
            Center(child: Text('One'),),
            Center(child: Text('Two'),),
            Center(child: Text('Three'),),
          ]
      ),
    );
  }
}
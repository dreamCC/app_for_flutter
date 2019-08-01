import 'package:flutter/material.dart';

// dartUi，中能够获取windo，用于native，调用flutter的路由控制。
import 'dart:ui';

// dartIo，可以进行网络操作。
import 'dart:io';

import 'package:app_for_fluuter/servicePage/http_page.dart';
import 'package:app_for_fluuter/servicePage/dio_page.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'dart:core';


// 物理动画库
import 'package:flutter/physics.dart';

import 'video_player_page.dart';
import 'share_datas_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'event_bus_page.dart';
import 'device_info_page.dart';

import 'package:app_for_fluuter/common/event_bus.dart';

import 'package:app_for_fluuter/common/adapt.dart';
import 'dialog_page.dart';

import 'push_window_page.dart';
import 'stream_controller.dart';
import 'gesture_page.dart';
import 'inherited_page.dart';
import 'constrains_page.dart';

import 'sliver_appBar_page.dart';

import 'custom_paint.dart';

import 'offstage_page.dart';
import 'bmprogresshud_page.dart';
import 'value_listen_builder_page.dart';
import 'widget_key_page.dart';
import 'slivers_page.dart';
import 'cache_image_page.dart';
import 'future_builder_page.dart';
import 'flutter_inherit_page.dart';
import 'animated_widget.dart';
import 'transform_page.dart';
import 'url_launch_page.dart';
import 'web_view_plugin_page.dart';
import 'location_page.dart';
import 'root_bundle_page.dart';
import 'CustomWidget/custom_widget_page.dart';
import 'regex_page.dart';

@immutable
class Person {
  String name;
}


class ServicePage  extends StatefulWidget {

  static ServicePageState of(BuildContext context) {
    return context.ancestorStateOfType(TypeMatcher<ServicePageState>());
  }

  @override
  ServicePageState createState() {


    return ServicePageState();
  }
}

/**
 * 对于AutomaticKeepAliveClientMixin的作用的深刻理解。
 * 1、能够保持状态的前提是。widget.canupdate 返回的是false。也就是说，在指定节点，widget.runtimeType 和 key 是一样的。
 * 所以，flutter中tabBar是可以使用的。bottomNavigationBar是不能够使用的。*/

class ServicePageState extends State<ServicePage>  with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;


  ScrollController _scrollVc = ScrollController(initialScrollOffset: 0, );

  RefreshController _refreshVc = RefreshController(initialRefresh: false);


  List<String> _titles = ["Video_Player","sharePreferens","EventBus","HttpPage","DioPage",
    "DeviceInfo","Dialog","StreamController","GesturePage","InheritedPage","ConstrainsPage",
    "SliverAppBarPage","ScrollViewPage", "CustomPaintPage","OffStagePage",'BMPorgressHUDPage',
    'ValueLisentedBuilderPage','WidgetKeyPage','SliverPage','CacheImagePage','FutureBuilderPage',
    "FlutterInheritPage","AnimatedListSample","TransformPage","UrlLaunchPage","WebViewPluginPage",
    "LocationPage","RootBundlePage","CustomWidgetPage","RegexPage",""];

  CustomPaintPage _customPaintPage;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 3)).then((value){
      //print('-------------$value');
    });

    print('++++++++++++++++=');
    debugPrint('debugPrint');
    print('print');


    SharedPreferences.getInstance().then((sharePreferenc){
      print('----上次保存的数据是：' + sharePreferenc.get('name'));
    });

    bus.on().listen((ondate){
      print('ervicePage-bus--收到消息:$ondate');
    });

    bus1.on().listen((ondate){
      print('ervicePage-bus1--收到消息:$ondate');
    });


    EventBusUtil.instance.listen<EventBusUtilEvent>((value){
      print('ervicePage--收到消息:$value');


    });

    streamController.stream.listen((date){
      print(date);
    });


    print("++++++++++++++++++++++++++");


  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('服务'),
      ),
      body: NotificationListener(
          onNotification: (ScrollUpdateNotification notify){
            //print(notify.scrollDelta);



            return true;
          },
          child: SmartRefresher(
              controller: _refreshVc,
              child: ListView.separated(
               itemBuilder: (context, index){
                 return ListTile(
                   title: Text(_titles[index] + '---$index'),
                   onTap: (){
                     if (index == 3) {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => HttpPage()));
                     }else if (index == 4) {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => DioPage()));
                     }else if (index == 0) {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerWidget()));
                     }else if (index == 1) {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => ShareDatasPage()));
                     }else if (index == 2) {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => EventBusPage()));
                     }else if (index == 5) {
                       Navigator.push(context, MaterialPageRoute(
                           builder: (context) => DeviceInfoPage()));
                     }else if (index == 6) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => DialogPage()));
                     }else if (index == 7) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => StreamControllerPage()));
                     }else if (index == 8) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => GesturePage()));
                     }else if (index == 9) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => InheritedPage()));
                     }else if (index == 10) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => ConstrainsPage()));
                     }else if (index == 11) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => SliverAppBarPage()));
                     }else if (index == 12) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => ScrollViewPage()));
                     }else if (index == 13) {

                       _customPaintPage = CustomPaintPage();
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => _customPaintPage));
                     }else if (index == 14) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => OffStagePage()));
                     }else if (index == 15) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => BMProgressHudPage()));
                     }else if (index == 16) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => ValueLisentedBuilderPage()));
                     }else if (index == 17) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => WidgetKeyPage()));
                     }else if (index == 18) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => SliverPage()));
                     }else if (index == 19) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => CacheImagePage()));
                     }else if (index == 20) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => FutureBuilderPage()));
                     }else if (index == 21) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => FlutterInheritPage()));
                     }else if (index == 22) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => AnimatedListSample()));
                     }else if (index == 23) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => TransformPage()));
                     }else if (index == 24) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => UrlLaunchPage()));
                     }else if (index == 25) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => WebViewPluginPage()));
                     }else if (index == 26) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => LocationPage()));
                     }else if (index == 27) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => RootBundlePage()));
                     }else if (index == 28) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => CustomWidgetPage()));
                     }else if (index == 29) {
                       Navigator.of(context, rootNavigator: false).push( MaterialPageRoute(
                           builder: (context) => RegexPage()));
                     }else {


                       num a = 2.0;
                       num b = 1.1;
                       print(a - b);
                       
                       // 数据num 可以进行小数保留。
                       print(a.toStringAsFixed(4));
                       print(a.toStringAsPrecision(4));

                     }
                   },
                 );
               },
               separatorBuilder: (context, index) {
                 return SizedBox(
                   height: 1,
                   child: DecoratedBox(decoration: BoxDecoration(color: Colors.lightBlueAccent)),
                 );
               },
               itemCount: _titles.length,
               controller: _scrollVc,
             ),
            enablePullUp: false,
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 3));


              setState(() {
                _titles = ["Video_Player","sharePreferens","EventBus","HttpPage","DioPage",
                  "DeviceInfo","Dialog","StreamController","GesturePage","InheritedPage","ConstrainsPage","SliverAppBarPage","ScrollViewPage",""];

                _refreshVc.refreshCompleted();
                _refreshVc.resetNoData();

              });
            },
            onLoading: () async{
                await Future.delayed(Duration(seconds: 3));


                setState(() {
                  for(int i = 0; i<10; i++) {
                    _titles.add('$i');
                  }
                  _refreshVc.refreshCompleted();

                });
            },
          )
      ),
    );

  }





}


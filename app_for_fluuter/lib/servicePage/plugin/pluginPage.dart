
import 'package:flutter/material.dart';
import 'dio_page.dart';
import 'event_bus_page.dart';
import 'location_page.dart';
import 'url_launch_page.dart';
import 'video_player_page.dart';
import 'web_view_plugin_page.dart';
import 'bmprogresshud_page.dart';
import 'cache_image_page.dart';
import 'path_provider_page.dart';

class PluginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _PluginPageState();
  }
}

class _PluginPageState extends State<PluginPage> {

  List<String> _list = ["DioPage","EventBus","LocationPage","UrlLaunchPage","Video_Player","WebViewPluginPage",
    "BMProgressHudPage","CacheImagePage","PathProviderPage",""];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PluginPage"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return ListTile(
              title: Text("${_list[index]}:-------$index"),
              onTap: (){
                if(index == 0){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DioPage()));
                }if(index == 1){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventBusPage()));
                }if(index == 2){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LocationPage()));
                }if(index == 3){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => UrlLaunchPage()));
                }if(index == 4){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoPlayerWidget()));
                }if(index == 5){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebViewPluginPage()));
                }if(index == 6){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => BMProgressHudPage()));
                }if(index == 7){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CacheImagePage()));
                }if(index == 8){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PathProviderPage()));
                }else {


                }
              },
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: _list.length
      ),
    );
  }
}
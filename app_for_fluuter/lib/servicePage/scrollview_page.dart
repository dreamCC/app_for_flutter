
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:app_for_fluuter/common/utils.dart';

import 'bmprogresshud_page.dart';




class ScrollViewPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    print(screenH);
    print(screenW);

    return _ScrollViewPageState();
  }
}

class _ScrollViewPageState extends State<ScrollViewPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    print('_ScrollViewPageState--build');
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, inner){
            return [
              SliverAppBar(
                expandedHeight: 200,

              )
            ];
          },
          body: ListView.separated(itemBuilder: _itemBuilder, separatorBuilder: (contxt, index) => Divider(), itemCount: 20)
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('无与伦比的标题+$index'),
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return BMProgressHudPage();
        }));
      },
    );
  }
}
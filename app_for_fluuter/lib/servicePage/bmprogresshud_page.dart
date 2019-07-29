
import 'package:flutter/material.dart';
import 'package:app_for_fluuter/common/progress_hud.dart';


import 'package:progress_dialog/progress_dialog.dart';

import 'dart:math';

import 'package:flutter/foundation.dart';

class BMProgressHudPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BMProgressHudState();
  }
}


class _BMProgressHudState extends State<BMProgressHudPage> {


  List<String> _contents = ['show','showLoading','showSuccessAndDismiss','showErrorAndDismiss','showAndDismiss','showMessage','ProgressDialog',
  'progressHud_dialog-normal', 'progressHud_dialog-downlog'];

  StringBuffer _name = StringBuffer();


  GlobalKey<ProgressHudState> _progressKey;


  @override
  Widget build(BuildContext context) {

    print('build start');


    return GestureDetector(
      onTap: (){

        print(_progressKey.currentState);
        _progressKey.currentState.dismiss();

      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMProgressHudPage'),
        ),
        body: ProgressHud(
            child:  ListView.separated(
                itemBuilder: _itemCreate,
                separatorBuilder: _seperateCreate,
                itemCount: _contents.length,
            ),
          key: _progressKey = GlobalKey(),
        )
      ),
    );
  }

  Widget _itemCreate(BuildContext context, int index) {
    return ListTile(
      title: Text('${_contents[index]}-----$index'),
      onTap: (){

        if(index == 0) {

          _progressKey.currentState.show(ProgressHudType.loading, '加载中...');

          Future.delayed(Duration(seconds: 3)).then((value){
            _progressKey.currentState.dismiss();

          });
        }else if(index == 1) {
          _progressKey.currentState.showLoading();

          Future.delayed(Duration(seconds: 3)).then((value){
            _progressKey.currentState.showSuccessAndDismiss(text: 'chenggong');

          });
        }else if(index == 2) {
          _progressKey.currentState.showSuccessAndDismiss(text: 'showSuccessAndDismiss');
        }else if(index == 3) {
          _progressKey.currentState.showErrorAndDismiss();
        }else if(index == 4) {
          _progressKey.currentState.showAndDismiss(ProgressHudType.progress, 'showAndDismiss');
        }else if(index == 5) {
          _progressKey.currentState.showAndDismiss(ProgressHudType.message, 'showAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismiss');
        }else {

          //ProgressHud.of(context).showLoading();

          _name.writeln('hello, world');



          print(_name);
        }
      },
    );
  }

  Widget _seperateCreate(BuildContext context, int index) {
    return Divider();
  }


}

class StateLessColor extends StatelessWidget {
  final Color color = Color.fromARGB(1, Random.secure().nextInt(255), Random.secure().nextInt(255), Random.secure().nextInt(255));

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.color,
    );
  }
}


class Person extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return null;
  }
}


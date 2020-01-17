
import 'package:flutter/material.dart';
import 'package:app_for_fluuter/common/progress_hud.dart';


import 'dart:io';
import 'package:progress_dialog/progress_dialog.dart';

import 'dart:math';

import 'package:flutter/foundation.dart';

import 'dart:async';
class BMProgressHudPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BMProgressHudState();
  }
}


class _BMProgressHudState extends State<BMProgressHudPage> {


  List<String> _contents = ['show','showLoading','showSuccessAndDismiss','showErrorAndDismiss','showAndDismiss','showMessage'];


  GlobalKey<ProgressHudState> _progressKey = GlobalKey();

  double progress = 0;

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: (){

        //_progressKey.currentState.dismiss();

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
          key: _progressKey
        )
      ),
    );
  }

  Widget _itemCreate(BuildContext context, int index) {
    return ListTile(
      title: Text('${_contents[index]}-----$index'),
      onTap: (){

        if(index == 0) {

          _progressKey.currentState.show(ProgressHudType.loading, text: '加载中...');

          Future.delayed(Duration(seconds: 3)).then((value){
            _progressKey.currentState.dismiss();

          });
        }else if(index == 1) {
          _progressKey.currentState.showLoading();

          Future.delayed(Duration(seconds: 3)).then((value){
            _progressKey.currentState.showSuccessAndDismiss(text: 'chenggong');

          });
        }else if(index == 2) {
          _progressKey.currentState.showSuccessAndDismiss(text: 'showSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismiss');
        }else if(index == 3) {
          _progressKey.currentState.showErrorAndDismiss();
        }else if(index == 4) {
          _progressKey.currentState.showProgress(progress, text: '下载中...');


          Timer.periodic(Duration(seconds: 1 ), (timer){
            progress += 0.1;
            if(progress > 1) {
              timer.cancel();
              _progressKey.currentState.dismiss();
              return;
            }
           _progressKey.currentState.updateProgress(progress, text:'下载中...');
          });

        }else if(index == 5) {
          _progressKey.currentState.showTextAndDismiss(text:'下载失败');
        }else {


        }
      },
    );
  }

  Widget _seperateCreate(BuildContext context, int index) {
    return Divider();
  }
}


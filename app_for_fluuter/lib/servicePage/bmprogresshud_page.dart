
import 'package:flutter/material.dart';
import 'package:app_for_fluuter/common/progress_hud.dart';


import 'package:progress_dialog/progress_dialog.dart';

import 'dart:math';


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

  String _name;


  @override
  Widget build(BuildContext context) {

    print('build start');


    return GestureDetector(
      onTap: (){

        print(ProgressHud.of(context));
        ProgressHud.of(context).dismiss();

      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMProgressHudPage'),
        ),
        body: Builder(
            builder: (context){
              return ProgressHud(
                  child:  ListView.separated(
                      itemBuilder: _itemCreate,
                      separatorBuilder: _seperateCreate,
                      itemCount: _contents.length
                  )
              );
            }
        ),
      ),
    );
  }

  Widget _itemCreate(BuildContext context, int index) {
    return ListTile(
      title: Text('${_contents[index]}-----$index'),
      onTap: (){

        if(index == 0) {

          ProgressHud.of(context).show(ProgressHudType.loading, '加载中...');

          Future.delayed(Duration(seconds: 3)).then((value){
            ProgressHud.of(context).dismiss();

          });
        }else if(index == 1) {
          ProgressHud.of(context).showLoading();

          Future.delayed(Duration(seconds: 3)).then((value){
            ProgressHud.of(context).showSuccessAndDismiss(text: 'chenggong');

          });
        }else if(index == 2) {
          ProgressHud.of(context).showSuccessAndDismiss(text: 'showSuccessAndDismiss');
        }else if(index == 3) {
          ProgressHud.of(context).showErrorAndDismiss();
        }else if(index == 4) {
          ProgressHud.of(context).showAndDismiss(ProgressHudType.progress, 'showAndDismiss');
        }else if(index == 5) {
          ProgressHud.of(context).showAndDismiss(ProgressHudType.message, 'showAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismissshowAndDismiss');
        }else {

          //ProgressHud.of(context).showLoading();
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
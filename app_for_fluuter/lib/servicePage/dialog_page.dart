
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_for_fluuter/common/dialog_util.dart';


class DialogPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {


    List<String> _items = ['normal--AutoDisappearte',
      'title--AutoDisappearte',
      'normal--TapDisappearte',
      'title--TapDisappearte',
      'title--progress',
      'normal--progress',
      'success---',
      'error----',
      ''
    ];
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('DialogPage'),
      ),
      body: ListView.separated(
          itemBuilder: (_, indext){

            return ListTile(
              title: Text(_items[indext] + '$indext'),
              onTap: (){
                if(indext == 0){
                  DialogUtil.showAutoDisappearDialog('showAutoDisappearDialogs'
                      'howAutoDisappearDialogshowAutoDisappearDialogshowAutoD'
                      'isappearDialogshowAutoDisappearDialogshowAutoDisappearDia'
                      'logshowAutoDisappearDialogshowAutoDisappearDialogshowAutoDisappearDialogshowAu'
                      'toDisappearDialogshowAutoDisappearDialogshowAutoDisappearDialog',
                    context,
                    title: '提示',
                    duration: 5,
                  );
                }else if(indext == 1) {

                  DialogUtil.showAutoDisappearDialog('showAutoDisappearDialogs',
                    context,
                    duration: 5,
                  );

                }else if(indext == 2) {

                  DialogUtil.showTapDisappearDialog('showA',
                    context,
                    title: '提示',

                  );

                }else if(indext == 3) {
                  DialogUtil.showTapDisappearDialog('错误',
                    context,
                  );


                }else if(indext == 4) {

                  DialogUtil.showProgressDialog(context, msg: '加载中1...').then((hello){
                    print('showProgressDialog====>$hello');
                  });

                  DialogUtil.showProgressDialog(context, msg: '加载中2...').then((hello){
                    print('showProgressDialog====>$hello');
                  });

                  Future.delayed(Duration(seconds: 2)).then((_){
                    DialogUtil.hiddenProgressDialog(context);


                  });

                  Future.delayed(Duration(seconds: 5)).then((_){
                    DialogUtil.hiddenProgressDialog(context);


                  });

                }else if(indext == 5) {

                  DialogUtil.showProgressDialog(context);

                  Future.delayed(Duration(seconds: 2)).then((_){
                    DialogUtil.hiddenProgressDialog(context);
                  });

                }else if(indext == 6) {

                  DialogUtil.showSuccessDialog(context);

                }else if(indext == 7) {

                  DialogUtil.showFailedDialog('这是一个很大的错误', context);
                }else {
                  DialogUtil.showIconDialog(context, Icon(Icons.print));
                }


               },
            );
          },
          separatorBuilder: (_, index){
            return Divider();
          },
          itemCount: _items.length
      )
    );
  }

}


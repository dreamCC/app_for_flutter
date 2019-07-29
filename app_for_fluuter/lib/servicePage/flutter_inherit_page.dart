
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_for_fluuter/common/mixin.dart';

class FlutterInheritPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _FlutterInheritPageState();
  }
}

class _FlutterInheritPageState extends State<FlutterInheritPage> with CanShowEmptyWidgetMixin, CanShowProgressHudWidgetMixin {

  @override
  void initState() {
    super.initState();

    showLoadingEmptyWidget();

    Future.delayed(Duration(seconds: 3)).then((value){
      hiddenEmptyWidget();

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('FlutterInheritPage'),
        ),
        body: mixinEmptyWidget(
          body: mixinProgressHudWidget(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('header'),
                  Divider(),
                  RaisedButton(
                    onPressed: () {
                      showEmptyWidget(
                          title: Text('标题'),
                          subTitle: Text('副标题'),
                          placeholedImage: Image.asset(
                            "assets/image0@2x.png", width: 200, height: 100,),
                          button: RaisedButton(
                            onPressed: () {
                              showLoadingEmptyWidget(
                                  loading: CupertinoActivityIndicator());
                              Future.delayed(Duration(seconds: 3)).then((value) {
                                hiddenEmptyWidget();
                              });
                            },
                            child: Text('重新加载'),
                          )
                      );
                    },
                    child: Text('showEmptyView'),

                  ),
                  RaisedButton(
                    onPressed: () {
//            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage()));

//            showCupertinoDialog(context: context, builder: (contxt){
//              return CupertinoAlertDialog(
//                title: Text('CupertinoAlertDialog'),
//                actions: <Widget>[
//                  RaisedButton(onPressed: (){}, child: Text('确定'),),
//                  RaisedButton(onPressed: (){
//
//                  }, child: Text('取消'),),
//
//                ],
//              );
//            });

                      showErrorProgressHud(msg: '这是一个错误');
                    },
                    child: Text('hiddenEmptyView'),

                  ),
                  RaisedButton(
                    onPressed: () {
                      showLoadingEmptyWidget();
                      Future.delayed(Duration(seconds: 3)).then((value) {
                        hiddenEmptyWidget();
                      });
                    },
                    child: Text('showEmtyViewLoading'),
                  ),
                ],
              ),
          )
        )
    );
  }


}

//-------------------------------------------------------------------------
class SecondPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SecondPageState();
  }
}

class _SecondPageState extends State<SecondPage> with CanShowEmptyWidgetMixin {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
      ),
    );
  }


}

//---------------------------------------------------------------------------


// dart 语言中的继承关系，可以使用with，implement， extent来实现。
abstract class Hu extends StatefulWidget {


}


abstract class HuState<T extends Hu> extends State<T> with CanShowEmptyWidgetMixin, CanShowProgressHudWidgetMixin {

  /// 导航栏标题。默认 = ""。
  String title;
  /// 标题样式。
  TextStyle titleStyle;
  


  /// 子类重写。用于配置设置。在initState方法中，调用。
  void didInitialize(){

    title = '';
    titleStyle = TextStyle();

  }

  @override
  void initState() {
    super.initState();

    didInitialize();
  }

}







import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_for_fluuter/common/progress_hud.dart';

class FlutterInheritPage extends Hu {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _FlutterInheritPageState();
  }
}

class _FlutterInheritPageState extends HuState<FlutterInheritPage> {

  @override
  void initState() {
    super.initState();


  }

  @override
  void didInitialize() {
    // TODO: implement didInitialize
    super.didInitialize();
    this.title = "FlutterInheritPage";
    this.hasProgressHud = true;
  }
  
  @override
  Widget buildContent(BuildContext context) {
    return Column(
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
                placeholedImage: Image.asset("assets/image0@2x.png", width: 200, height: 100,),
                button: RaisedButton(
                    onPressed: (){
                      showLoadingEmptyWidget(loading: CupertinoActivityIndicator());
                      Future.delayed(Duration(seconds: 3)).then((value){
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
            Future.delayed(Duration(seconds: 3)).then((value){
              hiddenEmptyWidget();
            });
          },
          child: Text('showEmtyViewLoading'),
        ),
      ],
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

class _SecondPageState extends State<SecondPage> {

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


abstract class HuState<T extends Hu> extends State<T> with EmptyWidgetStateMixin, ProgressHudWidgetStateMixin {

  /// 导航栏标题。默认 = ""。
  String title;
  /// 标题样式。
  TextStyle titleStyle;
  

  /// 子类重写。用来创建content。
  Widget buildContent(BuildContext context);

  /// 子类重写。用于配置设置。在initState方法中，调用。
  void didInitialize(){

    title = '';
    titleStyle = TextStyle();
    hasProgressHud = false;

    emptyViewState = HuEmptyViewState.hidden;
  }

  @override
  void initState() {
    super.initState();

    didInitialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: titleStyle,),
        centerTitle: true,
      ),
      body: _creatBodyWidget()
    );
  }

  Widget _creatBodyWidget() {

    Widget contentWidget;
    switch(emptyViewState) {
      case HuEmptyViewState.Loading:
        contentWidget = Center(child: loadingWidget,);
        break;
      case HuEmptyViewState.show:
        contentWidget = emptyWidget;
        break;
      case HuEmptyViewState.hidden:
        contentWidget = buildContent(context);
        break;
      default:
        break;
    }

    if(hasProgressHud) {
      return ProgressHud(child: contentWidget, key: progressHudKey = GlobalKey(),);
    }
    return contentWidget;
  }

}


enum HuEmptyViewState {
  Loading,
  hidden,
  show,
}
mixin EmptyWidgetStateMixin<T extends StatefulWidget> on State<T> {
  
  // emptyView。
  HuEmptyViewState emptyViewState;
  Widget emptyWidget;
  Widget loadingWidget;

  // ignore: slash_for_doc_comments
  /***************************** empty view start *************************************/
  void showLoadingEmptyWidget({Widget loading}) {

    setState(() {
      emptyViewState = HuEmptyViewState.Loading;
      loadingWidget  = _createLoadingWidget(loading: loading);
    });
  }

  void showEmptyWidget({Text title, Text subTitle, Image placeholedImage, MaterialButton button}) {
    setState(() {
      emptyViewState = HuEmptyViewState.show;
      emptyWidget = _createEmptyWidget(title: title, subTitle: subTitle, placeholedImage: placeholedImage, button: button);
    });
  }

  void showCustomEmptyWidget(Widget customWidget) {
    setState(() {
      emptyViewState = HuEmptyViewState.show;
      emptyWidget = customWidget;

    });
  }

  void hiddenEmptyWidget() {
    setState(() {
      emptyViewState = HuEmptyViewState.hidden;
    });
  }

  Widget _createEmptyWidget({Text title, Text subTitle, Image placeholedImage, MaterialButton button}) {
    List<Widget> _children = List();
    if(title != null) {
      _children.add(title);
    }
    if(subTitle != null) {
      _children.add(subTitle);
      _children.add(SizedBox(height: 10,));
    }
    if(placeholedImage != null) {
      _children.add(placeholedImage);
      _children.add(SizedBox(height: 10,));
    }
    if(button != null) {
      _children.add(button);
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _children,
      ),
    );
  }

  Widget _createLoadingWidget({Widget loading}) {
    return loading != null? loading:CircularProgressIndicator();
  }
// ignore: slash_for_doc_comments
/***************************** empty view end *************************************/

}


mixin ProgressHudWidgetStateMixin<T extends StatefulWidget> on State<T> {

  /// 是否有progressHud。默认false。
  bool hasProgressHud;

  // progresshud。
  GlobalKey<ProgressHudState> progressHudKey;

  // ignore: slash_for_doc_comments
  /***************************** progress start *************************************/
  void showHintProgressHud(String hint) {
    judgetHasProgressHudValue();
    progressHudKey.currentState.showMessageAndDismiss(text: hint);
  }

  void showSuccessProgressHud({String msg}) {
    judgetHasProgressHudValue();
    progressHudKey.currentState.showSuccessAndDismiss(text: msg);
  }

  void showErrorProgressHud({String msg}) {
    judgetHasProgressHudValue();
    progressHudKey.currentState.showErrorAndDismiss(text: msg);
  }


  void showMsgProgressHud(String msg) {
    judgetHasProgressHudValue();
    progressHudKey.currentState.showLoading(text: msg);
  }

  void hiddenProgressHud() {
    judgetHasProgressHudValue();
    progressHudKey.currentState.dismiss();
  }

  void judgetHasProgressHudValue() {
    if(!hasProgressHud){
      throw Exception("hasProgressHud must be set true");
    }
  }

  // ignore: slash_for_doc_comments
  /***************************** progress  end *************************************/
}



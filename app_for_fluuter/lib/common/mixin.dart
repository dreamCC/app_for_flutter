
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'progress_hud.dart';

enum EmptyWidgetState {
  Loading,
  hidden,
  show,
}

mixin CanShowEmptyWidgetMixin<T extends StatefulWidget> on State<T> {

  /// emptyView。
  EmptyWidgetState _emptyWidgetState;
  Widget _emptyWidget;
  Widget _loadingWidget;


  @override
  void initState() {
    super.initState();
    _emptyWidgetState = EmptyWidgetState.hidden;
  }

  // ignore: non_constant_identifier_names
  Widget CanShowEmptyWidget({@required Widget body}) {
    switch(_emptyWidgetState) {
      case EmptyWidgetState.Loading:
        return Center(child: _loadingWidget,);
      case EmptyWidgetState.show:
        return  _emptyWidget;
      case EmptyWidgetState.hidden:
        return  body;
      default:
        return null;
        break;
    }
  }

  // ignore: slash_for_doc_comments
  /***************************** empty view start *************************************/
  void showLoadingEmptyWidget({Widget loading}) {

    setState(() {
      _emptyWidgetState = EmptyWidgetState.Loading;
      _loadingWidget  = _createLoadingWidget(loading: loading);
    });
  }

  void showEmptyWidget({Text title, Text subTitle, Image placeholedImage, MaterialButton button}) {
    setState(() {
      _emptyWidgetState = EmptyWidgetState.show;
      _emptyWidget = _createEmptyWidget(title: title, subTitle: subTitle, placeholedImage: placeholedImage, button: button);
    });
  }

  void showCustomEmptyWidget(Widget customWidget) {
    setState(() {
      _emptyWidgetState = EmptyWidgetState.show;
      _emptyWidget = customWidget;
    });
  }

  void hiddenEmptyWidget() {
    setState(() {
      _emptyWidgetState = EmptyWidgetState.hidden;
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



mixin CanShowProgressHudWidgetMixin<T extends StatefulWidget> on State<T> {



  // ignore: non_constant_identifier_names
  Widget CanShowProgressHudWidget({@required Widget body}){
    return ProgressHud(child: body, key: _progressHudKey,);
  }


  /// progresshud key。
  GlobalKey<ProgressHudState> _progressHudKey;

  @override
  void initState() {
    super.initState();

    _progressHudKey = GlobalKey();
  }


  // ignore: slash_for_doc_comments
  /***************************** progress start *************************************/
  Future showHintProgressHud(String hint) {
    judgetHasProgressHudValue();
    return _progressHudKey.currentState.showTextAndDismiss(text: hint);
  }

  Future showSuccessProgressHud({String msg}) {
    judgetHasProgressHudValue();
    return _progressHudKey.currentState.showSuccessAndDismiss(text: msg);
  }

  Future showErrorProgressHud({String msg}) {
    judgetHasProgressHudValue();
    return _progressHudKey.currentState.showErrorAndDismiss(text: msg);
  }


  void showMsgProgressHud(String msg) {
    judgetHasProgressHudValue();
    _progressHudKey.currentState.showLoading(text: msg);
  }

  void hiddenProgressHud() {
    judgetHasProgressHudValue();
    _progressHudKey.currentState.dismiss();
  }

  void judgetHasProgressHudValue() {
    if(_progressHudKey == null){
      throw Exception("you must use [mixinProgressHudWidget] to create you widget what you want has ProgressHud");
    }
  }
// ignore: slash_for_doc_comments
/***************************** progress  end *************************************/
}










import 'package:app_for_fluuter/common/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'progress_hud.dart';

mixin CanShowEmptyWidgetMixin<T extends StatefulWidget> on State<T> {

  GlobalObjectKey<EmptyWidgetState> get emptyWidgetKey;

  // ignore: slash_for_doc_comments
  /***************************** empty view start *************************************/
  void showLoadingEmptyWidget({Widget loading}) {
    emptyWidgetKey.currentState.showLoadingEmptyWidget(loading: loading);
  }

  void showEmptyWidget({Text title, Text subTitle, Image placeHoledImage, MaterialButton button}) {
    emptyWidgetKey.currentState.showEmptyWidget(
        title: title,
        subTitle: subTitle,
        placeHoledImage: placeHoledImage,
        button: button
    );
  }

  void showCustomEmptyWidget(Widget customWidget) {
    emptyWidgetKey.currentState.showCustomEmptyWidget(customWidget);
  }

  void hiddenEmptyWidget() {
    emptyWidgetKey.currentState.hiddenEmptyWidget();
  }

// ignore: slash_for_doc_comments
/***************************** empty view end *************************************/
}



mixin CanShowProgressHudWidgetMixin<T extends StatefulWidget> on State<T> {

  GlobalObjectKey<ProgressHudState> get progressHudKey;

  // ignore: slash_for_doc_comments
  /***************************** progress start *************************************/
  Future showHintProgressHud(String hint) {
    judgeHasProgressHudValue();
    return progressHudKey.currentState.showTextAndDismiss(text: hint);
  }

  Future showSuccessProgressHud({String msg}) {
    judgeHasProgressHudValue();
    return progressHudKey.currentState.showSuccessAndDismiss(text: msg);
  }

  Future showErrorProgressHud({String msg}) {
    judgeHasProgressHudValue();
    return progressHudKey.currentState.showErrorAndDismiss(text: msg);
  }


  void showMsgProgressHud(String msg) {
    judgeHasProgressHudValue();
    progressHudKey.currentState.showLoading(text: msg);
  }

  void hiddenProgressHud() {
    judgeHasProgressHudValue();
    progressHudKey.currentState.dismiss();
  }

  void judgeHasProgressHudValue() {
    if(progressHudKey == null){
      throw Exception("you must create [progressHudKey]");
    }
    if(progressHudKey.currentState == null){
      throw Exception("ProgressHud must have a [key]。and the key should be [progressHudKey]");
    }
  }
// ignore: slash_for_doc_comments
/***************************** progress  end *************************************/
}










import 'package:flutter/material.dart';
import 'empty_widget.dart';
import 'progress_hud.dart';

/// hud method - start
Future<void> showHintProgressHud(BuildContext context, String hint) {
  return ZScaffold.of(context).showHintProgressHud(hint);
}

Future<void> showSuccessProgressHud(BuildContext context, {String text}) {
  return ZScaffold.of(context).showSuccessProgressHud(text: text);
}

Future<void> showErrorProgressHud(BuildContext context, {String text}) {
  return ZScaffold.of(context).showErrorProgressHud(text: text);
}


void showLoadingProgressHud(BuildContext context, {String text}) {
  ZScaffold.of(context).showLoadingProgressHud(text: text);
}

void dismissProgressHud(BuildContext context) {
  ZScaffold.of(context).dismissProgressHud();
}
/// hud method - end

/// empty widget method - start
void showLoadingEmptyWidget(BuildContext context, {Widget loading}) {
  ZScaffold.of(context).showLoadingEmptyWidget(loading: loading);
}

void showEmptyWidget(BuildContext context, {Text title, Text subTitle, Image placeHoledImage, MaterialButton button}) {
  ZScaffold.of(context).showEmptyWidget(
      title: title,
      subTitle: subTitle,
      placeHoledImage: placeHoledImage,
      button: button
  );
}

void showCustomEmptyWidget(BuildContext context, Widget customWidget) {
  ZScaffold.of(context).showCustomEmptyWidget(customWidget);
}

void dismissEmptyWidget(BuildContext context) {
  ZScaffold.of(context).dismissEmptyWidget();
}
/// empty widget method - end

class ZScaffold extends StatefulWidget {

  final PreferredSizeWidget appBar;

  final Widget body;

  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final FloatingActionButtonAnimator floatingActionButtonAnimator;

  final Color backgroundColor;

  final Widget bottomNavigationBar;

  final bool hasProgressHud;

  final bool hasEmptyWidget;

  ZScaffold({Key key,
      this.appBar,
      this.body,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.floatingActionButtonAnimator,
      this.backgroundColor,
      this.bottomNavigationBar,
      this.hasProgressHud = false,
      this.hasEmptyWidget = false
      }) : super(key: key);

  @override
  ZScaffoldState createState() => ZScaffoldState();

  static ZScaffoldState of(BuildContext context) {
    final ZScaffoldState result = context.findAncestorStateOfType<ZScaffoldState>();
    if(result != null) return result;
    throw FlutterError('ZScaffoldState.of() called with a context that does not contain a ZScaffoldState.');
  }
}

class ZScaffoldState extends State<ZScaffold> {

  GlobalKey<ProgressHudState> hudKey = GlobalKey();
  GlobalKey<EmptyWidgetState> emptyWidgetKey = GlobalKey();

  /// hud method - start
  Future<void> showHintProgressHud(String hint) {
    return hudKey.currentState.showHint(hint: hint);
  }

  Future<void> showSuccessProgressHud({String text}) {
    return hudKey.currentState.showSuccess(text: text);
  }

  Future<void> showErrorProgressHud({String text}) {
    return hudKey.currentState.showError(text: text);
  }


  void showLoadingProgressHud({String text}) {
    hudKey.currentState.showLoading(text: text);
  }

  void dismissProgressHud() {
    hudKey.currentState.dismiss();
  }
  /// hud method - end

  /// empty widget method - start
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

  void dismissEmptyWidget() {
    emptyWidgetKey.currentState.dismissEmptyWidget();
  }
  /// empty widget method - end


  @override
  Widget build(BuildContext context) {

    Widget body = widget.body;
    if(widget.hasEmptyWidget) {
      body = EmptyWidget(
        key: emptyWidgetKey,
        child: body,
      );
    }

    if(widget.hasProgressHud) {
      body = ProgressHud(
        key: hudKey,
        child: body,
      );
    }

    return Scaffold(
      appBar: widget.appBar,
      body: body,
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
      backgroundColor: widget.backgroundColor,
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}


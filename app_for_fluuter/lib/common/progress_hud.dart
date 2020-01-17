import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';


enum ProgressHudType {
  /// 加载。CupertinoActivityIndicator
  loading,
  /// 显示Icons.check 和 text
  success,
  /// 显示Icons.close 和 text
  error,
  /// 显示CircularProgressIndicator
  progress,
  /// 只显示text内容。
  text
}



class ProgressHud extends StatefulWidget {

  /// 背景颜色。默认Colors.transparent
  Color backgroudColor;

  /// 中间Container的颜色。默认Color.fromARGB(255, 232, 234, 236)
  Color containerColor;

  /// 中间Container的Y轴偏移。默认-50.
  double offsetY;

  /// 中间Container最大宽度。 默认屏幕宽度 - 40.
  double containerMaxW;

  /// 文本样式。TextStyle(fontSize: 16, color: Colors.white
  TextStyle textStyle;

  /// 图标大小。默认40。
  double iconSize;

  /// 子控件。
  Widget child;


  ProgressHud({
      Key key,
      this.backgroudColor = Colors.transparent,
      this.containerColor = const Color.fromARGB(255, 232, 234, 236),
      this.offsetY = -50,
      this.textStyle = const TextStyle(fontSize: 16, color: Color(0xFF262626)),
      this.iconSize = 40,
      this.child}) : super(key: key);

  @override
  ProgressHudState createState() => ProgressHudState();
}


class ProgressHudState extends State<ProgressHud> with SingleTickerProviderStateMixin {

  
  bool _isVisible = false;
  String _text = '';
  ProgressHudType _progressHudType;
  double _progressValue = 0;

  @override
  void initState() {
    super.initState();

    if(widget.containerMaxW == null) widget.containerMaxW = window.physicalSize.width/window.devicePixelRatio - 40;
  }

  

  ///  * 显示Hud
  ///  * type，HUD类型
  ///  * test，内容
  void show(ProgressHudType type,{String text}) {

    setState(() {
      _isVisible = true;
      _text = text;
      _progressHudType = type;
    });
  }

  ///  * 隐藏Hud
  void dismiss() {
    setState(() {
      _isVisible = false;
    });
  }

  ///  * 显示Hud，并自动隐藏
  ///  * type，HUD类型
  ///  * test，内容
  Future<void> showAndDismiss(ProgressHudType type,{String text}) async {

    show(type, text: text);
    
    var millisecond;
    if(_text == null || _text.length == 0){
      millisecond = 1000;
    }else {
      millisecond = max(500 + text.length * 100, 1000);
    }
    var duration = Duration(milliseconds: millisecond);
    await Future.delayed(duration);
    dismiss();
  }


  ///  * 显示ProgressHudType.loading类型的hud
  void showLoading({String text}) {
     show(ProgressHudType.loading, text: text);
  }

  ///  * 显示ProgressHudType.success类型的hud
  Future<void> showSuccessAndDismiss({String text}) async {
    await showAndDismiss(ProgressHudType.success, text: text);
  }

  ///  * 显示ProgressHudType.error类型的hud
  Future<void> showErrorAndDismiss({String text}) async {
    await showAndDismiss(ProgressHudType.error, text: text);
  }

  ///  * 显示ProgressHudType.text类型的hud
  Future<void> showTextAndDismiss({String text}) async {
    await showAndDismiss(ProgressHudType.text, text: text);
  }

  ///  * 显示ProgressHudType.progress类型的hud
  void showProgress(double value, {String text}) async {

    show(ProgressHudType.progress, text: text);
    setState(() {
      _progressValue = value;
    });
  }

  ///  * 更新ProgressHudType.progress的value。
  void updateProgress(double value, {String text}) {
    if(value >1) value = 1;

    setState(() {
      _progressValue = value;
      _text = text;
    });
  }



  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        widget.child,
        Offstage(
            offstage: !_isVisible,
            child: _isVisible?_progressHud():null
        ),
      ],
    );
  }

  //------prvate method
  Widget _progressHud() {
    
    List<Widget> chirlds;
    switch (_progressHudType) {
      case ProgressHudType.loading:
        chirlds = _loadingWidgets();
        break;
      case ProgressHudType.error:
        chirlds = _errorWidgets();
        break;
      case ProgressHudType.success:
        chirlds = _successWidgets();
        break;
      case ProgressHudType.progress:
        chirlds = _progressWidgets();
        break;
      case ProgressHudType.text:
        chirlds = _textWidgets();
        break;
      default:
        throw Exception("not implementation");
    }
    
    return Stack(
      children: <Widget>[
        
        // backgroud
        Container(
          color: widget.backgroudColor,
        ),

        // container
        Center(
          child: Container(
              margin: _containerWidgetMargin,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: widget.containerColor,
                  borderRadius: BorderRadius.circular(5)
              ),
              constraints: BoxConstraints(
                  minHeight: 50,
                  minWidth: 50,
                  maxWidth: widget.containerMaxW
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: chirlds,
              )
          ),
        )
      ],
    );
  }

  
  List<Widget> _loadingWidgets() {
    
    List<Widget> _hudList = List();
    _hudList.add(
         SizedBox(
             width: widget.iconSize,
             height: widget.iconSize,
             child: CupertinoActivityIndicator(animating: true, radius: widget.iconSize/3,)
         )
     );

    if(_textWidget != null) _hudList.add(_textWidget);
    return _hudList;
  }

  List<Widget> _successWidgets() {
    List<Widget> _hudList = List();

    _hudList.add(
        Icon(Icons.check, color: widget.textStyle.color, size: widget.iconSize)
    );
    if(_textWidget != null) _hudList.add(_textWidget);
    return _hudList;
  }

  List<Widget> _errorWidgets() {
    List<Widget> _hudList = List();

    _hudList.add(
        Icon(Icons.close, color: widget.textStyle.color, size: widget.iconSize)
    );
    if(_textWidget != null) _hudList.add(_textWidget);
    return _hudList;
  }


  List<Widget> _progressWidgets() {


    List<Widget> _hudList = List();

    _hudList.add(
        SizedBox.fromSize(
          child: CircularProgressIndicator(
            value: _progressValue,
            valueColor: AlwaysStoppedAnimation<Color>(widget.textStyle.color),
          ),
          size: Size(widget.iconSize, widget.iconSize),
        )
    );

    _hudList.add(
        SizedBox(height: 5,),
    );

    if(_textWidget != null) _hudList.add(_textWidget);
    return _hudList;
  }

  List<Widget> _textWidgets() {
    List<Widget> _hudList = List();
    if(_textWidget != null) _hudList.add(_textWidget);
    return _hudList;
  }


  Widget get _textWidget {

    int textLength = _text?.length;
    if(textLength != null && textLength > 0) {
      return Container(
        child: Text(
            _text,
            textAlign: TextAlign.center,
            style: widget.textStyle
        ),
      );
    }
    return null;
  }

  // 调整ContainerWidget位置。
  EdgeInsets get _containerWidgetMargin{
    if(widget.offsetY < 0) {
      return EdgeInsets.only(bottom: -widget.offsetY);
    }else {
      return EdgeInsets.only(top: widget.offsetY);
    }
  }

}


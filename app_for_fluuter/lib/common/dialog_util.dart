
import 'package:flutter/material.dart';

final Color _barrierColor   = Colors.white.withAlpha(0);
final Color _dialogBackgroudColor = Colors.black.withOpacity(0.7);
final Color _titleColor     = Colors.white;
final Color _dividerColor   = Colors.white;
final Color _contentColor   = Colors.white;

class DialogUtil {


  /// 显示一个可以自动消失的Hud
  static Future<dynamic> showAutoDisappearDialog(
      String msg,
      BuildContext ctx,
      {int duration = 3, String title = ''}) {

    return showMsssageDialog(
        msg,
        ctx,
        autoDisappear: true,
        duration: duration,
        title: title
    );
  }


  /// 显示一个点击消失的hud
  static Future<dynamic> showTapDisappearDialog(String msg, BuildContext ctx, {String title = ''}) {

    return showMsssageDialog(
        msg,
        ctx,
        autoDisappear: false,
        title: title
    );
}


  /// MessageDialog
  static Future<dynamic> showMsssageDialog(
      String msg,
      BuildContext ctx,
      {bool autoDisappear = true, int duration = 3, String title = ''}) {

    if(autoDisappear) {
      Future.delayed(Duration(seconds: duration)).then((_) {
        Navigator.of(ctx).pop();
      });
    }

    return showGeneralDialog(
      context: ctx,
      pageBuilder: (context, a, b) => _CustomDialog(_messageDialog(msg, title)),
      barrierDismissible: !autoDisappear,
      barrierColor: _barrierColor,
      barrierLabel: MaterialLocalizations.of(ctx).modalBarrierDismissLabel,
      transitionDuration: Duration(milliseconds: 150),
    );

  }


  /// 加载提示框
  static Future<dynamic> showProgressDialog(BuildContext ctx,
      {String msg = ''}) {
    return showGeneralDialog(
      context: ctx,
      pageBuilder: (context, a, b) => _CustomDialog(_progressDialog(msg)),
      barrierDismissible: false,
      barrierColor: _barrierColor,
      barrierLabel: MaterialLocalizations
          .of(ctx)
          .modalBarrierDismissLabel,
      transitionDuration: Duration(milliseconds: 150),
    );
  }

  /// 隐藏提示框
  static void hiddenProgressDialog(BuildContext ctx) {
    Navigator.of(ctx).pop();
  }


  /// 显示成功提示框
  static Future<dynamic> showSuccessDialog(BuildContext ctx) {

    return showIconDialog(ctx, Icon(Icons.check, size: 50, color: _titleColor,), msg: '成功');
  }

  /// 显示失败提示框
  static Future<dynamic> showFailedDialog(String msg, BuildContext ctx) {

    return showIconDialog(ctx, Icon(Icons.close, size: 50, color: _titleColor,), msg: msg);
  }

  /// 显示带图标的弹框
  static Future<dynamic> showIconDialog(BuildContext ctx, Icon icon, {String msg = ''}) {

    List<Widget> _list;

    if(msg.length > 0) {
      _list = [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: icon,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Text(msg, style: TextStyle(fontSize: 20, color: _titleColor),),
        )
      ];
    }else {
      _list = [
        Padding(
          padding: EdgeInsets.all(20),
          child: icon,
        ),
      ];
    }

    Future.delayed(Duration(seconds: 3)).then((_){
      Navigator.of(ctx).pop();
    });

    return showGeneralDialog(
      context: ctx,
      pageBuilder: (context, a, b) => _CustomDialog(_list),
      barrierDismissible: false,
      barrierColor: _barrierColor,
      barrierLabel: MaterialLocalizations.of(ctx).modalBarrierDismissLabel,
      transitionDuration: Duration(milliseconds: 150),
    );

  }


//  private  method
//--------------------------------------------------
  static List<Widget> _messageDialog(String msg, String title) {

    List<Widget> _list;
    if(title.length > 0) {
      _list = [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Text(title,
            style: TextStyle(color: _titleColor, fontSize: 20),),
        ),
        Divider(color: _dividerColor,),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            msg, style: TextStyle(fontSize: 20, color: _contentColor),),
        )
      ];
    }else {
      _list = [Padding(
        padding: EdgeInsets.all(20),
        child: Text(msg, style: TextStyle(fontSize: 20, color: _titleColor),),
      )];
    }

    return _list;
  }

  static List<Widget> _progressDialog(String msg) {

    List<Widget> _list;
    if(msg.length > 0) {
      _list =  [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: CircularProgressIndicator(),
        ),

        Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              msg, style: TextStyle(fontSize: 20, color: _contentColor),)
        )

      ];
    }else {
      _list = [
        Padding(
          padding: EdgeInsets.all(20),
          child: CircularProgressIndicator(),
        ),
      ];
    }
    return _list;
  }

}



// -----------
class _CustomDialog extends StatelessWidget {

  List<Widget> _list;
  _CustomDialog(@required this._list);

  @override
  Widget build(BuildContext context) {
    Duration insetAnimationDuration = const Duration(milliseconds: 100);
    Curve insetAnimationCurve = Curves.decelerate;

    return AnimatedPadding(
      padding: MediaQuery
          .of(context)
          .viewInsets +
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 50.0),
            child: Material(
              color: _dialogBackgroudColor,
              elevation: 24,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              type: MaterialType.card,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: _list,
              ),
            )
            ,
          )
        ),
      ),
    );
  }
}
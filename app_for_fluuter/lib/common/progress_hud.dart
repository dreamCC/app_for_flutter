import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


enum ProgressHudType {
  /// show loading with CupertinoActivityIndicator and text
  loading,
  /// show Icons.check and Text
  success,
  /// show Icons.close and Text
  error,
  /// show circle progress view and text
  progress,

  /// show message progress
  message
}

/// show progresshud like ios app
class ProgressHud extends StatefulWidget {
  /// the offsetY of hudview postion from center, default is -50
  final double offsetY;
  final Widget child;

  ProgressHud({ @required this.child, this.offsetY = -50, Key key })
    : super(key: key);

  @override
  ProgressHudState createState() => ProgressHudState();
}


class ProgressHudState extends State<ProgressHud> with SingleTickerProviderStateMixin {
  AnimationController _animation;
  
  var _isVisible = false;
  var _text = "";
  var _opacity = 0.0;
  var _progressType = ProgressHudType.loading;
  var _progressValue = 0.0;

  @override
  void initState() {
    _animation = AnimationController(
      duration: const Duration(milliseconds: 200), 
      vsync: this
    )..addListener(() {
      setState(() {
        _opacity = _animation.value;
      });
    })..addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _isVisible = false;          
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animation.dispose();
    _animation = null;
    super.dispose();
  }

  /// dismiss hud
  void dismiss() {

    _animation?.reverse();
  }

  /// show hud with type and text
  void show(ProgressHudType type, String text) {
    if (_animation != null) {
      _animation.forward();
      setState(() {
        _isVisible = true;
        _text = text;
        _progressType = type;
      });
    }    
  }

  /// show loading with text
  void showLoading({String text}) {
    this.show(ProgressHudType.loading, text);
  }

  /// show success icon with text and dismiss automatic
  Future showSuccessAndDismiss({String text}) async {
    await this.showAndDismiss(ProgressHudType.success, text);
  }
  
  /// show error icon with text and dismiss automatic
  Future showErrorAndDismiss({String text}) async {
    await this.showAndDismiss(ProgressHudType.error, text);
  }

  /// show message and dismiss automatic
  Future showMessageAndDismiss({String text}) async {
    await this.showAndDismiss(ProgressHudType.message, text);
  }

  /// update progress value and text when ProgressHudType = progress
  /// 
  /// should call `show(ProgressHudType.progress, "Loading")` before use
  void updateProgress(double progress, String text) {
    setState(() {
      _progressValue = progress;
      _text = text;
    });
  }

  /// show hud and dismiss automatically
  Future showAndDismiss(ProgressHudType type, String text) async {
    show(type, text);

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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.child,
        Offstage(
          offstage: !_isVisible,
          child: Opacity(
            opacity: _opacity,
            child: _createHud(),
          )
        )
      ],
    );
  }

  Widget _createHud() {
    const double kIconSize = 50;
    switch (_progressType) {
      case ProgressHudType.loading:
        var sizeBox = SizedBox(
          width: kIconSize, 
          height: kIconSize, 
          child: CupertinoActivityIndicator(animating: true, radius: 15)
        );
        return _createHudView(sizeBox);
      case ProgressHudType.error:
        return _createHudView(Icon(Icons.close, color: Colors.white, size: kIconSize));
      case ProgressHudType.success:
        return _createHudView(Icon(Icons.check, color: Colors.white, size: kIconSize));
      case ProgressHudType.progress:
        var progressWidget = CustomPaint(
          painter: CircleProgressBarPainter(progress: _progressValue),
          size: Size(kIconSize + 15, kIconSize + 15),
        );
        return _createHudView(progressWidget);
      case ProgressHudType.message:
        return _createHudView(SizedBox());
      default:
        throw Exception("not implementation");
    }
  }

  Widget _createHudView(Widget child) {
    return Stack(
      children: <Widget>[
        // do not response touch event
        IgnorePointer(
          ignoring: false,
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            height: double.infinity,
          ),
        ),        
        Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10 - widget.offsetY * 2),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 33, 33, 33), 
              borderRadius: BorderRadius.circular(5)
            ),
            constraints: BoxConstraints(
              minHeight: 50,
              minWidth: 50
            ),
            
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: _contentWidgets(child),
              ),
            ),
          ),
        ),
      ],
    );
  }
  
  List<Widget> _contentWidgets(Widget child) {
    if(_text == null || _text.length == 0){
      return <Widget>[
        Container(
          child: child,
        ),
      ];
    }
    return <Widget>[
      Container(
        child: child,
      ),
      Container(
        child: Text(
            _text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16)
        ),
      )

    ];
  }
}


class CircleProgressBarPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color color;
  final Color fillColor;
  const CircleProgressBarPainter({
    this.progress = 0,
    this.strokeWidth = 3,
    this.color = Colors.grey,
    this.fillColor = Colors.white
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..color = this.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    final double diam = min(size.width, size.height) - 15;
    final centerX = size.width * 0.5;
    final centerY = size.height * 0.5;
    final radius = diam / 2.0;

    canvas.drawCircle(Offset(centerX, centerY), radius, paint);
    paint.color = this.fillColor;
    // draw in center
    var rect = Rect.fromLTWH((size.width - diam) * 0.5, 0, diam, diam);
    canvas.drawArc(rect, -0.5 * pi, progress * 2 * pi, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
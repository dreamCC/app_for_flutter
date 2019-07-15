
import 'package:flutter/material.dart';


class CustomPaintPage extends StatefulWidget {

  _CustomPaintPageState state;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    state = _CustomPaintPageState();
    return state;
  }
}

class _CustomPaintPageState extends State<CustomPaintPage> {
  @override
  Widget build(BuildContext context) {

    print('CustomPaintPageState = ${widget.state}');
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomPaintPage'),
      ),
      body: Center(
        child: Container(
          color: Colors.grey,
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: DIYPainter(),
          ),
        )
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    print('CustomPaintPage---dispose');
  }
}


class DIYPainter extends CustomPainter {

 Paint _paint = Paint()
   ..color = Colors.purple
   ..strokeCap = StrokeCap.round
   ..strokeJoin = StrokeJoin.round
   ..strokeWidth = 5
   ..style = PaintingStyle.stroke;


  @override
  void paint(Canvas canvas, Size size) {


    // 线
    canvas.drawLine(Offset(0, 0), Offset(200, 200), _paint);

    // 矩形
    canvas.drawRect(Rect.fromLTRB(0, 0, 50, 50), _paint);

    // 圆
    canvas.drawCircle(Offset(100, 100), 30, _paint);

    // 圆弧
    Rect rect2 = Rect.fromCircle(center: Offset(100.0, 0.0), radius: 80.0);
    canvas.drawArc(rect2, 0.0, 0.8, true, _paint);

    // 带圆角的rect。
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTRB(10, 10, 180, 180), Radius.circular(10)), _paint);

    Path _path = Path();
    _path.moveTo(0, 0);
    _path.lineTo(200, 0);


    canvas.drawPath(_path, _paint);
  }
  

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}
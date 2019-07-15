
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class GesturePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GesturePageState();
  }
}

class _GesturePageState extends State<GesturePage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('GesturePage'),
      ),
      body: DraggAbleWidget()
    );
  }
}



// 关于手势，我们可以使用，InkWell、InkResponse来添加一些手势。这两个手势的特点是，会有水波纹动画。
// 如果我没想使用更多的动画，那么可以使用GestureDetector来进行装饰。这个手势的特点是没有水波纹效果的。
class GestureWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.purple
        ),
      ),
      onHorizontalDragStart: (drag){
        print(drag);
      },
      onHorizontalDragUpdate: (drag){
        print('${drag.delta}---${drag}---${drag.sourceTimeStamp}--${drag.globalPosition}');
      },
      onPanUpdate: (drag){
        print(drag);



      },
    );
  }
}


class DraggAbleWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return Container(
      width: 100,
      height: 100,
      color: Colors.red,
      margin: EdgeInsets.fromLTRB(100, 100, 0, 0),
    );

    return Draggable(
        child: Positioned(
            left: 100,
            top: 100,
            child: Container(
              color: Colors.purple,
              width: 100,
              height: 100,
            )
        ),
        feedback: Container(
          color: Colors.blue,
          width: 50,
          height: 50,
        )
    );
  }
}



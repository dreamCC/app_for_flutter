
import 'package:flutter/material.dart';

class CustomRenderObjPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomRenderObjPageState();
  }
}

class _CustomRenderObjPageState extends State<CustomRenderObjPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            title: Text("CustomRenderObjPage"),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight)
      ),
    );
  }
}



// 这里如果要实现自定义还是表麻烦的。
// 1、我们需要进行layout。
// 2、我们需要进行paint。
class CustomRenderObjcWidget extends RenderBox {


  @override
  void performLayout() {
    // TODO: implement performLayout
    super.performLayout();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // TODO: implement paint
    super.paint(context, offset);
  }

  @override
  bool hitTestSelf(Offset position) {
    // TODO: implement hitTestSelf
    return super.hitTestSelf(position);
  }

}
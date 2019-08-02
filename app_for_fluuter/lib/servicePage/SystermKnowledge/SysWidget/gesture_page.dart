
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

GlobalKey<_CustomRoutePageState> _customKey = GlobalKey();

class GesturePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GesturePageState();
  }

}

class _GesturePageState extends State<GesturePage> with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('GesturePage'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.keyboard_hide),
              onPressed: (){
                _customKey.currentState.hidden();
              }),
          IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: (){
                Navigator.of(context).push(
                    PageRouteBuilder(
                        barrierColor: Colors.grey.withOpacity(0.25),
                        barrierDismissible: true, // 点击蒙版，是否隐藏
                        opaque: false,

                        pageBuilder: (context, start, end){
                          return GesturePage();
                        },
                      transitionsBuilder: (context, start, end, child){

//                          return PositionedTransition(
//                              rect: RelativeRectTween(
//                                  begin: RelativeRect.fromLTRB(0, 0, 0, 0),
//                                  end: RelativeRect.fromLTRB(100, 0, 0, 0)).animate(CurvedAnimation(parent: start, curve: Curves.fastOutSlowIn)),
//                              child: child
//                          );

                        return SlideTransition(
                          position: Tween<Offset>(
                              begin: Offset(1.0, 0.0),
                              end: Offset(0.25, 0.0)
                          ).animate(CurvedAnimation(parent: start, curve: Curves.fastOutSlowIn)),
                          child: child,
                        );
                      }

                    )
                );
              }
          )
        ],
      ),
      body: DraggAbleWidget(),
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


class DraggAbleWidget extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DraggAbleWidgetState();
  }


}

class _DraggAbleWidgetState extends State<DraggAbleWidget> {

  double transforY = 0;



  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 150,
          height: 150,
          child: CustomRoutePage(key: _customKey,),
        ),
        Divider(),

        // 富文本。
        RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '请同意相关协议',
                  style: TextStyle(color: Colors.grey, fontSize: 16)
                ),
                TextSpan(
                  text: '《退役军人协议》',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                  recognizer: TapGestureRecognizer()..onTap = (){
                    print('点击了相关协议');
                    _customKey.currentState.show();
                  },
                )
              ]
            ),
        ),

        MyDragTarget(),

        Transform.translate(
            offset: Offset(0, transforY),
          child: GestureDetector(
            onVerticalDragUpdate: (DragUpdateDetails value){

              transforY += value.delta.dy;
              setState(() {
                print(transforY);
              });

            },
            child: Container(
              width: 150,
              height: 150,
              color: Colors.orangeAccent,
            ),
          ),

        ),



      ],
    );
  }
}


///draggable 是一个可以拖拽到DragTarget的widget
class MyDraggable extends StatelessWidget {
  final data;
  const MyDraggable({this.data = "MyDraggable", Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: data,
      child: Container(
        width: 150.0,
        height: 150.0,
        color: Colors.red[500],
        child: Center(
          child: Text('Draggable'),
        ),
      ),
      feedback: Container(
        width: 150.0,
        height: 150.0,
        color: Colors.blue[500],
        child: Icon(Icons.feedback),
      ),
    );
  }
}


class MyDragTarget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyDragTargetState();
}
class _MyDragTargetState extends State<MyDragTarget> {
  var targetText = "Target";//用于显示的文案
  @override
  Widget build(BuildContext context) {
    return DragTarget(
      onWillAccept: (data) {
        print("data = $data onWillAccept");
        return data != null;//当Draggable传递过来的dada不是null的时候 决定接收该数据。
      },
      onAccept: (data) {
        print("data = $data onAccept");
        setState(() {
          targetText = data;//接收该数据后修改文案内容。
        });
      },
      onLeave: (data) {
        print("data = $data onLeave");//我来了 我又走了
      },
      builder: (context, candidateData, rejectedData) {
        //这是DragTarget实际展示给用户看到的样子
        return Container(
          width: 150.0,
          height: 150.0,
          color: Colors.blue[500],
          child: Center(
            child: Text(targetText),
          ),
        );
      },
    );
  }
}



//---------------------

class CustomRoutePage extends StatefulWidget {

  CustomRoutePage({Key key}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CustomRoutePageState();
  }
}

class _CustomRoutePageState extends State<CustomRoutePage> with SingleTickerProviderStateMixin {

  AnimationController _fadeAnimationVc;
  Animation<double> _fadeAnimation;
  //Animation<num> _transAnimtion;

  void show() {
    _fadeAnimationVc.forward();
  }

  void hidden() {
    _fadeAnimationVc.reverse();
  }

  @override
  void initState() {
    super.initState();



    _fadeAnimationVc = AnimationController(vsync: this);
    _fadeAnimationVc.duration = Duration(seconds: 1);

    _fadeAnimation = Tween(begin: 0, end: 0.25).animate(_fadeAnimationVc);
    _fadeAnimation.addListener((){


      print('--------${_fadeAnimation.value}');
      setState(() {

      });
    });

//    _transAnimtion = Tween(begin: 0, end: 300).animate(_fadeAnimationVc);
//    _transAnimtion.addListener((){
//
//
//      print('_transAnimtion--------${_transAnimtion.value}');
//
//    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(_fadeAnimation.value),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _fadeAnimationVc.dispose();
  }
}




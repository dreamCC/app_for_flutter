
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:app_for_fluuter/common/notification_tool.dart';

import 'package:flutter/cupertino.dart';


class AnimationWidget extends StatefulWidget {



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AnimationWidgetState();
  }
}

class _AnimationWidgetState extends State<AnimationWidget> with SingleTickerProviderStateMixin {


  AnimationController _animationController;

  CurvedAnimation _curedAnimtion;


  Timer _timer;

  Animation<double> _animation;

  Animation<RelativeRect> _relativeAnimation;


  // method
  @override
  void initState() {
 
    super.initState();



    // 动画控制
    _animationController = AnimationController(
      vsync: this,
      animationBehavior: AnimationBehavior.normal,
      duration: Duration(seconds: 3),
    );


    // 动画控制着，_cureAnition。能够控制动画的线性规律
    _curedAnimtion = CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut
    );

    //Tween 对动画进行进行的时插值截取。
    _animation = Tween(begin: 0.3, end: 1.0).animate(_animationController)..addStatusListener((listener){
      
      if(listener == AnimationStatus.completed) {
        _animationController.reverse();
      }else if(listener == AnimationStatus.dismissed) {
        _animationController.forward();
      }

      print('addStatusListener----');

    })..addListener((){

      // 如果不使用AnimatioWidget， 我们可以使用_animation.value取值，然后通过setState、或者是StreamBuilt来对动画进行刷新。
      print('动画value----${_animation.value}');



    });
    


    _relativeAnimation = RelativeRectTween(begin: RelativeRect.fromLTRB(0, 0, 0, 0), end: RelativeRect.fromLTRB(50, 50, 50, 50)).animate(_animationController);

    _timer = Timer(Duration(seconds: 5), (){

      print('timer start 5');
    });


  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationWidget'),
      ),
      body: NotificationListener(
          onNotification: (CJNotification notify){
            print('收到通知---$notify.value');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[

              _startAnimtionButton(context),
              Divider(),

              // 缩放
              ScaleTransition(
                scale: _curedAnimtion,
                child: FlutterLogo(size: 50,),
              ),

              // 改变透明度
              FadeTransition(
                opacity: _animation,
                child: FlutterLogo(size: 50,),
              ),

              // 动画嵌套
              FadeTransition(
                opacity: _curedAnimtion,
                child: ScaleTransition(scale: _curedAnimtion, child: FlutterLogo(size: 50,),),
              ),

              // PostionTransition
              Container(
                width: 200,
                height: 200,
                child: Stack(
                  children: <Widget>[
                    PositionedTransition(
                        rect: _relativeAnimation,
                        child: FlutterLogo(size: 50,)
                    )
                  ],
                ),
              ),

              // 平移动画的实现，目前没有找到相应的widget，那么我们就只能使用setState的方式来进行动画。




            ],
          ),
      )
    );
  }



  // 开始动画按钮
  Widget _startAnimtionButton(BuildContext context) {

    return NotificationListener<CJNotification>(
        onNotification: (notify){
          print('父节点收到通知---$notify.value');

        },
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Builder(builder: (context){
            return CupertinoButton(
              padding: EdgeInsets.all(10),
              onPressed: () {
                print('开始动画');

                _animationController.forward();

                // 定时器的用法。
                Timer.periodic(Duration(seconds: 1), (timer){
                  print('timer start');

                  // 5秒后动画停止。
                  Future.delayed(Duration(seconds: 5)).then((value){
                    timer.cancel();

                    //Navigator.of(context).pop('动画结束');
                  });
                });



                // 发送通知。
                CJNotification(value: 'CJNotification-开始动画').dispatch(context);


              },
              child: Column(
                children: <Widget>[
                  Icon(Icons.camera),
                  Text('开始动画')
                ],
              ),
            );
          })

        )
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _animationController.dispose();
    _animation.removeListener(null);
    _animation.removeStatusListener(null);
  }
}







import 'package:flutter/material.dart';


/**
 * flutter的渲染机制。
 * 1、首选我们需要了解widget树 。
 * 1.1、我们使用的所有类都是widget。
 * 1.2、widget是 @immutable（不可变的），所以widget不会管理state，widget只是配置信息，不会显示。
 * 2、我们需要了解element树。
 * 2.1、我们所有的widget都是通过createElement来创建Element。
 * 2.2、Element持有widget和rendObject两个属性。
 * 2.3、Element才是具备显示的控件。
 *
 * flutter的渲染过程。
 * 当我们调用 setState后，widget会重新调用build 方法，创建新的widget树。同时新的widget树会和旧widget树做对比（每个节点都会对比）。
 * 其中对比分为很多过程，我们可以参考elment.updateChilde 方法的说明。比如，如果新的widget树种，某个节点的widget移除，那么通过对比，
 * 会发现需要更新updatechilde，所以就会刷新界面。比如，如果新的widget树，某个节点和旧的widget树的同一个节点对比[canupdate = true],
 * 那么就不会刷新界面。canUpdte会比较widget的runtimeType和key。所以key有时会显得特别重要。
 * 比如：下面这个例子。如果我们不传key的时候，flutter会对比新旧widget，canupdate，然后发现，runtimeType是一样的，然后返回ture
 * 所以整个页面不会刷新（element不会调用updateChirld），所以我们会发现widget不会调用createStata 和 initState方法。
 * 同理如果传key，两次的key不一样。那么通过调用widget.canupdate返回true。所以这个时候会进行界面刷新，调用createState和 initState方法*/




/**
 * flutter中，key的类型。
 * UnicodeKey() 作为唯一标识。一般用来控制子widget是否刷新。
 * GlobleKey() 一般用来获取子widget的state。*/


class WidgetKeyPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WidgetKeyPageState();
  }
}

class _WidgetKeyPageState extends State<WidgetKeyPage> {


  bool _switchValue = false;

  GlobalKey<_TextKeyWidgetState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('WidgetKeyPage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          RaisedButton(
              onPressed: () {


                _globalKey.currentState.changeState();

                print(_globalKey.currentContext.size);

              }
          ),

          Divider(),

          
          TextKeyWidget(key: _globalKey,),

          // 根据品台创建不同分格的widget。
          Switch.adaptive(
              value: _switchValue,
              onChanged:(newValue){
                _switchValue = newValue;
                setState(() {
                });
              }
          )

        ],
      ),
    );
  }
}

class TextKeyWidget extends StatefulWidget {

  TextKeyWidget({Key key}):super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    print('TextKeyWidget---createState');

    return _TextKeyWidgetState();
  }
}

class  _TextKeyWidgetState extends State<TextKeyWidget> {


  void changeState() {
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('TextKeyWidget---initState');


  }

  @override
  Widget build(BuildContext context) {

    print('TextKeyWidget---build:}');

    return Text('TextKeyWidget >>>>>>>');
  }
}


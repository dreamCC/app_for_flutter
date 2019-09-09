
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class KeyboardActionsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _KeyboardActionsPageState();
  }
}

class _KeyboardActionsPageState extends State<KeyboardActionsPage>with WidgetsBindingObserver {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //WidgetsBinding.instance.addObserver(this);
  }


  @override
  void deactivate() {
    print("deactivate");

    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            title: Text("KeyboardActionsPage"),
          ),
          preferredSize: Size.fromHeight(46)
      ),
      body: FormKeyboardActions(
        child: ChirldWidget(),
      ),
    );
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState

    print("000000000---------");


    super.didChangeAppLifecycleState(state);

  }

  @override
  void didChangeMetrics() {
    // TODO: implement didChangeMetrics
    print("didChangeMetrics---------");

    super.didChangeMetrics();
  }

}

class ChirldWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChirldWidgetState();
  }
}

class _ChirldWidgetState extends State<ChirldWidget> {

  GlobalKey<FormState> _formKey;
  FocusNode _loginNode;
  FocusNode _pwdNode;


  @override
  void initState() {

    super.initState();
    _formKey   = GlobalKey();
    _loginNode = FocusNode();
    _pwdNode   = FocusNode();

    FormKeyboardActions.setKeyboardActions(context, KeyboardActionsConfig(
      actions: [
        KeyboardAction(focusNode: _loginNode),
        KeyboardAction(
          focusNode: _pwdNode,
          onTapAction: (){
              print("onTapAction");
          },
          footerBuilder: (context){
            return PreferredSize(
                child: Text("footer"),
                //preferredSize: Size(double.infinity, 46),
                //preferredSize: Size.fromHeight(46)
            );
          }
        )
      ]
    ));
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: EdgeInsets.only(left: 10,top: 20,right: 10),
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                focusNode: _loginNode,
                validator: (value){
                  if(value == null || value.length == 0){
                    return "用户名不能为空";
                  }
                },
                maxLength: 12,
                decoration: InputDecoration(
                  hintText: "请输入用户名"
                ),
              ),
              TextFormField(
                focusNode: _pwdNode,
                validator: (value){
                  if(value == null || value.length == 0){
                    return "密码不能为空";
                  }else if(value.length < 6){
                    return "密码长度不能小于6位";
                  }
                },
                maxLength: 12,
                decoration: InputDecoration(
                  hintText: "请输入密码"
                ),
              ),

              SizedBox(height: 20,),

              SizedBox(
                width: 300,
                height: 46,
                child: RaisedButton(
                    onPressed: (){

                      if(_formKey.currentState.validate()){
                        print("校验通过");
                      }else {
                        print("校验失败");
                      }
                    },
                  child: Text("登录"),
                ),
              ),
            ],
          )
      ),
    );
  }
}


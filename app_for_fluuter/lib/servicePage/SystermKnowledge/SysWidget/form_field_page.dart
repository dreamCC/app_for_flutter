
import 'package:flutter/material.dart';

class FormFieldPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _FormFieldPageState();
  }
}

class _FormFieldPageState extends State<FormFieldPage> {


  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode _nameFocusNode = FocusNode();
  FocusNode _pwdFocusNode  = FocusNode();


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {



//    _nameFocusNode.unfocus();
//    _pwdFocusNode.unfocus();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: GestureDetector(
        onTap: (){
          print("-----");
          _nameFocusNode.unfocus();
          _pwdFocusNode.unfocus();
        },
        child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                focusNode: _nameFocusNode,
                decoration: InputDecoration(
                    hintText: "请输入账号"
                ),
                validator: (value) {
                  if (value == null || value.length == 0) return "请输入用户名";
                },
              ),
              TextFormField(
                focusNode: _pwdFocusNode,
                decoration: InputDecoration( // InputDecoration有很多属性，我们需要知道每个属性的作用。
                    hintText: "请输入密码",
                    border: UnderlineInputBorder()
                ),
                validator: (value) {
                  if (value == null || value.length == 0) return "请输入密码";
                },

              ),

              SizedBox(height: 50,),
              SizedBox(
                width: 300,
                height: 46,
                child: RaisedButton(
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      print("验证不成功");
                      return;
                    }
                    print("验证成功");
                  },
                  child: Text("登录"),
                ),
              )
            ],
          ),
        ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:app_for_fluuter/common/mixin.dart';
import 'package:app_for_fluuter/common/progress_hud.dart';


class TextFieldWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TextFieldWidgetState();

  }
}

class _TextFieldWidgetState extends State<TextFieldWidget> with CanShowProgressHudWidgetMixin {


  TextEditingController _textFieldVc = TextEditingController(text: 'enha');

  FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
      ),
      body: InkWell(
        onTap: (){
          print('点击屏幕');
          _focusNode.unfocus();
        },
        child: Padding(
          padding: EdgeInsets.all(20),
          child: CanShowProgressHudWidget(
              body: Column(
                children: <Widget>[
                  TextField(
                    focusNode: _focusNode,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: 20
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.purple, style: BorderStyle.solid)
                      ),
                      hintText: '请输入姓名',
                      icon: Icon(Icons.add, size: 20,),

                      prefixIcon: Icon(Icons.camera),
                      prefixText: "prefixText ",
                      suffixText: "suffixText ",
                      helperText: "helperText ",
                      counterText: "counterText",
                      errorText: "errorText",
                      labelText: '姓名',

                    ),
                    controller: _textFieldVc,

                    cursorColor: Colors.purple,
                  ),
                  SizedBox(height: 20,),

//                  TextFormField(
//                    focusNode: _focusNode,
//
//                  ),



                ],

              )
          )
        ),
      )
    );
  }
}
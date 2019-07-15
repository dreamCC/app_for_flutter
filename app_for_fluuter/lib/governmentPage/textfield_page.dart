
import 'package:flutter/material.dart';


class TextFieldWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TextFieldWidgetState();

  }
}

class _TextFieldWidgetState extends State<TextFieldWidget> {


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
          child: Column(
            children: <Widget>[
              TextField(
                focusNode: _focusNode,
                autofocus: true,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: 20
                ),
                decoration: InputDecoration(
                  labelText: '姓名',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.purple, style: BorderStyle.solid)
                  ),
                  hintText: '请输入姓名',
                  icon: Icon(Icons.add),

                  prefixIcon: Icon(Icons.camera),

                ),
                controller: _textFieldVc,

                cursorColor: Colors.purple,
              ),
              SizedBox(height: 20,),

              TextFormField(
                focusNode: _focusNode,
              ),




            ],

          ),),
      )
    );
  }
}
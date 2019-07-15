
import 'package:flutter/material.dart';

class RadioWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RadioWidgetState();
  }
}

class _RadioWidgetState extends State<RadioWidget> {

  int _radioValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),

      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[

              Row(
                children: <Widget>[
                  Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: (value){
                        setState(() {
                          print(value);
                          _radioValue = value;
                        });
                      }
                  ),

                  Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: (value){
                        setState(() {
                          print(value);
                          _radioValue = value;
                        });
                      }
                  ),

                  Radio(
                      value: 3,
                      groupValue: _radioValue,
                      onChanged: (value){
                        setState(() {
                          print(value);
                          _radioValue = value;
                        });
                      },
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      activeColor: Colors.purple,
                  ),

                  GestureDetector(
                    child: Text('GestureDetector'),
                    onTap: (){
                      print('点击 GestureDetector-Text');
                    },
                  ),

                  Listener(
                    child: Text('Listener'),
                    onPointerDown: (PointerDownEvent event){
                      print("Listener--onPointerDown");
                    },
                  ),

                  Container(
                    width: 50,
                    height: 50,
                    child:  Checkbox(
                        value: true,
                        onChanged: (value){
                          setState(() {

                          });
                        },
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                    ),
                    color: Colors.purple,
                  )



                ],
              )

            ],
          ),
      ),
    );
  }
}
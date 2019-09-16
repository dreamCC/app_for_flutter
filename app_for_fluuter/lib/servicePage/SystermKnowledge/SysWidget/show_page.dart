
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ShowPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ShowPageState();
  }
}

class _ShowPageState extends State<ShowPage> {


  List<String> _list = ["showBottomSheet","showDatePicker","showTimePicker","showDialog",
  "showCupertinoDialog","showAboutDialog","showGeneralDialog","showBottomSheet","showModalBottomSheet",
  "showLicensePage","showCupertinoModalPopup" ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ShowPage"),
      ),
      body: SafeArea(
          bottom: false,
          child: ListView.separated(
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(_list[index]),
                  onTap: (){

                    if(index == 0) {
                      showBottomSheet(
                          context: context,
                          builder: (context){
                            return FlutterLogo(size: 100,);
                          });

                    }else if(index == 1){
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2018),
                        lastDate: DateTime(2020),
                        initialDatePickerMode: DatePickerMode.day,

                      );

                    }else if(index == 2) {
                      showTimePicker(context: context, initialTime: TimeOfDay.now());

                    }else if(index == 3) {
                      showDialog(context: context, builder: (context){

                        return Center(
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.purple,
                          ),
                        );
                      });

                    }else if(index == 4){
                      showCupertinoDialog(context: context, builder: (context){
                        return Center(
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.purple,
                            child: RaisedButton(onPressed: (){
                              Navigator.of(context).pop();
                            }),
                          ),
                        );
                      });

                    }else if(index == 5){
                      showAboutDialog(context: context,

                      );

                    }else if(index == 6){
                      showGeneralDialog(context: context,
                          barrierDismissible: true,
                          barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                          transitionDuration: Duration(seconds: 1),
                          pageBuilder: (context, animation, secondeAnimation){
                            return Center(
                              child: Container(
                                width: 100,
                                height: 100,
                                color: Colors.purple,
                              ),
                            );
                          });

                    }else if(index == 7) {
                      showBottomSheet(context: context, builder: (context){
                        return Container(
                          width: double.infinity,
                          height: 100,
                          color: Colors.purple,
                          child: Text("hello, Dialog",),
                        );
                      });

                    }else if(index == 8) {
                      showModalBottomSheet(context: context, builder: (context){
                        return Container(
                          width: 100,
                          height: 100,
                          color: Colors.purple,
                          child: Text("hello, Dialog",),
                        );
                      });

                    }else if(index == 9) {
                      showLicensePage(context: context);


                    }else if(index == 10){
                      showCupertinoModalPopup(context: context, builder: (context){
                        return Container(
                          width: 100,
                          height: 100,
                          color: Colors.purple,
                          child: Text("hello, Dialog",),
                        );
                      });
                    }



                  },
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: _list.length
          ),
      )
    );
  }
}

import 'package:flutter/material.dart';

class MixinPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MixinPageState();
  }
}

class _MixinPageState extends State<MixinPage> with MyDemoMixin {


  @override
  Widget build(BuildContext context) {

    print("_MixinPageState---build");

    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("MixinPage"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment(0, 0),
            child: ClipOval(
              child: Image.asset("assets/home/image0.png", width: 100, height: 100, fit: BoxFit.cover,),
            ),
          ),
          Divider(color: Colors.purple, height: 10,thickness: 10,),
          RaisedButton(
            color: Colors.purple,
              onPressed: (){
                C c = C();
                c.name = "hello";
                print(c.name);
              },
          )
        ],
      ),
    );
  }


}

mixin MyDemoMixin<T extends StatefulWidget> on State<T> {


  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    print("MyDemo---build");
    return null;
  }
}


 class C {

  set name(String age){
     print("set name");
   }

   String get name {
    return "enHa";
   }

 }


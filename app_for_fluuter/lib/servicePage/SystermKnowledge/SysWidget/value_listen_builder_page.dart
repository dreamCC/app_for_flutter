
import 'package:flutter/material.dart';

class ValueLisentedBuilderPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ValueLisentedBuilderPageState();
  }
}

class _ValueLisentedBuilderPageState extends State<ValueLisentedBuilderPage> {


  ValueNotifier _value = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    print('build---');

    return Scaffold(
      appBar: AppBar(
        title: Text('ValueLisentedBuilderPage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ValueListenableBuilder(
              valueListenable: _value,
              builder: (context, value, child) {
                return Text('value is $value');
              }
          ),
          Divider(),
          RaisedButton(
              onPressed: () {
                _value.value++;
              }
          ),
        ],

      ),
    );
  }
}
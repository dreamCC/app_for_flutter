
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:app_for_fluuter/model/user.dart';

import 'package:dio/dio.dart';

import 'package:app_for_fluuter/model/data.dart';

import 'package:app_for_fluuter/common/http_tool.dart';

class DioPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DioPage();
  }
}

class _DioPage extends State<DioPage> {



  void _jsonToDic() {

    //
    String json = '{"name": "John Smith","email": "john@example.com"}';

    Map<String, dynamic> jsonMap = jsonDecode(json);


    User user = User.fromJson(jsonMap);
    print(user.name);
    print(user.email);


     final String mockdata = ''' {
  "by" : "dhouston",
  "descendants" : 71,
  "id" : 8863,
  "kids" : [ 8952, 9224, 8917, 8884, 8887, 8943, 8869, 8958, 9005, 9671, 8940, 9067, 8908, 9055, 8865, 8881, 8872, 8873, 8955, 10403, 8903, 8928, 9125, 8998, 8901, 8902, 8907, 8894, 8878, 8870, 8980, 8934, 8876 ],
  "score" : 111,
  "time" : 1175714200,
  "title" : "My YC app: Dropbox - Throw away your USB drive",
  "type" : "story",
  "url" : "http://www.getdropbox.com/u/2/screencast.html"
}''';

    Map<String, dynamic> dataString = jsonDecode(mockdata);

    Data data = Data.fromJson(dataString);

    print(data.url);
    print(data.by);





  }

  
  void _diofetchNetwork() async {


    
    Dio dio = Dio();

    Response re = await dio.get('https://www.baidu.com');



    print(re.data);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DioPage'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            _jsonToDic();
//            _diofetchNetwork();
          },
          child: Text('DartJson'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}

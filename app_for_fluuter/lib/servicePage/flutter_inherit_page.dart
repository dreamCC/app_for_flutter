
import 'package:flutter/material.dart';

class FlutterInheritPage extends Hu {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _FlutterInheritPageState();
  }
}

class _FlutterInheritPageState extends HuState<FlutterInheritPage> {

  @override
  void initState() {
    super.initState();

    this.title = "FlutterInheritPage";
  }
  
  
  @override
  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('header'),
        Divider(),
        RaisedButton(
          onPressed: () {
            showEmptyView();
            Future.delayed(Duration(seconds: 3)).then((value){
              hiddenEmptyView();
            });
          },
          child: Text('showEmptyView'),

        ),
        RaisedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage()));
          },
          child: Text('hiddenEmptyView'),

        ),
        RaisedButton(
          onPressed: () {
            showLoadingEmptyView();
            Future.delayed(Duration(seconds: 3)).then((value){
              hiddenEmptyView();
            });
          },
          child: Text('showEmtyViewLoading'),
        ),
      ],
    );
  }

}


class SecondPage extends Hu {

  @override
  State<StatefulWidget> createState() {
    return _SecondPageState();
  }
}

class _SecondPageState extends HuState<SecondPage> {

  @override
  String get title => 'SecondPage';

  @override
  Widget buildContent(BuildContext context) {
    return Center(
      child: Text('SecondPage'),
    );
  }
}

//---------------------------------------------------------------------------
enum HuEmptyViewState {
  Loading,
  hidden,
  show,
}


// dart 语言中的继承关系，可以使用with，implement， extent来实现。
abstract class Hu extends StatefulWidget {

}


abstract class HuState<T extends Hu> extends State<T> with EmptyState {

  String title = "";
  HuEmptyViewState _emptyViewState = HuEmptyViewState.hidden;


  Widget buildContent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _bodyWidget()
    );
  }


  // ignore: slash_for_doc_comments
  /***************************** empty view start *************************************/
  @override
  void showLoadingEmptyView() {

    setState(() {
      _emptyViewState = HuEmptyViewState.Loading;
    });
  }

  @override
  void showEmptyView() {
    setState(() {
      _emptyViewState = HuEmptyViewState.show;
    });
  }

  @override
  void hiddenEmptyView() {
    setState(() {
      _emptyViewState = HuEmptyViewState.hidden;
    });
  }
  // ignore: slash_for_doc_comments
  /***************************** empty view end *************************************/


  Widget _bodyWidget() {
    switch(_emptyViewState) {
      case HuEmptyViewState.Loading:
        return Center(child: CircularProgressIndicator(),);
      case HuEmptyViewState.show:
        return Container(color: Colors.purple,);
      case HuEmptyViewState.hidden:
        return buildContent(context);
      default:
        break;
    }
  }

}


mixin EmptyState<T extends StatefulWidget> on State<T> {

  void showLoadingEmptyView();
  void showEmptyView();
  void hiddenEmptyView();
}

abstract class ProgressState<T extends StatefulWidget> extends State<T> {

  void showProgressHud();
}



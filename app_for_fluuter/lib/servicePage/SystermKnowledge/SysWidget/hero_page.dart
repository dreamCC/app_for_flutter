
import 'package:flutter/material.dart';
class HeroPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HeroPage"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          onTap: (){

            Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondeAnimation){

                    return HeroAnimatedPage();
                  },
                  transitionsBuilder: (context, animation, secondeAnimation, chirld){
                      return FadeTransition(opacity: animation, child: chirld,);
                  }
                )
            );


          },
          child: Hero(
              tag: "header",
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/image0@2x.png"),
              )
          ),
        ),
      ),
    );
  }
}

class HeroAnimatedPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("HeroAnimatedPage"),
        ),
        body: Center(
          child: Hero(
              tag: "headre",
              child: Image.asset("assets/image0@2x.png")
          ),
        ),
      );
  }
}
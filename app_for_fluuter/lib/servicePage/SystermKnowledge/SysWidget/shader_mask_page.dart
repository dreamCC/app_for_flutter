
import 'package:flutter/material.dart';

class ShaderMaskPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ShaderMaskPage"),
      ),
      body: Center(
        child: ShaderMask(
          shaderCallback: (rect){

            return LinearGradient(
                colors: [
                  Colors.greenAccent,
                  Colors.deepPurpleAccent,
                  Colors.redAccent,
                ]
            ).createShader(rect);
          },
          blendMode: BlendMode.modulate,
          child: Image.asset("assets/image1@2x.png"),
        ),
      ),
    );
  }
}
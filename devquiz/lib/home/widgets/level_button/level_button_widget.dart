import 'package:flutter/material.dart';

class LevelButtonWidget extends StatelessWidget {
  const LevelButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadiusDirectional.circular(28)),
      child: Text("Fácil"),
    );
  }
}

import 'package:flutter/material.dart';
import 'txtstyle.dart';
class buttonicondata extends StatelessWidget {
  buttonicondata({required this.iconshape,required this.icontext});
  final IconData iconshape;
  final String icontext;
  @override
  Widget build(BuildContext context) {
    return Column
      (
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Icon
          (
          iconshape,
          size: 50.0,
        ),
        SizedBox
          (
            height: 10
        ),
        Text(icontext,style: txtstyle),
      ],
    );
  }
}
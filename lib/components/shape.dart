import 'package:flutter/material.dart';
class shapes extends StatelessWidget
{
  shapes({required this.colour, this.buttonswidget});
  final Color colour;
  final Widget? buttonswidget;
  @override
  Widget build(BuildContext context) {
    return Container
      (
      child: buttonswidget,
      margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
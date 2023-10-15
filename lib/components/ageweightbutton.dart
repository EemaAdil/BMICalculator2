import 'package:flutter/material.dart';
class AgeWeightBtn extends StatelessWidget
{
  AgeWeightBtn({required this.ageweighticon,required this.ageweightonpress});
  final IconData ageweighticon;
  final void Function() ageweightonpress;
  @override
  Widget build(BuildContext context)
  {
    return RawMaterialButton
      (
      constraints: BoxConstraints.tightFor
        (
        width: 50.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.orange,
      onPressed: ageweightonpress,
      child: Icon(ageweighticon,color: Colors.white,),
    );
  }
}

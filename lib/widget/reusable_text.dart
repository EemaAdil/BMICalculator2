





import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableText extends StatelessWidget {
  String? text;
  double fontSize;
  FontWeight? fontWeight;
  ReusableText({
    this.fontSize=16,
   this.text,
    this.fontWeight
});

  @override
  Widget build(BuildContext context) {
    return Text(
        text!,
        style: GoogleFonts.robotoSlab(
        textStyle: Theme.of(context).textTheme.bodySmall,
    fontSize: fontSize,
    color: Colors.black,
    fontWeight: fontWeight,
    letterSpacing: 0.5,
    )
    );
  }
}

import 'package:bmicalculator/components/txtstyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class calculate_button extends StatelessWidget {
  calculate_button({
    required this.buttontext,
    required this.onpresstap,
    required this.leading,
    required this.trading,
  });
  final void Function() onpresstap;
  final String buttontext;
  final IconData leading;
  final IconData trading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpresstap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2,
          child: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(leading, color: Colors.black, size: 28),
                    Text(
                      buttontext,
                      style: GoogleFonts.robotoSlab(
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                        fontSize: 18,
                        color: Colors.grey,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Icon(trading, color: Colors.black, size: 18),
                  ],
                ),
              ),
            ),
            height: calcbuttonheight,
            width: double.infinity,
            decoration: BoxDecoration(
              color: calbuttoncolor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}

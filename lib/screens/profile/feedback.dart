import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeae9ee),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "FeedBack",
          style: GoogleFonts.robotoSlab(
            textStyle: Theme.of(context).textTheme.displaySmall,
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: "Text Here...",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFFA446A4),
            ),
            child: TextButton(
              onPressed: () {
                Get.back();
                Get.snackbar(
                  "sent",
                  "your feedback is sent to admin",
                  colorText: Colors.green,
                );
              },
              child: Text(
                "SEND",
                style: GoogleFonts.robotoSlab(
                  textStyle: Theme.of(context).textTheme.displaySmall,
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }





}

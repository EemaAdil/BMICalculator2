
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../tipslooseweek.dart';
import '../tipsweek.dart';
import 'feedback.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeae9ee),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Me",
          style: GoogleFonts.robotoSlab(
            textStyle: Theme.of(context).textTheme.displaySmall,
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              height: Get.height * 0.6,
              width: Get.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    onTap: () {
                      Get.to(WeekTips());

                    },
                    leading: Image.asset(
                      "assets/gain.png",
                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                    title: Text("Weight Gain Tips"),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Get.to(WeeklooseTips());

                    },
                    leading: Image.asset(
                      "assets/lose_weight.png",
                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                    title: Text("Weight Loss Tips"),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      buildBottomSheetForInfo();
                    },
                    leading: Icon(Icons.star_border),
                    title: Text("Rate us"),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FeedBackScreen(),
                        ),
                      );
                    },
                    leading: Icon(Icons.note_alt_outlined),
                    title: Text("Feedback"),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () async {
                      final Uri url = Uri.parse(
                        'https://mitpark.blogspot.com/2022/07/mitpark-apps-privacy-policy.html',
                      );
                      if (!await launchUrl(url)) {
                        throw Exception(url);
                      }
                    },
                    leading: Icon(Icons.policy_outlined),
                    title: Text("Privacy Policy"),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 10),
                    child: Text("Try Other Apps",style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  ListTile(
                    onTap: () async {
                      final Uri url = Uri.parse(
                        'https://play.google.com/store/apps/dev?id=8464179366364433166',
                      );
                      if (!await launchUrl(url,mode: LaunchMode.externalApplication)) {
                        throw Exception(url);
                      }
                    },
                    leading: Image.asset(
                      "assets/tv_app_icon.png",
                      height: 27,
                      width: 27,
                      fit: BoxFit.contain,
                    ),
                    title: Text("Tv Remote Master"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Version 1.0.11",
              style: GoogleFonts.robotoSlab(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /////////////////////////////////////////
  buildBottomSheetForInfo() {
    double rating = 3.0;
    return Get.bottomSheet(
      Container(
        height: Get.height * 0.29,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Rate us",
              style: GoogleFonts.robotoSlab(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 10),
            RatingBar.builder(
              initialRating: rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rated) {
                setState(() {
                  rating = rated;
                });
                print(rating);
              },
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: Get.width * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.green,
              ),
              child: TextButton(
                onPressed: () async {
                  // Get.back();
                  Get.snackbar(
                    "Thanks!",
                    "You have rated $rating Thanks!",
                    colorText: Colors.green,
                  );

                  final Uri url = Uri.parse(
                    'https://play.google.com/store/apps/details?id=com.mitPark.bmicalculator',
                  );
                  if (!await launchUrl(url)) {
                    throw Exception(url);
                  }
                },
                child: Text(
                  "Submit",
                  style: GoogleFonts.robotoSlab(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      // properites
      isDismissible: true,
      isScrollControlled: true,
    );
  }
}

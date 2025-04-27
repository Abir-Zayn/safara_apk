import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:safara_apk/common/ImageStr/appvectors.dart';
import 'package:safara_apk/common/widgets/appbtn.dart';
import 'package:safara_apk/common/widgets/appstyle.dart';
import 'package:safara_apk/common/widgets/apptext.dart';

class Splashscreentwo extends StatefulWidget {
  const Splashscreentwo({super.key});

  @override
  State<Splashscreentwo> createState() => _SplashscreentwoState();
}

class _SplashscreentwoState extends State<Splashscreentwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Round Shape at top
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Shape
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 450.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.yellow.shade700,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0), // Cut-out radius
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(
                        MediaQuery.of(context).size.width * 0.9),
                  ),
                ),
              ),
              //image
              Positioned(
                top: 80, // Adjust depending on look you want
                left: 20,
                right: 20,
                child: Image.asset(
                  Appvectors.splashLogo,
                  width: 250.w,
                  height: 300.h,
                ),
              ),

              Positioned(
                top: 400, // Adjust depending on look you want
                left: 20,
                right: 20,
                child: AppTextstyle(
                    text:
                        "Whether you're a fequent traveler or planning a once-in-a-lifetime vacation, our app has everything you need to make the most of your trip.",
                    style: appStyle(
                      size: 17.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 4),
              ),
            ],
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          //button

          Appbtn(
            text: 'Get Started',
            height: 50.h,
            width: MediaQuery.of(context).size.width * 0.8,
            color: Colors.yellow.shade700,
            radius: 10.r,
            textColor: Colors.black,
            onPressed: () {
              context.go('/register');
            },
          )
        ],
      ),
    );
  }
}

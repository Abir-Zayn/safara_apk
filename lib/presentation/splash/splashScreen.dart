import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safara_apk/common/ImageStr/appvectors.dart';
import 'package:safara_apk/common/widgets/appstyle.dart';
import 'package:safara_apk/common/widgets/apptext.dart';
import 'package:safara_apk/presentation/splash/splashScreentwo.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _swipeAnimationController;
  late Animation<Offset> _swipeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _swipeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _swipeAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.3, 0),
    ).animate(CurvedAnimation(
      parent: _swipeAnimationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _swipeAnimationController.dispose();
    super.dispose();
  }

  void _navigateToNextScreen() {
    Navigator.of(context).push(
      SwipeablePageRoute(
        canOnlySwipeFromEdge: false,
        canSwipe: true,
        builder: (BuildContext context) => const Splashscreentwo(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Make the entire screen swipeable
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          // If user swipes from right to left with enough velocity
          if (details.primaryVelocity != null &&
              details.primaryVelocity! < -300) {
            _navigateToNextScreen();
          }
        },
        child: Container(
          color: Colors.transparent, // Needed for gesture detector to work
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Appvectors.appLogo,
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 20),

                AnimatedTextKit(
                  repeatForever: false,
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText(
                      'TRAVEL BOOK & HIRE',
                      textStyle: appStyle(
                        size: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black45,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                ),

                SizedBox(height: 30.h),

                AnimatedTextKit(
                  repeatForever: false,
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText(
                      'EXPLORE',
                      textStyle: appStyle(
                        size: 25.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.yellow.shade700,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                AppTextstyle(
                  text: 'THE UNSEEN',
                  style: appStyle(
                    size: 25.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),

                // Enhanced swipe indicator
                SlideTransition(
                  position: _swipeAnimation,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppTextstyle(
                          text: 'Swipe to continue',
                          style: appStyle(
                            size: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black45,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward,
                          size: 22.sp,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

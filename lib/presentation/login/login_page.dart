import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:safara_apk/common/ImageStr/appvectors.dart';
import 'package:safara_apk/common/widgets/appbtn.dart';
import 'package:safara_apk/common/widgets/appstyle.dart';
import 'package:safara_apk/common/widgets/apptext.dart';
import 'package:safara_apk/common/widgets/apptextfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 50.h,
              left: 20.w,
              right: 20.w),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  Appvectors.appLogo,
                  height: 160.h,
                  width: 140.w,
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: AppTextstyle(
                  text: "Email",
                  style: appStyle(
                      size: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              //Sign in - Email Textfield
              Apptextfield(
                style: appStyle(
                    size: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
                controller: emailController,
                borderRadius: 10.r,
                hintText: "Enter your email",
                hintStyle: appStyle(
                    size: 17.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w200),
                height: 100.h,
                width: double.infinity,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              //Sign in - Password Textfield
              Align(
                alignment: Alignment.centerLeft,
                child: AppTextstyle(
                  text: "Password",
                  style: appStyle(
                      size: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Apptextfield(
                style: appStyle(
                    size: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
                controller: passwordController,
                borderRadius: 10.r,
                hintText: "Password",
                hintStyle: appStyle(
                    size: 17.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w200),
                height: 100.h,
                width: double.infinity,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onChanged: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),

              //Remember me - Checkbox + Forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {
                          setState(() {
                            // Handle checkbox state change
                          });
                        },
                        activeColor: Colors.yellow.shade700,
                      ),
                      AppTextstyle(
                        text: "Remember me",
                        style: appStyle(
                            size: 15.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: AppTextstyle(
                      text: "Forgot password?",
                      style: appStyle(
                          size: 16.sp,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),

              Appbtn(
                  text: "Log In",
                  color: Colors.yellow.shade700,
                  textColor: Colors.black,
                  fontSize: 20.sp,
                  height: 70.h,
                  radius: 10.r,
                  onPressed: () async {
                    context.go('/entry');
                  }),
              SizedBox(
                height: 20.h,
              ),

              Appbtn(
                  text: "Sign Up",
                  color: Colors.white,
                  textColor: Colors.black,
                  fontSize: 20.sp,
                  height: 70.h,
                  radius: 10.r,
                  onPressed: () async {
                    context.go('/register');
                  }),

              //or connecting with social media
              SizedBox(
                height: 25.h,
              ),
              AppTextstyle(
                text: "Or connect with",
                style: appStyle(
                    size: 17.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10.h,
              ),

              //Row of social media buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: Image.asset(Appvectors.googleLogo),
                      onPressed: () async {},
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    height: 70.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: Image.asset(Appvectors.facebookLogo),
                      onPressed: () async {},
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    height: 70.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: Image.asset(Appvectors.appleLogo),
                      onPressed: () async {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

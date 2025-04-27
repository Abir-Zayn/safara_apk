import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:safara_apk/common/ImageStr/appvectors.dart';
import 'package:safara_apk/common/widgets/appbtn.dart';
import 'package:safara_apk/common/widgets/appstyle.dart';
import 'package:safara_apk/common/widgets/apptext.dart';
import 'package:safara_apk/common/widgets/apptextfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 25.h,
              left: 20.w,
              right: 20.w),
          child: Column(children: [
            Center(
              child: Image.asset(
                Appvectors.appLogo,
                height: 140.h,
                width: 140.w,
              ),
            ),
            AppTextstyle(
              text: "Sign Up",
              style: appStyle(
                  size: 25.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20.h,
            ),
            AppTextstyle(
              text: "Create an account to continue",
              style: appStyle(
                  size: 17.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 50.h,
            ),

            // Name TextField
            Apptextfield(
              style: appStyle(
                  size: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
              labelText: "Name",
              controller: nameController,
              borderRadius: 20.r,
              hintText: "Enter your name",
              hintStyle: appStyle(
                  size: 17.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w200),
              height: 100.h,
              width: double.infinity,
              keyboardType: TextInputType.name,
              onChanged: (value) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            // Email TextField
            Apptextfield(
              style: appStyle(
                  size: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
              controller: emailController,
              labelText: "Email",
              borderRadius: 20.r,
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
            // Password TextField
            Apptextfield(
              style: appStyle(
                  size: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
              controller: passwordController,
              labelText: "Password",
              borderRadius: 20.r,
              hintText: "Create password",
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
                  return 'Please enter a password';
                }
                return null;
              },
            ),

            // Row
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Radio button
                Radio(
                  value: true,
                  groupValue: true,
                  onChanged: (value) {},
                  activeColor: Colors.yellow.shade700,
                ),
                AppTextstyle(
                  text: "By signing up, you agree to our terms.",
                  style: appStyle(
                      size: 17.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),

            // Sign Up Button
            SizedBox(
              height: 20.h,
            ),
            Appbtn(
                text: "Sign Up",
                fontSize: 20.sp,
                radius: 20.r,
                height: 70.h,
                width: MediaQuery.of(context).size.width * 0.9,
                textColor: Colors.black,
                color: Colors.yellow.shade700,
                onPressed: () {
                  context.go('/entry');
                }),

            SizedBox(
              height: 20.h,
            ),
            // Already have an account? Sign In
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextstyle(
                  text: "Already have an account?",
                  style: appStyle(
                      size: 17.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to the login page
                    context.go('/login');
                  },
                  child: AppTextstyle(
                    text: "Sign In",
                    style: appStyle(
                        size: 17.sp,
                        color: Colors.yellow.shade700,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

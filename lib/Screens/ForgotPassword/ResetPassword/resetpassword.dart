import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universal_b2b/Screens/ForgotPassword/ResetPassword/resetpasswordcontroller.dart';
import 'package:universal_b2b/Widget/submitbutton.dart';
import 'package:universal_b2b/Widget/successfulscreen.dart';

import '../../../Const/approute.dart';
import '../../../Const/assets.dart';
import '../../../Const/color.dart';
import '../../../Const/font.dart';
import '../../../Const/text.dart';
import '../../../Widget/textformfield.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late ResetPasswordController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(ResetPasswordController());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.resetPasswordKey,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: MyColors.white24,
          elevation: 0,
          iconTheme: IconThemeData(color: MyColors.primaryCustom),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  Assets.resetPassword,
                  scale: 3,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                MyText.resetPassword,
                style: TextStyle(
                  fontFamily: MyFont.myFont,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: MyColors.primaryCustom,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                MyText.resetPasswordText,
                style: TextStyle(
                  fontFamily: MyFont.myFont,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.passwordController,
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                maxLength: 100,
                hintText: 'Enter Password',
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                obscureText: controller.isPassword.value ? true : false,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      controller.isPassword.value =
                          !controller.isPassword.value;
                    });
                  },
                  icon: controller.isPassword.value
                      ? Image.asset(Assets.invisibleIcon, color: Colors.black)
                      : const Icon(Icons.visibility_outlined,
                          color: Colors.black),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter the valid Password";
                  } else if (value.length < 6) {
                    return "Password should be minimum 5 long";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.confirmPasswordController,
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                maxLength: 100,
                hintText: 'Enter Password',
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                obscureText: controller.isConfirmPassword.value ? true : false,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      controller.isConfirmPassword.value =
                          !controller.isConfirmPassword.value;
                    });
                  },
                  icon: controller.isConfirmPassword.value
                      ? Image.asset(Assets.invisibleIcon, color: Colors.black)
                      : const Icon(Icons.visibility_outlined,
                          color: Colors.black),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter the valid Password";
                  } else if (value.length < 6) {
                    return "Password should be minimum 5 long";
                  } else {
                    return null;
                  }
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                child: SubmitButton(
                  isLoading: false,
                  onTap: () {
                    if (controller.resetPasswordKey.currentState!.validate()) {
                      if (controller.passwordController.text !=
                          controller.confirmPasswordController.text) {
                        return Get.snackbar("Attention",
                            "Your Password and Confirm Password doesn't match",
                            backgroundColor: MyColors.primaryCustom,
                            colorText: MyColors.white);
                      }
                      Get.to(() => SuccessfulScreen(
                          text: "Password Changed \nSuccessfully..! ",
                          onTap: () {
                            Get.offAllNamed(Routes.loginScreen);
                          },
                          buttonText: "Go To Login"));
                    }
                  },
                  title: "Confirm",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universal_b2b/Const/color.dart';
import 'package:universal_b2b/Const/font.dart';
import 'package:universal_b2b/Widget/submitbutton.dart';

import '../../Const/approute.dart';
import '../../Const/assets.dart';
import '../../Const/text.dart';
import '../../Widget/textformfield.dart';
import 'logincontroller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(LoginController());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Form(
        key: controller.loginKey,
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(18.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      Assets.login,
                      scale: 3,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    MyText.login,
                    style: TextStyle(
                      fontFamily: MyFont.myFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: MyColors.primaryCustom,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: controller.usernameController,
                    textStyle: TextStyle(fontFamily: MyFont.myFont),
                    inputFormatters: [],
                    maxLength: 100,
                    hintText: 'Username or Email',
                    hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                    prefixIcon: const Icon(Icons.person),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter the valid username";
                      } else if (value.length < 3) {
                        return "Please enter minimum 3 character long";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: controller.passwordController,
                    textStyle: TextStyle(fontFamily: MyFont.myFont),
                    inputFormatters: [],
                    maxLength: 100,
                    hintText: 'Password',
                    hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                    obscureText:
                        controller.isPasswordVisibility.value ? true : false,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          controller.isPasswordVisibility.value =
                              !controller.isPasswordVisibility.value;
                        });
                      },
                      icon: controller.isPasswordVisibility.value
                          ? Image.asset(Assets.invisibleIcon,
                              color: Colors.black)
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
                  Row(
                    children: [
                      SizedBox(
                        height: 15,
                        width: 15,
                        child: Checkbox(
                          value: controller.isChecked.value,
                          onChanged: (bool? value) {
                            setState(() {
                              controller.isChecked.value = value!;
                            });
                          },
                          checkColor: MyColors.primaryCustom,
                          activeColor: MyColors.white24,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        "Remember Me",
                        style: TextStyle(
                          fontFamily: MyFont.myFont,
                          fontWeight: FontWeight.bold,
                          color: MyColors.primaryCustom,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.forgotPasswordScreen);
                    },
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontFamily: MyFont.myFont,
                        fontWeight: FontWeight.bold,
                        color: MyColors.primaryCustom,
                      ),
                    ),
                  ),
                  // Align(
                  //     child: InkWell(
                  //   child: Image.asset(Assets.fingerprint),
                  // )),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: SizedBox(
                    width: 150,
                    child: SubmitButton(
                      isLoading: false,
                      onTap: () {
                        if (controller.loginKey.currentState!.validate()) {
                          Get.toNamed(Routes.bottomNavBar);
                        }
                      },
                      title: "Login",
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Don't have an account",
                      style: TextStyle(
                        fontFamily: MyFont.myFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                        width: 100,
                        height: 30,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.mainTheme,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          onPressed: () {
                            Get.toNamed(Routes.registrationScreen);
                          },
                          child: Text(
                            "Signup",
                            style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

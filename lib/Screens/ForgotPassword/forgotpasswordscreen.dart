import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Const/approute.dart';
import '../../Const/assets.dart';
import '../../Const/color.dart';
import '../../Const/font.dart';
import '../../Const/text.dart';
import '../../Helper/extension.dart';
import '../../Widget/submitbutton.dart';
import '../../Widget/textformfield.dart';
import 'forgotpasswordcontroller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late ForgotPasswordController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(ForgotPasswordController());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.forgotPasswordKey,
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
              Center(child: Image.asset(Assets.forgotPassword)),
              const SizedBox(height: 20),
              Text(
                MyText.forgotPassword,
                style: TextStyle(
                  fontFamily: MyFont.myFont,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: MyColors.primaryCustom,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                MyText.forgotPasswordText,
                style: TextStyle(
                  fontFamily: MyFont.myFont,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.forgotPasswordEmailController,
                hintText: "Email ID",
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                maxLength: 100,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Your Email ID.";
                  } else if (!validateEmail(value)) {
                    return "Invalid Email ID";
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
                        String email =
                            controller.forgotPasswordEmailController.text;
                        if (controller.forgotPasswordKey.currentState!
                            .validate()) {
                          Get.toNamed(Routes.oTPScreen, arguments: false);
                        }
                      },
                      title: "Next")),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';
import 'package:universal_b2b/Widget/submitbutton.dart';

import '../../Const/approute.dart';
import '../../Const/assets.dart';
import '../../Const/color.dart';
import '../../Const/font.dart';
import '../../Const/text.dart';
import 'forgotpasswordcontroller.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool isScreenNav = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isScreenNav = Get.arguments as bool;
    print(":::::::::::::");
    print(isScreenNav.toString());
    print(":::::::::::::");
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontFamily: MyFont.myFont,
        fontSize: 20,
        color: MyColors.primaryCustom,
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: MyColors.grey,
      borderRadius: BorderRadius.circular(10.0),
    ),
  );

  final focusedPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontFamily: MyFont.myFont,
        fontSize: 20,
        color: MyColors.primaryCustom,
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
        border: Border.all(
          color: MyColors.primaryCustom,
        ),
        borderRadius: BorderRadius.circular(20.0)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(Assets.forgotPassword)),
            const SizedBox(height: 20),
            Text(
              MyText.otpVerification,
              style: TextStyle(
                fontFamily: MyFont.myFont,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: MyColors.primaryCustom,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "An authentication code has been send to",
              style: TextStyle(
                fontFamily: MyFont.myFont,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "",
              style: TextStyle(
                fontFamily: MyFont.myFont,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                width: 150,
                child: SubmitButton(
                    isLoading: false,
                    onTap: () {
                      if (isScreenNav == true) {
                        Get.back();
                      } else {
                        Get.toNamed(Routes.resetPassword);
                      }
                    },
                    title: "Verify")),
            SizedBox(
                width: 150,
                child: SubmitButton(
                    isLoading: false, onTap: () {}, title: "Resend")),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_b2b/Const/color.dart';
import 'package:universal_b2b/Helper/extension.dart';
import 'package:universal_b2b/Widget/submitbutton.dart';

import '../../../Const/approute.dart';
import '../../../Const/assets.dart';
import '../../../Const/font.dart';
import '../../../Const/text.dart';
import '../../../Widget/textformfield.dart';
import 'contactinformationcontroller.dart';

class ContactInformationScreen extends StatefulWidget {
  const ContactInformationScreen({super.key});

  @override
  State<ContactInformationScreen> createState() =>
      _ContactInformationScreenState();
}

class _ContactInformationScreenState extends State<ContactInformationScreen> {
  late ContactInformationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(ContactInformationController());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.contactKey,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
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
                    Assets.contactInformation,
                    scale: 3,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  MyText.contactInformation,
                  style: TextStyle(
                    fontFamily: MyFont.myFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: MyColors.primaryCustom,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  MyText.contactInformationText,
                  style: TextStyle(
                    fontFamily: MyFont.myFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: controller.contactNameController,
                  textStyle: TextStyle(fontFamily: MyFont.myFont),
                  inputFormatters: [],
                  maxLength: 100,
                  hintText: 'Name',
                  hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter the Name";
                    } else if (value.length < 3) {
                      return "Please enter minimum 3 character long";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: controller.contactMobileNumberController,
                  textStyle: TextStyle(fontFamily: MyFont.myFont),
                  inputFormatters: [NumericInputFormatter()],
                  keyboardType: TextInputType.number,
                  maxLength: 100,
                  hintText: 'Mobile No',
                  hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Your Mobile No";
                    } else if (!isPhoneNumberValid(value)) {
                      return "Invalid Mobile No";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: controller.contactEmailController,
                  textStyle: TextStyle(fontFamily: MyFont.myFont),
                  inputFormatters: [],
                  maxLength: 100,
                  hintText: 'Email ID',
                  hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
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
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: controller.websiteController,
                  textStyle: TextStyle(fontFamily: MyFont.myFont),
                  inputFormatters: [],
                  maxLength: 100,
                  hintText: 'Website',
                  hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Enter Your Website";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: controller.facebookController,
                  textStyle: TextStyle(fontFamily: MyFont.myFont),
                  inputFormatters: [],
                  maxLength: 100,
                  hintText: 'Facebook',
                  hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Enter Your Facebook";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: controller.instagramController,
                  textStyle: TextStyle(fontFamily: MyFont.myFont),
                  inputFormatters: [],
                  maxLength: 100,
                  hintText: 'Instagram',
                  hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Enter Your Instagram";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: controller.linkedinController,
                  textStyle: TextStyle(fontFamily: MyFont.myFont),
                  inputFormatters: [],
                  maxLength: 100,
                  hintText: 'LinkedIn',
                  hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Enter Your LinkedIn";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: controller.youTubeController,
                  textStyle: TextStyle(fontFamily: MyFont.myFont),
                  inputFormatters: [],
                  maxLength: 100,
                  hintText: 'YouTube',
                  hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Enter Your YouTube";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),
                const SizedBox(height: 40),
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
                          if (controller.contactKey.currentState!.validate()) {
                            Get.toNamed(Routes.profileDetailScreen);
                          }
                        },
                        title: "Next")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

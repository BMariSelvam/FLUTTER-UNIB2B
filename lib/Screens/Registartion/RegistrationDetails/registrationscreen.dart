import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_b2b/Const/size.dart';
import 'package:universal_b2b/Helper/extension.dart';
import 'package:universal_b2b/Screens/Registartion/RegistrationDetails/registrationcontroller.dart';
import 'package:universal_b2b/Widget/submitbutton.dart';

import '../../../Const/approute.dart';
import '../../../Const/assets.dart';
import '../../../Const/color.dart';
import '../../../Const/font.dart';
import '../../../Const/text.dart';
import '../../../Widget/textformfield.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late RegistrationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(RegistrationController());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.regKey,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    child: Image.asset(
                      Assets.registration,
                      scale: 3,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    MyText.registration,
                    style: TextStyle(
                      fontFamily: MyFont.myFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: MyColors.primaryCustom,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    MyText.regText,
                    style: TextStyle(
                      fontFamily: MyFont.myFont,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: controller.companyNameController,
                    textStyle: TextStyle(fontFamily: MyFont.myFont),
                    inputFormatters: [],
                    maxLength: 100,
                    hintText: 'Company Name',
                    hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter the valid CompanyName";
                      } else if (value.length < 3) {
                        return "Please enter minimum 3 character long";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: controller.regNumberController,
                    textStyle: TextStyle(fontFamily: MyFont.myFont),
                    inputFormatters: [NumericInputFormatter()],
                    keyboardType: TextInputType.number,
                    maxLength: 100,
                    hintText: 'Registration Number',
                    hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter the valid Registration Number";
                      } else if (value.length < 3) {
                        return "Please enter minimum 3 character long";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(fontFamily: MyFont.myFont),
                    inputFormatters: [],
                    decoration: InputDecoration(
                        hintText: 'Email ID',
                        hintStyle: TextStyle(fontFamily: MyFont.myFont),
                        counterText: "",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
                          child: SizedBox(
                            height: 5,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))),
                                onPressed: () {
                                  String email =
                                      controller.emailController.text;
                                  Get.toNamed(Routes.oTPScreen,
                                      arguments: true);
                                },
                                child: Text(
                                  "Validate",
                                  style: TextStyle(
                                    fontFamily: MyFont.myFont,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                        ),
                        filled: true,
                        fillColor: MyColors.lightGray,
                        contentPadding: const EdgeInsets.all(10.0),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: MyColors.primaryCustom)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        )),
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
                    controller: controller.countryController,
                    textStyle: TextStyle(fontFamily: MyFont.myFont),
                    inputFormatters: [AlphabeticInputFormatter()],
                    maxLength: 100,
                    hintText: 'Country',
                    hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter the valid Country";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: controller.addressLine1Controller,
                    textStyle: TextStyle(fontFamily: MyFont.myFont),
                    inputFormatters: [],
                    maxLength: 100,
                    hintText: 'Address Line 1',
                    hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter the valid Address";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: controller.addressLine2Controller,
                    textStyle: TextStyle(fontFamily: MyFont.myFont),
                    inputFormatters: [],
                    maxLength: 100,
                    hintText: 'Address Line 2',
                    hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter the valid Address";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width(context) / 2.5,
                        child: CustomTextFormField(
                          controller: controller.floorNoController,
                          textStyle: TextStyle(fontFamily: MyFont.myFont),
                          inputFormatters: [NumericInputFormatter()],
                          maxLength: 100,
                          hintText: 'Floor No.',
                          hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter the valid Floor No.";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: width(context) / 2.5,
                        child: CustomTextFormField(
                          controller: controller.unitNoController,
                          textStyle: TextStyle(fontFamily: MyFont.myFont),
                          inputFormatters: [NumericInputFormatter()],
                          maxLength: 100,
                          hintText: 'Unit No.',
                          hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter the Unit No.";
                            } else {
                              return null;
                            }
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: controller.postalCodeController,
                    textStyle: TextStyle(fontFamily: MyFont.myFont),
                    inputFormatters: [NumericInputFormatter()],
                    keyboardType: TextInputType.number,
                    maxLength: 100,
                    hintText: 'Postal Code',
                    hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter the valid Address";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: SizedBox(
                      width: 150,
                      child: SubmitButton(
                          isLoading: false,
                          onTap: () {
                            if (controller.regKey.currentState!.validate()) {
                              Get.toNamed(Routes.contactInformationScreen);
                            }
                          },
                          title: "Next")),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Already have an account?",
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
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          onPressed: () {
                            Get.toNamed(Routes.loginScreen);
                          },
                          child: Text(
                            "SignIn",
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

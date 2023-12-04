import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universal_b2b/Screens/Registartion/Profile/profilecontroller.dart';

import '../../../Const/approute.dart';
import '../../../Const/assets.dart';
import '../../../Const/color.dart';
import '../../../Const/font.dart';
import '../../../Const/text.dart';
import '../../../Widget/submitbutton.dart';
import '../../../Widget/successfulscreen.dart';
import '../../../Widget/textformfield.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({super.key});

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  late ProfileDetailController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(ProfileDetailController());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.profileKey,
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
                    Assets.profileDetail,
                    scale: 4,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  MyText.profile,
                  style: TextStyle(
                    fontFamily: MyFont.myFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: MyColors.primaryCustom,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  MyText.profileText,
                  style: TextStyle(
                    fontFamily: MyFont.myFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: TextEditingController(text: controller.fileName),
                  style: TextStyle(fontFamily: MyFont.myFont),
                  inputFormatters: [],
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: 'Attach Company Profile',
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
                                print("*******FILE PICKER*********");
                                pickImage();
                              },
                              child: Text(
                                "Attach File",
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
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Select your file";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: controller.aboutCompanyController,
                  hintText: "Enter a few lines about your company",
                  textStyle: TextStyle(fontFamily: MyFont.myFont),
                  inputFormatters: [],
                  maxLine: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Few lines about your company";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: controller.businessCategoryController,
                  hintText: "Business Category",
                  textStyle: TextStyle(fontFamily: MyFont.myFont),
                  inputFormatters: [],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your business category";
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
                          if (controller.profileKey.currentState!.validate()) {
                            Get.to(() => SuccessfulScreen(
                                  text: 'Registered Successfully..!',
                                  onTap: () {
                                    Get.offAllNamed(Routes.loginScreen);
                                  },
                                  buttonText: 'Go To Login',
                                ));
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

  void pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any, // Specify that we only allow image files.
        allowMultiple: false,
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        setState(() {
          controller.fileName = file.name;
        });
      } else {
        // User canceled the picker
      }
    } catch (e) {
      // Handle any exceptions that may occur during file picking.
      print('Error picking image: $e');
    }
  }
}

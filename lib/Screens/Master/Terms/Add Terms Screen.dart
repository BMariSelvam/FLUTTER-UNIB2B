import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universal_b2b/Screens/Master/Terms/Add%20Terms%20Screen%20Controller.dart';

import '../../../Const/color.dart';
import '../../../Const/font.dart';
import '../../../Const/size.dart';
import '../../../Widget/submitbutton.dart';
import '../../../Widget/successfulscreen.dart';
import '../../../Widget/textformfield.dart';
import '../../../Widget/togglebutton.dart';

class AddTermsScreen extends StatefulWidget {
  const AddTermsScreen({Key? key}) : super(key: key);

  @override
  State<AddTermsScreen> createState() => _AddTermsScreenState();
}

class _AddTermsScreenState extends State<AddTermsScreen> {
  late AddTermsController controller;
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    controller=Get.put(AddTermsController());
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              }, icon: const Icon(Icons.arrow_back_ios_new)),
          title: Text(
            "Add Terms",
            style: TextStyle(fontFamily: MyFont.myFont),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                controller: controller.codeController,
                hintText: "Code",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.nameController,
                hintText: "NAME",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.dayController,
                hintText: "No.Days",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "HAVE STOCK",
                    style: TextStyle(
                      fontFamily: MyFont.myFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: MyColors.darkGrey,
                    ),
                  ),
                  const SizedBox(width: 20),
                  ToggleButton(
                    onTap: (bool isStockToggle) {
                      setState(() {
                        controller.isAlertToggle.value =
                        !controller.isAlertToggle.value;
                      });
                    },
                  )
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: width(context) / 2.5,
                  child: SubmitButton(
                      isLoading: false, onTap: () {}, title: "Cancel")),
              SizedBox(
                width: width(context) / 2.5,
                child: SubmitButton(
                    isLoading: false,
                    onTap: () {
                      Get.to(() => SuccessfulScreen(
                          text: "Terms Added Successfully",
                          onTap: () {},
                          buttonText: "Go To Dashboard"));
                    },
                    title: "Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

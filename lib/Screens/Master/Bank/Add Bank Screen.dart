import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universal_b2b/Screens/Master/Bank/Add%20Bank%20Screen%20Controller.dart';

import '../../../Const/font.dart';
import '../../../Const/size.dart';
import '../../../Widget/submitbutton.dart';
import '../../../Widget/successfulscreen.dart';
import '../../../Widget/textformfield.dart';

class AddBankScreen extends StatefulWidget {
  const AddBankScreen({Key? key}) : super(key: key);

  @override
  State<AddBankScreen> createState() => _AddBankScreenState();
}

class _AddBankScreenState extends State<AddBankScreen> {
  late AddBankController controller;
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    controller=Get.put(AddBankController());
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
            "Add Bank",
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
                          text: "Bank Added Successfully",
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

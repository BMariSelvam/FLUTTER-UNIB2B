import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universal_b2b/Const/color.dart';
import 'package:universal_b2b/Widget/successfulscreen.dart';
import 'package:universal_b2b/Widget/textformfield.dart';

import '../Const/approute.dart';
import '../Const/font.dart';
import '../Screens/Master/Company/Company Screen Controller.dart';
class DesignerRequestPopup extends StatefulWidget {
  @override
  _DesignerRequestPopupState createState() => _DesignerRequestPopupState();
}

class _DesignerRequestPopupState extends State<DesignerRequestPopup> {
  // Add controllers for text fields and variables for checkboxes
   late CompanyScreenController controller;
  @override
  void initState(){
    super.initState();
    controller=Get.put(CompanyScreenController());
  }
   @override
   void dispose() {
     // Dispose of the controller when the widget is disposed
     controller.dispose();
     super.dispose();
   }
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  bool checkbox4 = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Remove the default back arrow
        title: Text("Designer Request",
            style: TextStyle(
              fontFamily: MyFont.myFont,
              fontWeight: FontWeight.bold,
              color: MyColors.black
            )),
        actions: [
          IconButton(
            icon: Icon(Icons.cancel,color: MyColors.mainTheme,),
            onPressed: () {
              // Close the popup when cancel icon is clicked
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            controller: controller.nameController,
            hintText: "Name",
            hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
            textStyle: TextStyle(fontFamily: MyFont.myFont),
            inputFormatters: [],
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(
            controller: controller.emailController,
            hintText: "Email",
            hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
            textStyle: TextStyle(fontFamily: MyFont.myFont),
            inputFormatters: [],
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(
            controller: controller.mobileNoController,
            hintText: "Mobile No",
            hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
            textStyle: TextStyle(fontFamily: MyFont.myFont),
            inputFormatters: [],
          ),
          CheckboxListTile(
            title: Text('Graphic Design',
                style: TextStyle(
                  fontFamily: MyFont.myFont,
                  fontWeight: FontWeight.bold,
                )),
            value: checkbox1,
            onChanged: (value) {
              setState(() {
                checkbox1 = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Web Design',
              style: TextStyle(
              fontFamily: MyFont.myFont,
              fontWeight: FontWeight.bold,
            ),),
            value: checkbox2,
            onChanged: (value) {
              setState(() {
                checkbox2 = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Logo Design',
                style: TextStyle(
                  fontFamily: MyFont.myFont,
                  fontWeight: FontWeight.bold,
                )),
            value: checkbox3,
            onChanged: (value) {
              setState(() {
                checkbox3 = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Animation & Motion Graphics',
                style: TextStyle(
                  fontFamily: MyFont.myFont,
                  fontWeight: FontWeight.bold,
                )),
            value: checkbox4,
            onChanged: (value) {
              setState(() {
                checkbox4 = value!;
              });
            },
          ),
          // Repeat similar code for other checkboxes
        ],
      ),
      actions: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              Get.offAll(() => SuccessfulScreen(
                  text: "Requested Send Successfully",
                  onTap: () {
                   // Get.offAllNamed(Routes.productdashboard);
                  },
                  buttonText: "Go To Dashboard"));
              // Implement your logic for handling the request
              // For example, print the input values

              print('Checkbox 1: $checkbox1');
              // Repeat similar code for other checkboxes

              // Close the popup
            },
            child: Text("Submit Request",
              style: TextStyle(
                fontFamily: MyFont.myFont,
                fontWeight: FontWeight.bold,
              ),),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Const/assets.dart';
import '../../../Const/color.dart';
import '../../../Const/font.dart';
import '../../../Const/size.dart';
import '../../../Widget/Constructors/constructors.dart';
import '../../../Widget/submitbutton.dart';
import '../../../Widget/successfulscreen.dart';
import '../../../Widget/textformfield.dart';
import '../../../Widget/togglebutton.dart';
import 'ManageUserView Screen Controller.dart';
class ManageUserViewScreen extends StatefulWidget {
  const ManageUserViewScreen({Key? key}) : super(key: key);

  @override
  State<ManageUserViewScreen> createState() => _ManageUserViewScreenState();
}

class _ManageUserViewScreenState extends State<ManageUserViewScreen> {
  late ManageuserDetails userDetails;
  late ManageUserViewController controller;
  @override
  void initState() {
    super.initState();
    userDetails = Get.arguments as ManageuserDetails;
    controller=Get.put(ManageUserViewController());
    controller.EmployeeidController.text = userDetails.code;
    controller.nameController.text = userDetails.name;
    controller.emailcontroller.text = userDetails.mail;
  }
  bool selectAllCheckbox = false;
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  bool checkbox4 = false;

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
            "Manage User",
            style: TextStyle(fontFamily: MyFont.myFont),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(userDetails.image)
                    )
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.EmployeeidController,
                hintText: "Employee ID",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.nameController,
                hintText: "Name",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.emailcontroller,
                hintText: "Email ID",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
              ),
              const SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(() {
                      // Use Obx to automatically rebuild the widget when isActiveToggle changes
                      return Text(
                        controller.isActiveToggle.value ? "INACTIVE" : "ACTIVE",
                        style: TextStyle(
                          fontFamily: MyFont.myFont,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: controller.isActiveToggle.value
                              ? MyColors.darkGrey // Set the color for ACTIVE
                              : MyColors.darkGrey, // Set the color for INACTIVE
                        ),
                      );
                    }),
                    const SizedBox(width: 20),
                    ToggleButton(
                      onTap: (bool isStockToggle) {
                        // Update the value of isActiveToggle when the ToggleButton is tapped
                        controller.isActiveToggle.value = !controller.isActiveToggle.value;
                      },
                    )
                  ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Permissions",
                        style: TextStyle(
                            fontFamily: MyFont.myFont,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                    TextButton(onPressed: (){
                      toggleSelectAll();
                    },
                        child: Text("Select All",
                            style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                            color: MyColors.mainTheme)),)
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: checkbox1,
                        onChanged: (value) {
                          setState(() {
                            checkbox1 = value!;
                          });
                        },
                      ),
                      Text('Export/Import',
                        style: TextStyle(
                          fontFamily: MyFont.myFont,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: checkbox2,
                        onChanged: (value) {
                          setState(() {
                            checkbox2 = value!;
                          });
                        },
                      ),
                      Text('Reporting',
                        style: TextStyle(
                          fontFamily: MyFont.myFont,
                          fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: checkbox3,
                        onChanged: (value) {
                          setState(() {
                            checkbox3 = value!;
                          });
                        },
                      ),
                      Text('Publish',
                        style: TextStyle(
                          fontFamily: MyFont.myFont,
                          fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: checkbox4,
                        onChanged: (value) {
                          setState(() {
                            checkbox4 = value!;
                          });
                        },
                      ),
                      Text('Access Control',
                        style: TextStyle(
                          fontFamily: MyFont.myFont,
                          fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),
                      ),
                    ],
                  ),
                ],
              )

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
                          text: "Updated Successfully",
                          onTap: () {},
                          buttonText: "Go To Dashboard"));
                    },
                    title: "Update"),
              ),
            ],
          ),
        ),

      ),
    );
  }
  void toggleSelectAll() {
    setState(() {
      selectAllCheckbox = !selectAllCheckbox;
      checkbox1 = selectAllCheckbox;
      checkbox2 = selectAllCheckbox;
      checkbox3 = selectAllCheckbox;
      checkbox4 = selectAllCheckbox;
    });
  }


}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Const/approute.dart';
import '../../../Const/assets.dart';
import '../../../Const/color.dart';
import '../../../Const/font.dart';
import '../../../Const/size.dart';
import '../../../Widget/popupscreen.dart';
import '../../../Widget/submitbutton.dart';
import '../../../Widget/successfulscreen.dart';
import '../../../Widget/textformfield.dart';
import 'Company Screen Controller.dart';
import 'dart:io';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({Key? key}) : super(key: key);

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  bool isEditing = false;
  bool isImageCleared = false;
  XFile? pickedImage;

  late CompanyScreenController controller;
  @override
  void initState(){
    super.initState();
    controller=Get.put(CompanyScreenController());
  }
  @override
  void dispose() {
    controller.dispose(); // Make sure to dispose of the controller
    super.dispose();
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
            "Company",
            style: TextStyle(fontFamily: MyFont.myFont),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isEditing = !isEditing;
                  });
                },
                icon: const Icon(
                  Icons.edit,
                )),
            IconButton(
                onPressed: () {
                },
                icon: const Icon(
                  Icons.file_download_outlined,
                ))
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: isEditing ? 100 : 100,
                    child: Center(
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isImageCleared ? Colors.transparent : null,
                          image: pickedImage != null
                              ? DecorationImage(
                            image: FileImage(File(pickedImage!.path)),
                          )
                              : isImageCleared
                              ? null
                              : DecorationImage(
                            image: AssetImage(Assets.customerlogo),
                          ),
                        ),
                        child: isImageCleared
                            ? Icon(
                          Icons.add_photo_alternate,
                          size: 50,
                          color: Colors.grey,
                        )
                            : null,
                      )
                    ),
                  ),
                  const SizedBox(width: 10,),
                  if (isEditing)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isEditing ? MyColors.mainTheme : Colors.lightGreen,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isImageCleared = true;
                                    pickedImage = null; // Clear the picked image
                                  });
                                },
                                child: Text(
                                  "Remove",
                                  style: TextStyle(
                                    fontFamily: MyFont.myFont,
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.white,
                                  ),
                                ),
                              )

                            ),
                            const SizedBox(width: 10,),
                            SizedBox(
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isEditing ? MyColors.mainTheme : Colors.lightGreen,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () async {
                                  XFile? picked = await ImagePicker().pickImage(source: ImageSource.gallery);
                                  if (picked != null) {
                                    setState(() {
                                      pickedImage = picked;
                                      isImageCleared = false;
                                    });
                                  }
                                },
                                child: Text(
                                  "Change",
                                  style: TextStyle(
                                    fontFamily: MyFont.myFont,
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.white,
                                  ),
                                ),
                              )


                              ,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isEditing ? MyColors.mainTheme : Colors.lightGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return DesignerRequestPopup();
                                },
                              );
                            },
                            child: Text(
                              "Request for Designer",
                              style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontWeight: FontWeight.bold,
                                color: MyColors.white,
                              ),
                            ),
                          )

                        ),
                      ],

                    ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.companyNameController,
                hintText: "Company Name",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                enabled: isEditing,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.regnoController,
                hintText: "Reg.No",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                enabled: isEditing,
              ),
              const SizedBox(height: 20),
            TextFormField(
              controller: controller.emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: TextStyle(fontFamily: MyFont.myFont),
              inputFormatters: [],
              enabled: isEditing,
              decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(fontFamily: MyFont.myFont),
                  counterText: "",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
                    child: GestureDetector(
                      onTap: () async {
                      },
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: isEditing ?MyColors.mainTheme: Colors.lightGreen,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0))),
                            onPressed: () {
                            },
                            child: Text(
                              "Validate",
                              style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontWeight: FontWeight.bold,
                                color: MyColors.white,
                              ),
                            )),
                      ),
                    ),
                  ),
                  filled: true,
                  fillColor: MyColors.lightGray,
                  contentPadding: const EdgeInsets.all(10.0),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: MyColors.primaryCustom)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.passwordController,
                hintText: "Password",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                enabled: isEditing,
              ),const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.countryController,
                hintText: "Country",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                enabled: isEditing,
              ),const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.addressLine1Controller,
                hintText: "Address Line 1",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                enabled: isEditing,
              ),const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.addressLine2Controller,
                hintText: "Address Line 2",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                enabled: isEditing,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Flexible(
                    child: CustomTextFormField(
                      controller: controller.floorNoController,
                      hintText: "Floor No",
                      hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                      textStyle: TextStyle(fontFamily: MyFont.myFont),
                      inputFormatters: [],
                      enabled: isEditing,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: CustomTextFormField(
                      controller: controller.unitNoController,
                      hintText: "Unit No",
                      hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                      textStyle: TextStyle(fontFamily: MyFont.myFont),
                      inputFormatters: [],
                      enabled: isEditing,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller.postalCodeController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                enabled: isEditing,
                decoration: InputDecoration(
                    hintText: 'Postal Code',
                    hintStyle: TextStyle(fontFamily: MyFont.myFont),
                    counterText: "",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
                      child: GestureDetector(
                        onTap: () async {
                        },
                        child: SizedBox(
                          height: 40,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColors.primaryCustom,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0))),
                              onPressed: () {
                              },
                              child: Text(
                                "Fetch",
                                style: TextStyle(
                                  fontFamily: MyFont.myFont,
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.white,
                                ),
                              )),
                        ),
                      ),
                    ),
                    filled: true,
                    fillColor: MyColors.lightGray,
                    contentPadding: const EdgeInsets.all(10.0),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: MyColors.primaryCustom)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Contact Information",
                    style: TextStyle(
                    fontFamily: MyFont.myFont,
                    fontWeight: FontWeight.bold,
                    color: MyColors.mainTheme,
                      fontSize: 20
                  ),)
                ],
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.nameController,
                hintText: "Name",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                enabled: isEditing,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.mobileNoController,
                hintText: "Mobile No",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                enabled: isEditing,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.emailController,
                hintText: "Email",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                enabled: isEditing,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.websiteController,
                hintText: "Website",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                enabled: isEditing,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.facebookController,
                hintText: "Facebook",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                enabled: isEditing,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.instaController,
                hintText: "Instagram",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                enabled: isEditing,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.linkedinController,
                hintText: "LinkedIn",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                enabled: isEditing,
              ),
              const SizedBox(height: 20),CustomTextFormField(
                controller: controller.youtubeController,
                hintText: "YouTube",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                enabled: isEditing,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Profile",
                    style: TextStyle(
                        fontFamily: MyFont.myFont,
                        fontWeight: FontWeight.bold,
                        color: MyColors.mainTheme,
                        fontSize: 20
                    ),)
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Enter Your Company Details",
                    style: TextStyle(
                        fontFamily: MyFont.myFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),)
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller.fileController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                enabled: isEditing,
                decoration: InputDecoration(
                    hintText: 'Attach Company Profile',
                    hintStyle: TextStyle(fontFamily: MyFont.myFont),
                    counterText: "",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
                      child: GestureDetector(
                        onTap: () async {
                        },
                        child: SizedBox(
                          height: 40,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColors.primaryCustom,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0))),
                              onPressed: () {
                              },
                              child: Text(
                                "Upload a File",
                                style: TextStyle(
                                  fontFamily: MyFont.myFont,
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.white,
                                ),
                              )),
                        ),
                      ),
                    ),
                    filled: true,
                    fillColor: MyColors.lightGray,
                    contentPadding: const EdgeInsets.all(10.0),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: MyColors.primaryCustom)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.companybioController,
                hintText: "Enter few Words About Your Company",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                enabled: isEditing,
                maxLine: 5,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.businesscategoryController,
                hintText: "Business Category",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                enabled: isEditing,
                suffixIcon: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.keyboard_arrow_down_outlined)),
              ),
            ],
          ),
        ),
        bottomNavigationBar: isEditing
            ? Padding(
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
                          text: "Profile Updated Successfully",
                          onTap: () {},
                          buttonText: "Go To Dashboard"));
                    },
                    title: "Updated"),
              ),
            ],
          ),
        )// Render a different bottom navigation bar for editing state
            : Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: width(context) / 2,
                child: SubmitButton(
                  isLoading: false,
                  onTap: () {
                    // Handle the button tap for non-editing state
                     Get.toNamed(Routes.manageuserlistscreen);
                  },
                  title: "Manage User",
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}

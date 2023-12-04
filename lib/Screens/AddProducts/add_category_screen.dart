import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universal_b2b/Screens/AddProducts/add_category_controller.dart';

import '../../Const/assets.dart';
import '../../Const/color.dart';
import '../../Const/font.dart';
import '../../Const/size.dart';
import '../../Widget/submitbutton.dart';
import '../../Widget/successfulscreen.dart';
import '../../Widget/textformfield.dart';
class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {

  List<File> selectedImages = [];
  final picker = ImagePicker();

  late AddCategoryController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(AddCategoryController());
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
            "Add Category",
            style: TextStyle(fontFamily: MyFont.myFont),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.codeController,
                hintText: "CODE",
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
              TextFormField(
                controller: controller.imageController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                readOnly: true,
                decoration: InputDecoration(
                    hintText: 'IMAGE GALLERY',
                    hintStyle: TextStyle(fontFamily: MyFont.myFont),
                    counterText: "",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
                      child: SizedBox(
                        height: 30,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: MyColors.primaryCustom,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0))),
                            onPressed: () {
                              getcategoryImages();
                            },
                            child: Text(
                              "Add",
                              style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontWeight: FontWeight.bold,
                                color: MyColors.white,
                              ),
                            )),
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
                onTap: () {
                  getcategoryImages();
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: selectedImages.isNotEmpty
                    ? imageSelectedGrid()
                    : Container(),
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
                          text: "Product Added Successfully",
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

  Future getcategoryImages() async {
    final pickedFile = await picker.pickMultiImage(
      imageQuality: 100,
      maxHeight: 1000,
      maxWidth: 1000,
    );
    List<XFile> xfilePick = pickedFile;

    setState(() {
      if (xfilePick.isNotEmpty) {
        for (var i = 0; i < xfilePick.length; i++) {
          selectedImages.add(File(xfilePick[i].path));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Nothing is selected')));
      }
    });
  }
  imageSelectedGrid() {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: selectedImages.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: SizedBox(
                  height: double.infinity,
                  width: double.maxFinite,
                  child: Image.file(
                    selectedImages[index],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 130),
                child: IconButton(
                  icon: Image.asset(Assets.clear),
                  onPressed: () {
                    removeImage(index);
                  },
                ),
              ),
            ],
          );
        });
  }


  void clearSelectedImages() {
    setState(() {
      selectedImages.clear();
    });
  }

  void removeImage(int index) {
    setState(() {
      selectedImages.removeAt(index);
    });
  }
}

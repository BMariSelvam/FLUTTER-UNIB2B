import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universal_b2b/Const/font.dart';
import 'package:universal_b2b/Const/size.dart';
import 'package:universal_b2b/Widget/submitbutton.dart';
import 'package:universal_b2b/Widget/successfulscreen.dart';
import 'package:universal_b2b/Widget/textformfield.dart';
import '../../Const/approute.dart';
import '../../Const/assets.dart';
import '../../Const/color.dart';
import '../../Widget/togglebutton.dart';
import 'addproductscontroller.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class AddProductsScreen extends StatefulWidget {
  const AddProductsScreen({super.key});

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  List<File> selectedImages = [];
  final picker = ImagePicker();

  late AddProductsController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(AddProductsController());
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
            "Add Products",
            style: TextStyle(fontFamily: MyFont.myFont),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                controller: controller.skuController,
                hintText: "SKU",
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
                controller: controller.shortDescriptionController,
                hintText: "SHORT DESCRIPTION",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.descriptionController,
                hintText: "DESCRIPTION",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                maxLine: 5,
              ),const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.categoryController,
                hintText: "CATEGORY",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                suffixIcon: IconButton(
                  icon:Icon(Icons.keyboard_arrow_down) ,
                  onPressed: (){},),
              ),const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.subcategoryController,
                hintText: "SUB CATEGORY",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                suffixIcon: IconButton(
                  icon:Icon(Icons.keyboard_arrow_down) ,
                  onPressed: (){},),
              ),const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.brandController,
                hintText: "BRAND",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                suffixIcon: IconButton(
                  icon:Icon(Icons.keyboard_arrow_down) ,
                  onPressed: (){},),
              ),const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.uomController,
                hintText: "UOM",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                suffixIcon: IconButton(
                  icon:Icon(Icons.keyboard_arrow_down) ,
                  onPressed: (){},),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.priceController,
                hintText: "PRICE",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller.barCodeController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                decoration: InputDecoration(
                    hintText: 'BAR CODE',
                    hintStyle: TextStyle(fontFamily: MyFont.myFont),
                    counterText: "",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
                      child: GestureDetector(
                        onTap: () async {
                          String? barcode = await BarcodeScannerService.scanBarcode();
                          if (barcode != null) {
                            // Handle the scanned barcode result, e.g., update the controller's text
                            controller.barCodeController.text = barcode;
                          }
                        },
                        child: SizedBox(
                          height: 50,
                          child: Card(
                            elevation: 4,
                            shadowColor: MyColors.grey,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(Assets.barcode),
                            ),
                          ),
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
                              getImages();
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
                  getImages();
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: selectedImages.isNotEmpty
                    ? imageSelectedGrid()
                    : Container(),
              ),
              const SizedBox(height: 20),
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
                        controller.isStockToggle.value =
                            !controller.isStockToggle.value;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "SHOW PRICE TO EVERYONE",
                    style: TextStyle(
                      fontFamily: MyFont.myFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: MyColors.darkGrey,
                    ),
                  ),
                  const SizedBox(width: 20),
                  ToggleButton(
                    onTap: (bool isPriceToggle) {
                      setState(() {
                        controller.isPriceToggle.value =
                            !controller.isPriceToggle.value;
                      });
                    },
                  )
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
                      isLoading: false, onTap: () {
                    Get.toNamed(Routes.productListingPage);
                  }, title: "Cancel")),
              SizedBox(
                width: width(context) / 2.5,
                child: SubmitButton(
                    isLoading: false,
                    onTap: () {
                      Get.offAll(() => SuccessfulScreen(
                          text: "Product Added Successfully",
                          onTap: () {
                            Get.offAllNamed(Routes.productdashboard);
                          },
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

  Future getImages() async {
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



class BarcodeScannerService {
  static Future<String?> scanBarcode() async {
    try {
      String barcode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", // color of the toolbar in hexadecimal
        "Cancel",   // text for the cancel button
        false,       // show flash icon
        ScanMode.BARCODE, // specify the type of code to scan
      );

      return barcode;
    } catch (e) {
      // Handle errors
      print("Error scanning barcode: $e");
      return null;
    }
  }
}


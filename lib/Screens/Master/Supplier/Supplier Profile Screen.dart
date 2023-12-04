import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Const/approute.dart';
import '../../../Const/assets.dart';
import '../../../Const/color.dart';
import '../../../Const/font.dart';
import '../../../Const/size.dart';
import '../../../Widget/submitbutton.dart';
import '../../../Widget/successfulscreen.dart';
class SupplierProfileScreen extends StatefulWidget {
  const SupplierProfileScreen({super.key});

  @override
  State<SupplierProfileScreen> createState() => _SupplierProfileScreenState();
}

class _SupplierProfileScreenState extends State<SupplierProfileScreen> {
  bool showDetails = false;
  String source = '';

  @override
  void initState() {
    super.initState();
    // Retrieve the parameter when the screen is created
    Map args = Get.arguments;
    source = args != null ? args['source'] : '';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: MyColors.mainTheme,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
            print("==============================");
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: MyColors.white,
          ),
        ),
        title: Text(
          "Supplier Profile",
          style: TextStyle(fontFamily: MyFont.myFont, color: MyColors.white,),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(Assets.customerlogo)
                      )
                  ),
                ),
                SizedBox(width: width(context)/20),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("NAME:",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: MyFont.myFont,
                            color: MyColors.darkGrey
                        ),),
                        Text("Pushparaj",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: MyFont.myFont,
                            color: MyColors.darkGrey
                        ),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("REG.NO:",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: MyFont.myFont,
                            color: MyColors.darkGrey
                        ),),
                        Text("987654321",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: MyFont.myFont,
                            color: MyColors.darkGrey
                        ),),
                      ],
                    ),

                  ],
                )
              ],
            ),
            SizedBox(height: height(context)/30 ,),
            Container(
              height:  height(context)/5 ,
              width: width(context),
              decoration: BoxDecoration(
                  color: MyColors.lightGray,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text("About Company",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: MyFont.myFont,
                        color: MyColors.darkGrey
                    )),
              ),
            ),
            SizedBox(height: height(context)/40 ,),
            Container(
              height:  height(context)/15 ,
              width: width(context),
              decoration: BoxDecoration(
                  color: MyColors.lightGray,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Business Category",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: MyFont.myFont,
                          color: MyColors.darkGrey
                      )),
                ),
              ),
            ),
            SizedBox(height: height(context)/40 ,),
            Container(
              height:  height(context)/15,
              width: width(context),
              decoration: BoxDecoration(
                  color: MyColors.lightGray,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Company Details",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: MyFont.myFont,
                            color: MyColors.darkGrey
                        )),
                    IconButton(onPressed: (){
                      setState(() {
                        showDetails = !showDetails;
                      });
                    },
                      icon: Icon(
                        showDetails ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      ),)
                  ],
                ),


              ),
            ),
            showDetails ?  Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              // color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Email ID:",
                        style: TextStyle(
                            fontFamily: MyFont.myFont,
                            color: MyColors.darkGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                      ),
                      Text(
                        "Pushparaj21@gmail.com",
                        style: TextStyle(
                            fontFamily: MyFont.myFont,
                            color: MyColors.darkGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Address:",
                        style: TextStyle(
                            fontFamily: MyFont.myFont,
                            color: MyColors.darkGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            Text(
                              "Pushparaj21@gmail.com",
                              style: TextStyle(
                                  fontFamily: MyFont.myFont,
                                  color: MyColors.darkGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ):
            SizedBox(),
            SizedBox(height: height(context)/40 ,),
            Container(
              height:  height(context)/15,
              width: width(context),
              decoration: BoxDecoration(
                  color: MyColors.lightGray,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Contact Details",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: MyFont.myFont,
                            color: MyColors.darkGrey
                        )),
                    IconButton(onPressed: (){},
                        icon: Icon(Icons.keyboard_arrow_down))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: source == 'approve'
          ? buildApproveBottomNavigationBar()
          : buildDefaultBottomNavigationBar(),
    );
  }
  YourBottomSheetContent(){
    return Container(
      height: height(context)/4,
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
              child: Text(
                "Are you sure want connect to the Business?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.grey,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                ),
                  child: Text("No", style: TextStyle(color: MyColors.mainTheme,
                  fontFamily: MyFont.myFont),),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _showPopup();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.mainTheme,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                  ),
                  child: Text("Yes", style: TextStyle(color: MyColors.white,fontFamily: MyFont.myFont)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void _showPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.symmetric(vertical: 24),
          content: Container(
            height: height(context)/3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(Assets.successful),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Connected Request Send Successfully",
                  style: TextStyle(
                    fontFamily: MyFont.myFont,
                    color: MyColors.mainTheme,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                ),
              ],
            ),
          ),
        );
      },
    );

    // Close the popup after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pop(context);
    });
  }

  Widget buildApproveBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: buildIconButton(
              onPressed: () {
                Get.toNamed(Routes.productcataloguescreeen);
              },
              icon: Assets.shopBag,
              label: 'Product Catalogue',
            ),
          ),
          Expanded(child:  buildIconButton(
            onPressed: () {
              Get.toNamed(Routes.requestquotationscreen);
            },
            icon: Assets.reqQuot,
            label: 'Request Quotation',
          ),),
         
          Expanded(
            child: buildIconButton(
              onPressed: () {},
              icon: Assets.work,
              label: 'Purchase Order',
            ),
          ),
          Expanded(
            child: buildIconButton(
              onPressed: () {
                Get.toNamed(Routes.supplierPurAnalysisScreen);
              },
              icon: Assets.purchaseAnalysis,
              label: 'Purchase Analysis',
            ),
          ),
          Expanded(child: buildIconButton(
            onPressed: () {
              Get.toNamed(Routes.paymentScreen);
            },
            icon: Assets.payment,
            label: 'Payment',
          ),),
          
        ],
      ),
    );
  }
  Widget buildDefaultBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildIconButton(
            onPressed: () {
              Get.toNamed(Routes.productcataloguescreeen);
            },
            icon: Assets.shopBag,
            label: 'View Product \nCatalogue',
          ),
          const SizedBox(width: 25,),
          buildIconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                ),
                builder: (BuildContext context) {
                  return YourBottomSheetContent();
                },
              );
            },
            icon: Assets.work,
            label: 'Send Business \nRequest',
          ),
        ],
      ),
    );
  }
  Widget buildIconButton({
    required VoidCallback onPressed,
    required String icon,
    required String label,
  }) {
    return SizedBox(
      // width: width(context) / 3.5,
      child: SizedBox(
        height: 90,
        child: Column(
          children: [
            Ink(
              decoration: ShapeDecoration(
                color: MyColors.mainTheme,
                shape: CircleBorder(),
              ),
              child: IconButton(
                onPressed: onPressed,
                color: Colors.white,
                icon: Image.asset(icon, scale: 2,),
              ),
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontFamily: MyFont.myFont,
                fontWeight: FontWeight.w500,
                color: MyColors.black,
                fontSize: 12,
              ),
              maxLines: 2, // Set max lines to 2
              overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

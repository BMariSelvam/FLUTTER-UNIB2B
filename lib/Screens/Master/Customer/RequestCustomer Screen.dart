import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universal_b2b/Const/assets.dart';
import 'package:universal_b2b/Const/color.dart';

import '../../../Const/approute.dart';
import '../../../Const/font.dart';
import '../../../Const/size.dart';
import '../../../Widget/submitbutton.dart';
import '../../../Widget/successfulscreen.dart';
class RequestCustomerScreen extends StatefulWidget {
  const RequestCustomerScreen({super.key});

  @override
  State<RequestCustomerScreen> createState() => _RequestCustomerScreenState();
}

class _RequestCustomerScreenState extends State<RequestCustomerScreen> {
  bool showDetails = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          title: Text(
            "Request Customer",
            style: TextStyle(fontFamily: MyFont.myFont),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(Assets.customerlogo)
                        )
                      ),
                    ),
                    SizedBox(width: width(context)/20),
                     Column(
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
                SizedBox(height: height(context)/40 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Assets.instalogo)
                        )
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Assets.facebook)
                          )
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Assets.linkedinlogo)
                          )
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Assets.youtube)
                          )
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Assets.vector)
                          )
                      ),
                    ),


                  ],
                )
              ],
            ),
          ),
        ),
      bottomNavigationBar: buildApproveBottomNavigationBar(),
    );
  }
  Widget buildApproveBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: buildIconButton(
              onPressed: () {
               // Get.toNamed(Routes.totalOrdersScreen);
              },
              icon: Assets.right,
              label: 'Approve',
            ),
          ),
          Expanded(
            child: buildIconButton(
              onPressed: (){
                //Get.toNamed(Routes.pendingOrdersScreen);
              },
              icon: Assets.wrong,
              label: 'Reject',
            ),
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
        width: 90,
        child: Column(
          children: [
            Ink(
              decoration: const ShapeDecoration(
                color: MyColors.mainTheme,
                shape: CircleBorder(),
              ),
              child: IconButton(
                onPressed: onPressed,
                color: Colors.white,
                icon: Image.asset(
                  icon,
                  scale: 1,
                ),
              ),
            ),
            SizedBox(height: 5),
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

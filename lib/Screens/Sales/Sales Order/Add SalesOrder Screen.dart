import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Const/color.dart';
import '../../../Const/font.dart';
import '../../../Const/size.dart';
import '../../../Widget/submitbutton.dart';
import '../../../Widget/successfulscreen.dart';
import '../../../Widget/textformfield.dart';
import 'Add SalesOrder Screen Controller.dart';

class addSalesOrderScreen extends StatefulWidget {
  const addSalesOrderScreen({Key? key}) : super(key: key);

  @override
  State<addSalesOrderScreen> createState() => _addSalesOrderScreenState();
}

class _addSalesOrderScreenState extends State<addSalesOrderScreen> {

  late AddSalesOrderScreenController controller;

  @override
  void initState(){
    super.initState();
    controller=Get.put(AddSalesOrderScreenController());
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
            "Add Sales Order"
                ""
                ""
                ""
                "",
            style: TextStyle(fontFamily: MyFont.myFont),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                controller: controller.quatationnamecontroller,
                hintText: "TRAN No",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.dateController,
                hintText: "Date",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
                suffixIcon: IconButton(onPressed: (){},icon:Icon(Icons.calendar_month,) ),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.customercontroller,
                hintText: "Customer",
                hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                textStyle: TextStyle(fontFamily: MyFont.myFont),
                inputFormatters: [],
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: CustomTextFormField(
                  controller: controller.addressController,
                  hintText: "Address",
                  hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                  textStyle: TextStyle(fontFamily: MyFont.myFont),
                  inputFormatters: [],
                  maxLine: 5,
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    tapBarWidget(
                      context: context,
                      heading1: "S.No",
                      heading2: "Description",
                      heading3: "Qty",
                      heading4: "Price",
                      heading5: "T.Qty",
                    ),
                    Container(
                      color: MyColors.darkGrey,
                      height: 1,
                    ),
                    productDetails(),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              remarkAndTotal(),
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
                          text: "Quotation Updated Successfully",
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
  Text containerText(String val) {
    return Text(
      val,
      style: TextStyle(
          fontFamily: MyFont.myFont,
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: MyColors.darkGrey),
    );
  }

  tapBarWidget(
      {required BuildContext context,
        required String heading1,
        required String heading2,
        required String heading3,
        required String heading4,
        required String heading5}) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(0.8),
          1: FlexColumnWidth(2),
          4: FlexColumnWidth(1.2)
        },
        children: [
          TableRow(children: [
            Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              color: MyColors.grey,
              child: Text(
                heading1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: MyFont.myFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: MyColors.darkGrey),
              ),
            ),
            Container(
              color: MyColors.white24,
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10),
              child: Text(
                heading2,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: MyFont.myFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: MyColors.darkGrey),
              ),
            ),
            Container(
              color: MyColors.grey,
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Text(
                heading3,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: MyFont.myFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: MyColors.darkGrey),
              ),
            ),
            Container(
              color: MyColors.white24,
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Text(
                heading4,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: MyFont.myFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: MyColors.darkGrey),
              ),
            ),
            Container(
              color: MyColors.grey,
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Text(
                heading5,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: MyFont.myFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: MyColors.darkGrey),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  tapBar2Widget(
      {required BuildContext context,
        required String heading1,
        required String heading2,
        required String heading3,
        required String heading4,
        required String heading5}) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(0.8),
          1: FlexColumnWidth(2),
          4: FlexColumnWidth(1.2)
        },
        children: [
          TableRow(children: [
            Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              color: MyColors.grey,
              child: Text(
                heading1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: MyFont.myFont,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: MyColors.darkGrey),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10),
              color: MyColors.white24,
              child: Text(
                heading2,
                textAlign: TextAlign.start,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: MyFont.myFont,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: MyColors.darkGrey),
              ),
            ),
            Container(
              color: MyColors.grey,
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Text(
                heading3,
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: MyFont.myFont,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: MyColors.darkGrey),
              ),
            ),
            Container(
              color: MyColors.white24,
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Text(
                heading4,
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: MyFont.myFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: MyColors.darkGrey),
              ),
            ),
            Container(
              color: MyColors.grey,
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Text(heading5,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: MyFont.myFont,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: MyColors.darkGrey)),
            ),
          ]),
        ],
      ),
    );
  }
  productDetails() {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return tapBar2Widget(
            context: context,
            heading1: "01.",
            heading2: "Apple",
            heading3: "10",
            heading4: "87.00",
            heading5: "870.00",
          );
          Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 18, right: 18),
              decoration: BoxDecoration(
                // color: index.isEven ? hexStringToColor('FFFFFF') : hexStringToColor('F4F4F4'),
                  border: Border.all(color: MyColors.mainTheme)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "123",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: MyFont.myFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: MyColors.mainTheme),
                  ),
                  Text(
                    "Apple",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: MyFont.myFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: MyColors.mainTheme),
                  ),
                  Text(
                    "10",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: MyFont.myFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: MyColors.mainTheme),
                  ),
                  Text(
                    "87.00",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: MyFont.myFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: MyColors.mainTheme),
                  ),
                  Text(
                    "870.00",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: MyFont.myFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: MyColors.mainTheme),
                  ),
                ],
              ));
        },
      ),
    );
  }

  remarkAndTotal() {
    return Row(
      children: [
        Expanded(
            child: Container(
              height: height(context) / 6,
              padding: const EdgeInsets.all(6),
              margin: const EdgeInsets.fromLTRB(15, 10, 3, 10),
              decoration: BoxDecoration(
                  color: MyColors.grey,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'REMARK',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: MyFont.myFont,
                        fontWeight: FontWeight.bold,
                        color: MyColors.black),
                  ),
                  SizedBox(
                    height: height(context) / 8.4,
                    child: SingleChildScrollView(
                      child: Text(
                        'Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text,',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: MyFont.myFont,
                          fontWeight: FontWeight.bold,
                          // color: hexStringToColor('878787')
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
        Expanded(
            child: Container(
              height: height(context) / 6,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.fromLTRB(3, 10, 15, 10),
              decoration: BoxDecoration(
                  color: MyColors.grey,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width(context) / 5,
                            child: Text('Sub Qty',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: MyFont.myFont,
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.black)),
                          ),
                          Text(':',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: MyFont.myFont,
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.black)),
                        ],
                      ),
                      Text('2152.00',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: MyFont.myFont,
                              fontWeight: FontWeight.bold,
                              color: MyColors.black)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width(context) / 5,
                            child: Text('Tax',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: MyFont.myFont,
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.black)),
                          ),
                          Text(':',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: MyFont.myFont,
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.black)),
                        ],
                      ),
                      Text('150.00',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: MyFont.myFont,
                              fontWeight: FontWeight.bold,
                              color: MyColors.black)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width(context) / 5,
                            child: Text('Net Qty',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: MyFont.myFont,
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.black)),
                          ),
                          Text(':',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: MyFont.myFont,
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.black)),
                        ],
                      ),
                      Text('2152.00',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: MyFont.myFont,
                              fontWeight: FontWeight.bold,
                              color: MyColors.black)),
                    ],
                  ),
                ],
              ),
            ))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_b2b/Const/assets.dart';
import 'package:universal_b2b/Const/color.dart';
import 'package:universal_b2b/Const/font.dart';
import 'package:universal_b2b/Const/size.dart';

class PaidDetailsScreen extends StatefulWidget {
  const PaidDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PaidDetailsScreen> createState() => _PaidDetailsScreenState();
}

class _PaidDetailsScreenState extends State<PaidDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.mainTheme,
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
          "Paid Details",
          style: TextStyle(
            fontFamily: MyFont.myFont,
            color: MyColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 30, 18, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
                children: [
              SizedBox(
                width: 120,
                height: 120,
                child: DecoratedBox(
                    decoration:
                    BoxDecoration(color: Colors.black54,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: const [
                          BoxShadow(color: MyColors.darkGrey,
                            blurRadius: 10,
                            spreadRadius: 01,
                          )
                        ]),
                    child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(Assets.banner1))),
              ),
              const SizedBox(height: 20,),
              Text(
                "Invoice Name",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: MyFont.myFont,
                    color: MyColors.black),
              ),
              Text(
                "Invoice Number",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: MyFont.myFont,
                    color: MyColors.darkGrey),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 20),
              Text(
                "Paid Amount",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: MyFont.myFont,
                    color: MyColors.darkGrey),
              ),
              const SizedBox(height: 5),
              Text(
                "\$100.00",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: MyFont.myFont,
                    color: MyColors.black),
              ),
            ]),
            const SizedBox(height: 25),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transfer ID",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: MyFont.myFont,
                      color: MyColors.darkGrey),
                ),
                Text(
                  "0000000",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: MyFont.myFont,
                      color: MyColors.mainTheme),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Status",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: MyFont.myFont,
                      color: MyColors.darkGrey),
                ),
                Text(
                  "Received",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: MyFont.myFont,
                      color: MyColors.mainTheme),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your Transfer",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: MyFont.myFont,
                      color: MyColors.darkGrey),
                ),
                Text(
                  "\$100.00",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: MyFont.myFont,
                      color: MyColors.mainTheme),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: MyFont.myFont,
                      color: MyColors.darkGrey),
                ),
                Text(
                  "21/11/2023",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: MyFont.myFont,
                      color: MyColors.mainTheme),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Time",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: MyFont.myFont,
                      color: MyColors.darkGrey),
                ),
                Text(
                  "14.35 pm",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: MyFont.myFont,
                      color: MyColors.mainTheme),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

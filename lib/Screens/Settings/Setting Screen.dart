import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Const/assets.dart';
import '../../Const/color.dart';
import '../../Const/font.dart';
import '../../Widget/Constructors/constructors.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
               // Get.back();
              },
              icon: const Icon(Icons.menu)),
          // title: Text(
          //   "Products",
          //   style: TextStyle(fontFamily: MyFont.myFont),
          // ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart_rounded,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: SizedBox(child: SettingGridView()),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 200,
                child: Container(
                  color: MyColors.lightPurple,
                  child: Center(
                    child: SizedBox(
                      height: 150,
                      child: MasterListView(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  ///MainGridViewBuilderListNavigation
  List SettingDashBoardGridNavigation() => [

  ];
  ///ProductsPageGridView
  SettingGridView() {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => SettingDashBoardGridNavigation()[index]));
            },
            child: Card(
              elevation: 0,
              shape: settingGrid[index].border,
              color: settingGrid[index].color,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(settingGrid[index].image, scale: 3),
                    const SizedBox(height: 20),
                    Text(
                      settingGrid[index].text,
                      style: TextStyle(
                        fontFamily: MyFont.myFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: MyColors.primaryCustom,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
  List<MasterGrid> settingGrid = [
    MasterGrid(
      image: Assets.category,
      text: 'Integration',
      color: MyColors.lightDarkBlue,
      border: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          )),
    ),
    MasterGrid(
        image: Assets.brand,
        text: 'Delivery',
        color: MyColors.lightPurple,
        border: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ))),
    MasterGrid(
        image: Assets.subCategory,
        text: 'General',
        color: MyColors.lightBlue,
        border: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
            ))),
    MasterGrid(
        image: Assets.uom,
        text: 'Transection',
        color: MyColors.lightBlue,
        border: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ))),
  ];
  ///productsHorizontalListView
  MasterListView() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: SizedBox(
                width: 300,
                child: Image.asset(
                  Assets.productBanner,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        });
  }
}

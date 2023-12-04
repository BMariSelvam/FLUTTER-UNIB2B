import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universal_b2b/Screens/Master/Bank/Bank%20Screen.dart';
import 'package:universal_b2b/Screens/Master/Currency%20Screen/Currency%20List%20Screen.dart';
import 'package:universal_b2b/Screens/Master/Customer/Customer%20Screen.dart';
import 'package:universal_b2b/Screens/Master/Pay%20Mode/Paymode%20Screen.dart';
import 'package:universal_b2b/Screens/Master/Supplier/Supplier%20Screen.dart';
import 'package:universal_b2b/Screens/Master/Tax/Tax%20Screen.dart';

import '../../Const/approute.dart';
import '../../Const/assets.dart';
import '../../Const/color.dart';
import '../../Const/font.dart';
import '../../Widget/Constructors/constructors.dart';
import 'Terms/Terms List Screen.dart';


class MasterScreen extends StatefulWidget {
  const MasterScreen({super.key});

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                //Get.back();
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
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.companyscreen);
                  },
                  child: Card(
                    elevation: 0,
                    color: MyColors.lightPurple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.dashProducts,
                            scale: 3,
                          ),
                          const SizedBox(width: 20),
                          Text(
                            "Company",
                            style: TextStyle(
                              fontFamily: MyFont.myFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: MyColors.primaryCustom,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: SizedBox(child: MasterGridView()),
              ),
              const SizedBox(height: 20),
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
  List MasterDashBoardGridNavigation() => [
    const CustomerScreen(),
    const SupplierScreen(),
    const BankScreen(),
    const PayModeScreen(),
    const TaxScreen(),
    const TermsListScreen(),
    const CurrencyListScreen(),

  ];
  ///ProductsPageGridView
  MasterGridView() {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 7,
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
                      builder: (builder) => MasterDashBoardGridNavigation()[index]));
            },
            child: Card(
              elevation: 0,
              shape: masterGrid[index].border,
              color: masterGrid[index].color,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(masterGrid[index].image, scale: 3),
                    const SizedBox(height: 20),
                    Text(
                      masterGrid[index].text,
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
  List<MasterGrid> masterGrid = [
    MasterGrid(
      image: Assets.dashMaster,
      text: 'Customer',
      color: MyColors.lightPurple,
      border: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          )),
    ),
    MasterGrid(
        image: Assets.supplier,
        text: 'Supplier',
        color: MyColors.lightOrange,
        border: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ))),
    MasterGrid(
        image: Assets.bank,
        text: 'Bank',
        color: MyColors.lightBlue,
        border: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
            ))),
    MasterGrid(
        image: Assets.paymode,
        text: 'Pay Mode',
        color: MyColors.lightBlue,
        border: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ))),
    MasterGrid(
        image: Assets.tax,
        text: 'Tax',
        color: MyColors.lightGray,
        border: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
            ))),
    MasterGrid(
        image: Assets.terms,
        text: 'Terms',
        color: MyColors.lightPurple,
        border: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ))),
    MasterGrid(
        image: Assets.currency,
        text: 'Currency',
        color: MyColors.lightBlue,
        border: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
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

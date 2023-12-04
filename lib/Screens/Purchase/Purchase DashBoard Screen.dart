import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Const/approute.dart';
import '../../Const/assets.dart';
import '../../Const/color.dart';
import '../../Const/font.dart';
import '../../Widget/Constructors/constructors.dart';
import 'Purchase Invoice/Purchase Invoice Screen.dart';
import 'Purchase Order/Purchase Order Screen.dart';
import 'Purchase Quatation/Quatation List Screen.dart';
import 'Purchase Return/Purchase Return Screen.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({super.key});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
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
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: SizedBox(child: PurchaseGridView()),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.purchaseanalyticsscreen);
                  },
                  child: Card(
                    elevation: 0,
                    color: MyColors.lightPurple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
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
                            "Analysis",
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
              SizedBox(
                height: 200,
                child: Container(
                  color: MyColors.lightBlue,
                  child: Center(
                    child: SizedBox(
                      height: 150,
                      child: PurchaseListView(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
  ///PurchaseGridViewBuilderListNavigation
  List PurchaseDashBoardGridNavigation() => [
    const QuatationListPage(),
    const PurchaseOrderScreen(),
    const PurchaseInvoiceScreen(),
    const PurchaseReturnScreen()
  ];
  ///PurchasePageGridView
  PurchaseGridView() {
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
                      builder: (builder) => PurchaseDashBoardGridNavigation()[index]));
            },
            child: Card(
              elevation: 0,
              shape: PurchaseGrid[index].border,
              color: PurchaseGrid[index].color,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(PurchaseGrid[index].image, scale: 3),
                    const SizedBox(height: 20),
                    Text(
                      PurchaseGrid[index].text,
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
  List<SalesGrid> PurchaseGrid = [
    SalesGrid(
      image: Assets.dashMaster,
      text: 'Quotation',
      color: MyColors.lightPurple,
      border: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          )),
    ),
    SalesGrid(
        image: Assets.salesClick,
        text: 'Purchase Order',
        color: MyColors.lightYellow,
        border: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ))),
    SalesGrid(
        image: Assets.subCategory,
        text: 'Purchase Invoice',
        color: MyColors.lightBlue,
        border: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
            ))),
    SalesGrid(
        image: Assets.uom,
        text: 'Purchase Return',
        color: MyColors.lightBlue,
        border: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ))),

  ];
  ///purchaseHorizontalListView
  PurchaseListView() {
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

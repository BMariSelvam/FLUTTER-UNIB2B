import 'package:flutter/material.dart';
import 'package:universal_b2b/Const/font.dart';
import '../../Const/assets.dart';
import '../../Const/color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../Widget/Constructors/constructors.dart';
import '../Master/Master DashBoard Screen.dart';
import '../Products/Product DashBoard Screen.dart';
import '../Purchase/Purchase DashBoard Screen.dart';
import '../Sales/Sales DashBoard Screen.dart';
import '../Settings/Setting Screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final List<String> bannerList = [
    Assets.banner1,
    Assets.banner2,
    Assets.banner3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: MyColors.primaryCustom,
            expandedHeight: 300,
            pinned: true,
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
            flexibleSpace: FlexibleSpaceBar(
                background: Stack(
              children: [
                InkWell(
                  onTap: () {},
                  child: CarouselSlider(
                    items: bannerList.map((item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.asset(
                            item,
                            fit: BoxFit.cover,
                            width: double.maxFinite,
                          );
                        },
                      );
                    }).toList(),
                    //carouselController: controller.carouselController,
                    options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: true,
                      height: double.infinity,
                      viewportFraction: 1,
                    ),
                  ),
                ),
                // Positioned(
                //   bottom: 10,
                //   left: 0,
                //   right: 0,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: controller.bannerImageList.value!
                //         .asMap()
                //         .entries
                //         .map((entry) {
                //       return GestureDetector(
                //         onTap: () => controller.carouselController
                //             .animateToPage(entry.key),
                //         child: Container(
                //           width: controller.currentIndex == entry.key
                //               ? 17
                //               : 7,
                //           height: 7.0,
                //           margin: const EdgeInsets.symmetric(
                //             horizontal: 3.0,
                //           ),
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(10),
                //               color:
                //                   controller.currentIndex == entry.key
                //                       ? MyColors.mainTheme
                //                       : Colors.white),
                //         ),
                //       );
                //     }).toList(),
                //   ),
                // ),
              ],
            )

                // background: Image.asset(
                //   Assets.banner,
                //   fit: BoxFit.fill,
                // ),
                ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  SizedBox(
                    child: dashBoardGridView(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ///MainGridViewBuilder
  dashBoardGridView() {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dashBoardGrid.length,
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
                      builder: (builder) => dashBoardGridNavigation()[index]));
            },
            child: Card(
              elevation: 0,
              shape: dashBoardGrid[index].border,
              color: dashBoardGrid[index].color,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(dashBoardGrid[index].image, scale: 3),
                    const SizedBox(height: 20),
                    Text(
                      dashBoardGrid[index].text,
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

  ///MainGridViewBuilderListNavigation
  List dashBoardGridNavigation() => [
        const ProductScreen(),
        const MasterScreen(),
        const SalesScreen(),
        const PurchaseScreen(),
        const SettingScreen(),
      ];

  ///MainGridViewBuilderList
  List<DashBoardGrid> dashBoardGrid = [
    DashBoardGrid(
      image: Assets.dashProducts,
      text: 'Products',
      color: MyColors.lightGreen,
      border: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30.0),
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      )),
    ),
    DashBoardGrid(
        image: Assets.dashMaster,
        text: 'Master',
        color: MyColors.lightPurple,
        border: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ))),
    DashBoardGrid(
        image: Assets.dashSales,
        text: 'Sales',
        color: MyColors.lightYellow,
        border: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0),
        ))),
    DashBoardGrid(
        image: Assets.dashPurchase,
        text: 'Purchase',
        color: MyColors.lightBlue,
        border: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ))),
    DashBoardGrid(
        image: Assets.dashSettings,
        text: 'Settings',
        color: MyColors.lightBlue,
        border: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
            )))
  ];
}

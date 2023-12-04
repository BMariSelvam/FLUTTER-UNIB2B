import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_b2b/Const/font.dart';
import 'package:universal_b2b/Screens/Products/Brand%20Screen/Brand%20List%20Screen.dart';
import 'package:universal_b2b/Screens/Products/Category%20Screen/Category%20List%20Screen.dart';
import 'package:universal_b2b/Screens/Products/UOM%20Screen/UOM%20List%20Screen.dart';
import '../../Const/approute.dart';
import '../../Const/assets.dart';
import '../../Const/color.dart';
import '../../Widget/Constructors/constructors.dart';
import 'Subcategory Screen/Sub Category List Screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
            "Products",
            style: TextStyle(fontFamily: MyFont.myFont),
          ),
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
                    Get.toNamed(Routes.productListingPage);
                  },
                  child: Card(
                    elevation: 0,
                    color: MyColors.lightOrange,
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
                            "Products",
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
                child: SizedBox(child: productsGridView()),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: Container(
                  color: MyColors.lightPurple,
                  child: Center(
                    child: SizedBox(
                      height: 150,
                      child: productListView(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  ///MainGridViewBuilderListNavigation
  List dashBoardGridNavigation() => [
    const CategoryListScreen(),
    const BrandListScreen(),
    const SubCategoryListScreen(),
    const UOMListScreen(),
  ];
  ///ProductsPageGridView
  productsGridView() {
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
                      builder: (builder) => dashBoardGridNavigation()[index]));
            },
            child: Card(
              elevation: 0,
              shape: productsGrid[index].border,
              color: productsGrid[index].color,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(productsGrid[index].image, scale: 3),
                    const SizedBox(height: 20),
                    Text(
                      productsGrid[index].text,
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

  ///ProductsPageGridViewBuilderPage
  List<ProductsGrid> productsGrid = [
    ProductsGrid(
      image: Assets.category,
      text: 'Category',
      color: MyColors.lightGreen,
      border: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          )),
    ),
    ProductsGrid(
        image: Assets.brand,
        text: 'Brand',
        color: MyColors.lightPurple,
        border: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ))),
    ProductsGrid(
        image: Assets.subCategory,
        text: 'Sub Category',
        color: MyColors.lightYellow,
        border: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
            ))),
    ProductsGrid(
        image: Assets.uom,
        text: 'UOM',
        color: MyColors.lightBlue,
        border: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ))),
  ];

  ///productsHorizontalListView
  productListView() {
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

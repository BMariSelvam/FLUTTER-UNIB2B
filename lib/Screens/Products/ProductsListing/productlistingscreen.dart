import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universal_b2b/Const/color.dart';
import 'package:universal_b2b/Const/size.dart';
import 'package:universal_b2b/Screens/Products/ProductsListing/productlistingscreen_controller.dart';

import '../../../Const/approute.dart';
import '../../../Const/font.dart';
import '../../../Widget/Constructors/constructors.dart';
import '../../../Widget/submitbutton.dart';
import '../../../Widget/textformfield.dart';
import '../../../Widget/tooltip.dart';

class ProductListingPage extends StatefulWidget {
  const ProductListingPage({super.key});

  @override
  State<ProductListingPage> createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  List<ProductDetailList> originalProductList = [];
  String selectedFilter = "";
  bool isSearching=false;
  Offset _tapPosition = Offset.zero;
  late ProductListController controller;
  void _getTapPosition(TapDownDetails tapPosition) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(tapPosition
          .globalPosition); // store the tap positon in offset variable
      print(_tapPosition);
    });
  }
  void _showPopupMenu(BuildContext context, int index,) async {
   // final RenderBox cardRenderBox = cardKey.currentContext?.findRenderObject() as RenderBox;
   // final Offset cardPosition = cardRenderBox.localToGlobal(Offset.zero);
    final RenderObject? overlay =
    Overlay.of(context).context.findRenderObject();


    await showMenu(
      context: context,
      position: RelativeRect.fromRect(
          Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 100, 100),
          Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
              overlay.paintBounds.size.height)),
      items: [
        PopupMenuItem(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
            ),
            child: Text("Edit"),
          ),
          onTap: () {
            Get.toNamed(Routes.addProductsScreen);
          },
        ),
        PopupMenuItem(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
            ),
            child: Text("Delete"),
          ),
          onTap: () {
            // Handle delete action
          },
        ),
      ],
    );
  }
  @override
  void initState(){
    originalProductList = List.from(productListContent);
    //TODO:implement iniState
    super.initState();
    controller=Get.put(ProductListController());
  }

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
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                });
              },
              icon: const Icon(
                Icons.search,
              )),
          IconButton(
              onPressed: () {
                showFilterMenu();
              },
              icon: const Icon(
                Icons.filter_alt_outlined,
              )),
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.addProductsScreen);
              },
              icon: const Icon(
                Icons.add_circle_outline,
              ))
        ],
      ),
      body:Column(
        children: [
          if (isSearching)
            Padding(
              padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: controller.SearchController,
                    onChanged: (value) {
                      handleSearch();
                      },
                    hintText: "Search...",
                    hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                    textStyle: TextStyle(fontFamily: MyFont.myFont),
                    inputFormatters: [],
                  ),
                  SizedBox(height: 20,),
                  SubmitButton(
                      isLoading: false,
                      onTap: () {

                      },
                      title: "Search")
                ],
              ),
            ),
          Expanded(child:productList(),)
        ],
      )
    );
  }
  productList() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: productListContent.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTapDown:  (position) {
              _getTapPosition(position);
              _showPopupMenu(context, index,);
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Card(
                color: index.isOdd ? MyColors.lightBlue : MyColors.lightGreen,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productListContent[index].name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: MyFont.myFont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                productListContent[index].about,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: MyFont.myFont,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontSize: 16,
                                color: MyColors.primaryCustom,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "\$${productListContent[index].price}.00",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: MyFont.myFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: MyColors.primaryCustom,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  ///ListDetailForProductList
  List<ProductDetailList> productListContent = [
    ProductDetailList(
        name: 'SKU #625335',
        about: 'This is one of the best product',
        price: '100'),
    ProductDetailList(
        name: 'SKU #625336',
        about: 'This is one of the best product',
        price: '200'),
    ProductDetailList(
        name: 'SKU #625337',
        about: 'This is one of the best product',
        price: '300'),
    ProductDetailList(
        name: 'SKU #625337',
        about: 'This is one of the best product',
        price: '400'),
    ProductDetailList(
        name: 'SKU #625338',
        about: 'This is one of the best product',
        price: '500'),
    ProductDetailList(
        name: 'SKU #625339',
        about: 'This is one of the best product',
        price: '600'),
    ProductDetailList(
        name: 'SKU #625335',
        about: 'This is one of the best product',
        price: '700'),
    ProductDetailList(
        name: 'SKU #625335',
        about: 'This is one of the best product',
        price: '800'),
    ProductDetailList(
        name: 'SKU #625335',
        about: 'This is one of the best product',
        price: '900'),
    ProductDetailList(
        name: 'SKU #625335',
        about: 'This is one of the best product',
        price: '1000'),
    ProductDetailList(
        name: 'SKU #625335',
        about: 'This is one of the best product',
        price: '1100'),
    ProductDetailList(
        name: 'SKU #625335',
        about: 'This is one of the best product',
        price: '1200'),
    ProductDetailList(
        name: 'SKU #625335',
        about: 'This is one of the best product',
        price: '1300'),ProductDetailList(
        name: 'SKU #625335',
        about: 'This is one of the best product',
        price: '1400'),
  ];
  void showFilterMenu() {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 100, 0, 0),
      items: [
        PopupMenuItem(
          child: buildFilterMenuItem("A-Z"),
          value: "A-Z",
        ),
        PopupMenuItem(
          child: buildFilterMenuItem("Z-A"),
          value: "Z-A",
        ),
        PopupMenuItem(
          child: buildFilterMenuItem("Price Low to High"),
          value: "PriceLowToHigh",
        ),
        PopupMenuItem(
          child: buildFilterMenuItem("Price High to Low"),
          value: "PriceHighToLow",
        ),
      ],
      elevation: 10.0,
    ).then((value) {
      if (value != null) {
        handleFilterSelection(value);
      }
    });
  }

  PopupMenuItem<String> buildFilterMenuItem(String text) {
    return PopupMenuItem(
      value: text,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Radio(
            value: text,
            groupValue: selectedFilter,
            onChanged: (String? value) {
              if (value != null) {
                handleFilterSelection(value);
                Navigator.pop(context, value);
              }
            },
          ),
          Text(text),
        ],
      ),
    );
  }
  void handleFilterSelection(String value) {
    setState(() {
      selectedFilter = value;
    });

    // Implement the sorting logic based on the selected filter
    switch (value) {
      case "A-Z":
        productListContent.sort((a, b) => a.name.compareTo(b.name));
        break;
      case "Z-A":
        productListContent.sort((a, b) => b.name.compareTo(a.name));
        break;
      case "PriceLowToHigh":
        productListContent.sort((a, b) => int.parse(a.price).compareTo(int.parse(b.price)));
        break;
      case "PriceHighToLow":
        productListContent.sort((a, b) => int.parse(b.price).compareTo(int.parse(a.price)));
        break;
      default:
        break;
    }
  }
  void handleSearch() {
    String searchTerm = controller.SearchController.text.toLowerCase();

    if (searchTerm.isEmpty) {
      // If search term is empty, reset the product list to the full list
      setState(() {
        productListContent = originalProductList;
      });
    } else {
      // If there is a search term, filter the product list
      List<ProductDetailList> filteredList = originalProductList
          .where((product) =>
      product.name.toLowerCase().contains(searchTerm) ||
          product.about.toLowerCase().contains(searchTerm))
          .toList();

      setState(() {
        productListContent = filteredList;
      });
    }
  }


}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Const/assets.dart';
import '../../../Const/color.dart';
import '../../../Const/font.dart';
import '../../../Const/size.dart';
import '../../../Widget/Constructors/constructors.dart';

class ProductCatalogueScreen extends StatefulWidget {
  const ProductCatalogueScreen({super.key});

  @override
  State<ProductCatalogueScreen> createState() => _ProductCatalogueScreenState();
}

class _ProductCatalogueScreenState extends State<ProductCatalogueScreen> {
  int isSelected = 0;
  int issubSubSelected = 0;
  bool showAddButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: MyColors.mainTheme,
          iconTheme: const IconThemeData(color: MyColors.white),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: MyColors.white,
            ),
          ),
          title: Text(
            'Product Catalogue',
            style: TextStyle(
                fontFamily: MyFont.myFont,
                fontWeight: FontWeight.normal,
                color: MyColors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: PopupMenuButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      //side: const BorderSide(width: 2, color: Colors.black54)
                  ),
                  iconSize: 25,
                  padding: const EdgeInsets.all(1),
                  icon: const Icon(
                    Icons.download_for_offline_outlined,
                    color: MyColors.white,
                  ),
                  offset: const Offset(0, 30),
                  itemBuilder: (_) => <PopupMenuEntry>[
                  PopupMenuItem(
                  height: 20,
                  onTap: (){
                    setState(() {
                      showAddButton = true; // Set the flag to show the "Add" button
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        // Image.asset(IconAssets.editIcon),
                        SizedBox(
                          width: width(context) / 50,
                        ),

                        const Text(
                          'Request Quotation ',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                              color: MyColors.black),
                        ),

                      ]),
                    ],
                  )),
        const PopupMenuDivider(),
        PopupMenuItem(
          height: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image.asset(
                    // IconAssets.delete,
                    // scale: 1.2,
                    // ),
                    SizedBox(
                      width: width(context) / 50,
                    ),

                    const Text(
                      'Purchase Order',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                          color: MyColors.black),
                    ),
                  ]),
            ],
          ),
        ),],)
    ,
            ),
            // buildAppBarCartButton()
          ],
        ),
        body:Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                      height: height(context),
                      width: width(context) / 5.9,
                      // width: width(context) / 7,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            // Shadow color
                            spreadRadius: 5, // How much the shadow spreads
                            blurRadius: 10, // How blurry the shadow is
                            offset: Offset(0, 3), // Offset of the shadow
                          ),
                        ],
                      ),
                      child: subCategoryListView()),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child:  Column(
                      children: [
                        Container(
                          //color: MyColors.mainTheme,
                          height:height(context) / 1.25,
                          width: width(context) / 1.25,
                          child: Expanded(
                            child: isSelected == 0
    ? subProductWithBannerListView()
        : subCategoryProductListView(),),
                        ),
                      ],
                    ),
                  )


                ],
              ),
            ),
          ],
        )
    );
  }
  subCategoryListView() {
      return ListView.builder(
          itemCount: Subcategorylistcontent.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                setState(
                      () {
                    isSelected = index;
                  },
                );
              },
              child:Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    Container(
                      margin: isSelected == index
                          ? const EdgeInsets.symmetric(vertical: 10)
                          : const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        right: 5,
                        left: 5,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      decoration: isSelected == index
                          ? const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100),
                            bottomRight: Radius.circular(100)),
                        color: MyColors.lightBlue,
                      )
                          : BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: MyColors.lightBlue,
                      ),
                      height: 50,
                      width: 50,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: SizedBox(
                          child:  Image.asset(
                              Subcategorylistcontent[index].image,
                            height: height(context) / 200,
                            width: width(context) / 200,
                            fit: BoxFit.contain,
                          ),
                          //     Image.asset(
                          //   Assets.noImage,
                          //   height: height(context) / 200,
                          //   width: width(context) / 200,
                          //   fit: BoxFit.contain,
                          // ),
                        ),
                      ),
                    ),
                    Text(
                      Subcategorylistcontent[index].text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: MyFont.myFont,
                          fontWeight: FontWeight.w500,
                          color: MyColors.black),
                    ),
                  ],
                ),
              ),
                // Your widget that depends on observable variables goes here
                // For example, you might want to conditionally change the text style
                // based on the isSelected variable.


            );
          });

  }
  List<SupplierGrid> Subcategorylistcontent = [
    SupplierGrid(
      image: Assets.mango,
      text: 'Season Fruits',
    ),
    SupplierGrid(
      image: Assets.onion,
      text: 'fresh vegatables',
    ),
    SupplierGrid(
      image: Assets.beens,
      text: 'Beens',
    ),
    SupplierGrid(
      image: Assets.cupoffruit,
      text: 'Leafy Harbs',
    ),
    SupplierGrid(
      image: Assets.leaf,
      text: 'Cuts&Sprouts',
    ),
    SupplierGrid(
      image: Assets.tomato,
      text: 'Organics & Hydrops',
    ),
    SupplierGrid(
      image: Assets.graphs,
      text: 'Premium',
    ),
    SupplierGrid(
      image: Assets.flower,
      text: 'Flowers & Leaves',
    ),SupplierGrid(
      image: Assets.cupofveg,
      text: 'Combo Pack',
    ),
  ];
  subCategoryProductListView() {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 205
              // childAspectRatio: 0.64,
            ),
            itemCount: Subcategorylistcontent.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return SizedBox(
                width: width(context) / 2.4,
                child:  Card(
                    elevation: 5,
                    surfaceTintColor: MyColors.white  ,
                    shadowColor: MyColors.white,
                    child: Column(
                      children: [
                        // Row(
                        //   mainAxisAlignment:
                        //   MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Container(
                        //       alignment: Alignment.topLeft,
                        //       decoration: const BoxDecoration(
                        //           color: Colors.green,
                        //           borderRadius: BorderRadius.only(
                        //               topLeft: Radius.circular(5),
                        //               bottomRight: Radius.circular(5))),
                        //       child: Padding(
                        //         padding: const EdgeInsets.symmetric(
                        //             horizontal: 10, vertical: 5),
                        //         child: Text(
                        //           "30 % Off",
                        //           style: TextStyle(
                        //             fontFamily: MyFont.myFont,
                        //             fontWeight: FontWeight.bold,
                        //             color: MyColors.white,
                        //             fontSize: 12,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     Container(
                        //       padding: const EdgeInsets.symmetric(
                        //         horizontal: 10,
                        //       ),
                        //       child: GestureDetector(
                        //         onTap: () {
                        //
                        //         },
                        //         child: Icon(
                        //           Icons.favorite_outline_rounded,
                        //           color: Colors.red,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(height: 30),
                        GestureDetector(
                            onTap: () {
                            },
                            child: SizedBox(
                              child:  Image.asset(
                                Subcategorylistcontent[index].image,
                                height: 88,
                                width: 120,
                                // height: height(context) / 9,
                                // width: width(context) / 5,
                              )
                            )),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                          child: Text(
                            Subcategorylistcontent[index].text,
                            textAlign: TextAlign.center,maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: MyFont.myFont,
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        // Container(
                        //   padding: const EdgeInsets.fromLTRB(5, 0, 10, 3),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text(
                        //         (controller.productList.value?[index].weight)
                        //                 ?.toStringAsFixed(0) ??
                        //             "",
                        //         style: TextStyle(
                        //           fontFamily: MyFont.myFont,
                        //           fontWeight: FontWeight.bold,
                        //           color: MyColors.grey,
                        //           fontSize: 10,
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                                  child: Text(
                                    "100kg",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: MyFont.myFont,
                                      fontWeight: FontWeight.w800,
                                      color: MyColors.darkGrey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ],
                        )
                      ],
                    )),

              );
            },
          ),
        ),
      ],
    );
  }
  subProductWithBannerListView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            // Your banner image goes here
            height: 150, // Adjust the height as needed
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.categorybanner), // Replace with your banner image
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Expanded(
          child: subCategoryProductListView(),
        ),
      ],
    );
  }
}

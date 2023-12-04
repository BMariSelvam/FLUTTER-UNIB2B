import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:universal_b2b/Const/assets.dart';
import 'package:universal_b2b/Const/color.dart';
import 'package:universal_b2b/Const/font.dart';
import 'package:universal_b2b/Const/size.dart';
import 'package:universal_b2b/Widget/Constructors/constructors.dart';

class TotalOrderDetails extends StatefulWidget {
  const TotalOrderDetails({Key? key}) : super(key: key);

  @override
  State<TotalOrderDetails> createState() => _TotalOrderDetailsState();
}

class _TotalOrderDetailsState extends State<TotalOrderDetails> {
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
          "Orders",
          style: TextStyle(
            fontFamily: MyFont.myFont,
            color: MyColors.white,
          ),
        ),actions: [IconButton(onPressed: (){
        // setState(() {
        //   isSearching = !isSearching;
        // });
      }, icon: const Icon(Icons.search_sharp,color: MyColors.white,size: 28,))],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 30, 18, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // isSearching ?
            // Padding(
            //   padding: EdgeInsets.fromLTRB(18, 18, 18, 10),
            //   child: Column(
            //     children: [
            //       CustomTextFormField(
            //         controller: controller.searchController,
            //         hintText: "Search...",
            //         onChanged: (value) {
            //
            //         },
            //         hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
            //         textStyle: TextStyle(fontFamily: MyFont.myFont),
            //         inputFormatters: [],
            //       ),
            //       const SizedBox(height: 10,),
            //       Row(
            //         children: [
            //           Expanded(
            //             child: CustomTextFormField(
            //               readOnly: true,
            //               controller: controller.fromDateController,
            //               hintText: "From Date",
            //               hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
            //               textStyle: TextStyle(fontFamily: MyFont.myFont),
            //               inputFormatters: [],
            //               suffixIcon: IconButton(onPressed: (){
            //                 selectFromDate();
            //               },icon:Icon(Icons.calendar_month,) ),
            //             ),
            //           ),
            //           const SizedBox(width: 12,),
            //           Expanded(
            //             child: CustomTextFormField(
            //               readOnly: true,
            //               controller: controller.toDateController,
            //               hintText: "To Date",
            //               hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
            //               textStyle: TextStyle(fontFamily: MyFont.myFont),
            //               inputFormatters: [],
            //               suffixIcon: IconButton(onPressed: (){
            //                 selectToDate();
            //               },icon:Icon(Icons.calendar_month,) ),
            //             ),
            //           ),
            //         ],
            //       ),
            //       SizedBox(height: 10,),
            //       SubmitButton(
            //           isLoading: false,
            //           onTap: () {},
            //           title: "Search")
            //     ],
            //   ),
            // ) : const SizedBox(),
            orderList()
            ],
        ),
      ),
    );
  }
  orderList() {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: CategoryListContent.length,
        itemBuilder: (context, index) {
          InvoiceList currentItem = CategoryListContent[index];
          return GestureDetector(
            onTapDown:  (position) {
              //_getTapPosition(position);
              // _showPopupMenu(context, index,);
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Card(
                color: MyColors.lightGray,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 85,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                          image: AssetImage(Assets.CategoryList),
                                          fit: BoxFit.cover
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: 25,
                                        color: Colors.black.withOpacity(0.5),
                                        child: Row(
                                          children: [
                                            IconButton(alignment: Alignment.topCenter,padding: EdgeInsets.zero,
                                              icon: const Icon(Icons.zoom_in,color: Colors.white,),
                                              onPressed: () {
                                                // Show the image in a popup when the zoom button is clicked
                                                _showImagePopup(context);
                                              },
                                            ),
                                            Text("Zoom",style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: MyFont.myFont
                                            ),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                            ),
                            SizedBox(width: 15,),
                            Flexible(flex: 2,
                              child: SizedBox(
                                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(alignment: Alignment.centerRight,
                                      child: PopupMenuButton(
                                        child: Container(
                                          height: 25,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            //borderRadius: BorderRadius.circular(20.0),
                                            color:Colors.white,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("Qty.4",style: TextStyle(
                                                    fontFamily: MyFont.myFont,
                                                    fontWeight: FontWeight.bold,
                                                    //color: Colors.green,
                                                    fontSize: 14,
                                                  ),),
                                                  Icon(Icons.keyboard_arrow_down_sharp)
                                                ],),
                                            ),
                                          ),
                                        ),
                                        //color: MyColors.white24,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          //side: const BorderSide(width: 2, color: Colors.black54)
                                        ),
                                        //iconSize: 20,
                                        //padding: const EdgeInsets.all(1),
                                        offset: const Offset(0, 30),
                                        itemBuilder: (_) => <PopupMenuEntry>[
                                          PopupMenuItem(
                                              height: 20,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        // Image.asset(IconAssets.editIcon),
                                                        SizedBox(
                                                          width: width(context) / 50,
                                                        ),
                                                        Text('Open ',
                                                          style: TextStyle(

                                                              fontSize: 15,
                                                              color: MyColors.black),
                                                        )]),
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
                                                      SizedBox(
                                                        width: width(context) / 50,
                                                      ),

                                                      const Text(
                                                        'Pending',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: MyColors.black),
                                                      ),
                                                    ]),
                                              ],
                                            ),
                                          ),
                                          const PopupMenuDivider(),
                                          PopupMenuItem(
                                              height: 20,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        // Image.asset(IconAssets.editIcon),
                                                        SizedBox(
                                                          width: width(context) / 50,
                                                        ),
                                                        Text('In Progress',
                                                          style: TextStyle(

                                                              fontSize: 15,
                                                              color: MyColors.black),
                                                        )]),
                                                ],
                                              )),

                                        ],
                                      ),
                                    ),
                                    Text(
                                      CategoryListContent[index].name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: MyFont.myFont,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          CategoryListContent[index].offer,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: MyColors.mainTheme,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: MyFont.myFont,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "\$50.00", // Original Price
                                          style: TextStyle(
                                            // color: MyColors.mainTheme,
                                            fontFamily: MyFont.myFont,
                                            fontSize: 14,
                                            // Adjust the text color as needed
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "\$10.00", // Original Price
                                          style: TextStyle(
                                            //color: MyColors.mainTheme,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: MyFont.myFont,
                                            fontSize: 14,
                                            // Adjust the text color as needed
                                            //decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        RatingBar.builder(
                                          initialRating: currentItem.rating,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 20,
                                          itemBuilder: (context, _) => const Icon(
                                            Icons.star,
                                            color:MyColors.mainTheme,
                                          ),
                                          onRatingUpdate: (rating) {
                                            setState(() {
                                              currentItem.rating = rating;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10,),

                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 15,),
                          ],
                        ),
                        SizedBox(height: 10,),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  void _showImagePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 300,
            child: PhotoViewGallery.builder(
              itemCount: 1,
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: AssetImage(Assets.CategoryList),
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  maxScale: PhotoViewComputedScale.covered * 2,
                );
              },
              scrollPhysics: BouncingScrollPhysics(),
              backgroundDecoration: BoxDecoration(
                color: Colors.transparent,
              ),
              pageController: PageController(),
            ),
          ),
        );
      },
    );
  }
  List<InvoiceList> CategoryListContent = [
    InvoiceList(
        name: 'Onion',
        image: Assets.productBanner,
        description: 'This is Our New Product',
        rating: 3.8, offer: '40% OFF',
        offertext: '1 Coupon&Offers Applied>'),
    InvoiceList(
        name: 'Tomato',
        image: Assets.productBanner,
        description: 'This is Our New Product',
        rating: 3.8,
        offertext: '1 Coupon&Offers Applied>',
        offer: '40% OFF'),
    InvoiceList(
        name: 'Beans',
        image: Assets.productBanner,
        description: 'This is Our New Product',
        offertext: '1 Coupon&Offers Applied>',
        rating: 3.8,
        offer: '40% OFF'),

  ];
}

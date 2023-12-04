import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../../Const/assets.dart';
import '../../../Const/color.dart';
import '../../../Const/font.dart';
import '../../../Const/size.dart';
import '../../../Widget/Constructors/constructors.dart';
import '../../../Widget/submitbutton.dart';
import '../../../Widget/textformfield.dart';
import 'Add SalesInvoice Controller.dart';

class AddSalesInvoiceScreen extends StatefulWidget {
  const AddSalesInvoiceScreen({Key? key}) : super(key: key);

  @override
  State<AddSalesInvoiceScreen> createState() => _AddSalesInvoiceScreenState();
}

class _AddSalesInvoiceScreenState extends State<AddSalesInvoiceScreen> {
  late AddSalesInvoiceScreenController controller;
  @override
  void initState(){
    super.initState();
    controller=Get.put(AddSalesInvoiceScreenController());
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
            "Add Sales Invoice",
            style: TextStyle(fontFamily: MyFont.myFont),
          ),
        ),
        body: ListView(
          children: [
            Expanded(
              child: SingleChildScrollView(
                // physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      controller: controller.invoicecontroller,
                      hintText: "IN Number",
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
                    CategoryList(),
                    const SizedBox(height: 20,),
                    remarkAndTotal()
                  ],
                ),
              ),
            ),
          ],
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
                      // Get.to(() => SuccessfulScreen(
                      //     text: "Quatation Updated Successfully",
                      //     onTap: () {},
                      //     buttonText: "Go To Dashboard"));
                    },
                    title: "Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  CategoryList() {
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
                                    height: 70,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(Assets.CategoryList),
                                          fit: BoxFit.cover
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: 25,
                                        color: Colors.black.withOpacity(0.5),
                                        child: Expanded(
                                          child: Row(
                                            children: [
                                              IconButton(
                                                icon: Icon(Icons.zoom_in,color: Colors.white,),
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
                                  ),
                                  SizedBox(height: 10,),
                                  PopupMenuButton(
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
                                            mainAxisAlignment: MainAxisAlignment.center,
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
                                ],
                              ),
                            ),
                            SizedBox(width: 15,),
                            Flexible(
                              child: SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        RatingBar.builder(
                                          initialRating: currentItem.rating,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 20,
                                          itemBuilder: (context, _) => Icon(
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
                                    Text(
                                      CategoryListContent[index].offertext,
                                      maxLines: 1,
                                      //overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: MyFont.myFont,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: MyColors.mainTheme
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 15,),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.delete_outline,color: MyColors.mainTheme,),
                                      Text("Remove",
                                        style: TextStyle(
                                            color: MyColors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: MyFont.myFont,
                                            fontSize: 14
                                        ),),
                                    ],
                                  ),
                                )),
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.save_alt,color: MyColors.mainTheme,),
                                      Text("Save for Later",
                                        style: TextStyle(
                                            color: MyColors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: MyFont.myFont,
                                            fontSize: 14
                                        ),),
                                    ],
                                  ),
                                )),
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.shopping_bag,color: MyColors.mainTheme,),
                                      Text("Buy this Now",
                                        style: TextStyle(
                                            color: MyColors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: MyFont.myFont,
                                            fontSize: 14
                                        ),),
                                    ],
                                  ),
                                )),

                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
  List<InvoiceList> CategoryListContent = [
    InvoiceList(
        name: 'Pushparaj',
        image: Assets.productBanner,
        description: 'This is Our New Product',
        rating: 3.8, offer: '40% OFF',
        offertext: '1 Coupon&Offers Applied>'),
    InvoiceList(
        name: 'Pushparaj',
        image: Assets.productBanner,
        description: 'This is Our New Product',
        rating: 3.8,
        offertext: '1 Coupon&Offers Applied>',
        offer: '40% OFF'),
    InvoiceList(
        name: 'Pushparaj',
        image: Assets.productBanner,
        description: 'This is Our New Product',
        offertext: '1 Coupon&Offers Applied>',
        rating: 3.8,
        offer: '40% OFF'),

  ];
  remarkAndTotal() {
    return Row(
      children: [
        Expanded(
            child: Container(
              height: height(context) / 5,
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
                        '',
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
              height: height(context) / 5,
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
                            child: Text('Total',
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
                            child: Text('Discount',
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
                      Container(
                        decoration: BoxDecoration(
                          color: MyColors.mainTheme,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('150.00',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: MyFont.myFont,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
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
                            child: Text('Sub Total',
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
                            child: Text('Net Total',
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
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../Const/assets.dart';
import '../../../../../Const/color.dart';
import '../../../../../Const/font.dart';
import '../../../../../Const/size.dart';
import '../../../../../Widget/Constructors/constructors.dart';
import '../../../../../Widget/submitbutton.dart';
import '../../../../../Widget/textformfield.dart';
import 'FrequentOdrerScreen Controller.dart';

class FrequentOrderScreen extends StatefulWidget {
  const FrequentOrderScreen({super.key});

  @override
  State<FrequentOrderScreen> createState() => _FrequentOrderScreenState();
}

class _FrequentOrderScreenState extends State<FrequentOrderScreen> {
  DateTime? fromDate;
  DateTime? toDate;
  bool isSearching=false;
  String selectedFilter = "";
  List<QuatationDetailList> originalProductList = [];
  late ApprovedCustomerFrequentOrderController controller;
  @override
  void initState(){
    super.initState();
    controller=Get.put(ApprovedCustomerFrequentOrderController());
    //originalProductList = List.from(QuatationListContent);
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
            "Frequent Order",
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
            // IconButton(
            //     onPressed: () {
            //
            //     },
            //     icon: const Icon(
            //       Icons.filter_alt_outlined,
            //     )),
            // IconButton(
            //     onPressed: () {
            //       Get.toNamed(Routes.addinvoicescreen);
            //     },
            //     icon: const Icon(
            //       Icons.add_circle_outline,
            //     ))
          ],
        ),
        body: Column(
          children: [
            if (isSearching)
              Padding(
                padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: controller.SearchController,
                      hintText: "Search...",
                      onChanged: (value) {
                       // handleSearch();
                      },
                      hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                      textStyle: TextStyle(fontFamily: MyFont.myFont),
                      inputFormatters: [],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            controller: controller.FromDateController,
                            hintText: "From Date",
                            hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                            textStyle: TextStyle(fontFamily: MyFont.myFont),
                            inputFormatters: [],
                            suffixIcon: IconButton(onPressed: (){
                              selectToDate();
                            },icon:Icon(Icons.calendar_month,) ),
                          ),
                        ),
                        const SizedBox(width: 12,),
                        Expanded(
                          child: CustomTextFormField(
                            controller: controller.ToDateController,
                            hintText: "To Date",
                            hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                            textStyle: TextStyle(fontFamily: MyFont.myFont),
                            inputFormatters: [],
                            suffixIcon: IconButton(onPressed: (){
                              selectToDate();
                            },icon:Icon(Icons.calendar_month,) ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    SubmitButton(
                        isLoading: false,
                        onTap: () {},
                        title: "Search")
                  ],
                ),
              ),
            Expanded(child:Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
                  child: Container(
                    height: height(context)/2.5,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Frequent Order Report",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: MyFont.myFont,
                              fontSize: 18
                            ),),
                            Text("2021-2022",style: TextStyle(
                                color: MyColors.darkGrey,
                                fontFamily: MyFont.myFont,
                                fontSize: 14
                            ),)
                          ],
                        ),
                        SizedBox(height: height(context)/40,),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text:  TextSpan(
                                    children: [
                                      const WidgetSpan(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Icon(
                                            Icons.circle,
                                            size: 15,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Onion',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontFamily: MyFont.myFont,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text:  TextSpan(
                                    children: [
                                      const WidgetSpan(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Icon(
                                            Icons.circle,
                                            size: 15,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Tomato',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontFamily: MyFont.myFont,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text:   TextSpan(
                                    children: [
                                      const WidgetSpan(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Icon(
                                            Icons.circle,
                                            size: 15,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Milk',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontFamily: MyFont.myFont,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height(context)/50,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text:  TextSpan(
                                    children: [
                                      const WidgetSpan(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Icon(
                                            Icons.circle,
                                            size: 15,
                                            color: Colors.orange,
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Egg',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontFamily: MyFont.myFont,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text:  TextSpan(
                                    children: [
                                      const WidgetSpan(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Icon(
                                            Icons.circle,
                                            size: 15,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Biscuit',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontFamily: MyFont.myFont,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      const WidgetSpan(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Icon(
                                            Icons.circle,
                                            size: 15,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Fruits',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontFamily: MyFont.myFont,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: height(context)/40,),
                        Image(image: AssetImage(Assets.graph))
                      ],
                    ),
                  ),
                ),
                Expanded(child: subCategoryProductListView(),)

              ],
            ),)
          ],
        )
    );
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              //physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
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
                                    alignment: Alignment.bottomCenter,
                                    padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                                    child: Text(
                                      "100 g",
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
        ),
      ],
    );
  }


  Future<void> selectFromDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: fromDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate:  DateTime.now(),
    );

    if (picked != null && picked != fromDate) {
      setState(() {
        fromDate = picked;
        controller.FromDateController.text=_formatDate(picked);
      });
    }
  }

  Future<void> selectToDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: toDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate:  DateTime.now(),
    );

    if (picked != null && picked != toDate) {
      setState(() {
        toDate = picked;
        controller.ToDateController.text=_formatDate(picked);
      });
    }
  }
  String _formatDate(DateTime date) {
    // Customize the date format as needed
    return "${date.day}-${date.month}-${date.year}";
  }
}

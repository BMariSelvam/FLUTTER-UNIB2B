import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Const/approute.dart';
import '../../../Const/color.dart';
import '../../../Const/font.dart';
import '../../../Const/size.dart';
import '../../../Widget/Constructors/constructors.dart';
import '../../../Widget/submitbutton.dart';
import '../../../Widget/textformfield.dart';
import 'Sales Invoicescreen Controller.dart';
class SalesInvoiceScreen extends StatefulWidget {
  const SalesInvoiceScreen({Key? key}) : super(key: key);

  @override
  State<SalesInvoiceScreen> createState() => _SalesInvoiceScreenState();
}

class _SalesInvoiceScreenState extends State<SalesInvoiceScreen> {
  bool isSearching=false;
  String selectedFilter = "";
  late SalesInvoiceListController controller;
  @override
  void initState(){
    super.initState();
    controller=Get.put(SalesInvoiceListController());
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
            "Sales Invoice",
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
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.addsalesinvoivescreen);
                },
                icon: const Icon(
                  Icons.add_circle_outline,
                ))
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
                        //handleSearch();
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
                            suffixIcon: IconButton(onPressed: (){},icon:Icon(Icons.calendar_month,) ),
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
                            suffixIcon: IconButton(onPressed: (){},icon:Icon(Icons.calendar_month,) ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    CustomTextFormField(
                      controller: controller.StatusController,
                      hintText: "Status",
                      hintTextStyle: TextStyle(fontFamily: MyFont.myFont,fontWeight: FontWeight.bold),
                      textStyle: TextStyle(fontFamily: MyFont.myFont),
                      inputFormatters: [],
                      // textAlign: TextAlign.left, // Align the hint text to the left
                      // decoration: InputDecoration(
                      //   contentPadding: EdgeInsets.symmetric(horizontal: 10), // Adjust padding if needed
                      //),
                    ),
                    SizedBox(height: 10,),
                    SubmitButton(
                        isLoading: false,
                        onTap: () {},
                        title: "Search")
                  ],
                ),
              ),
            Expanded(child:QuatationList(),)
          ],
        )
    );
  }
  QuatationList() {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: QuatationListContent.length,
          itemBuilder: (context, index) {
            return Builder(
                builder: (context) {
                  return GestureDetector(
                    onTapDown:  (position) {
                      //_getTapPosition(position);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Card(
                        color: index.isOdd ? MyColors.lightBlue : MyColors.lightGreen,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: SizedBox(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        QuatationListContent[index].name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: MyFont.myFont,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        QuatationListContent[index].code,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: MyFont.myFont,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      Text(
                                        QuatationListContent[index].date,
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
                              //const SizedBox(width: 10,),
                              Flexible(child: Column(children: [
                                PopupMenuButton(
                                  child: Container(
                                    height: 25,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color:MyColors.lightGreen,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Received",style: TextStyle(
                                              fontFamily: MyFont.myFont,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green,
                                              fontSize: 16,
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
                                const SizedBox(height: 10,),
                                PopupMenuButton(
                                  child: Container(
                                    height: 25,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color:Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Action",style: TextStyle(
                                            fontFamily: MyFont.myFont,
                                            fontWeight: FontWeight.bold,
                                            color: MyColors.mainTheme,
                                            fontSize: 16,
                                          ),),
                                          Icon(Icons.keyboard_arrow_down_sharp)
                                        ],),
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
                                                  Text('Edit ',
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
                                                  'Delete',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: MyColors.black),
                                                ),
                                              ]),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
            );
          }),
    );
  }
  ///ListDetailForProductList
  List<QuatationDetailList> QuatationListContent = [
    QuatationDetailList(
        name: 'Pushparaj',
        code: 'INV.No #625335',
        date: 'May 21,2019,3.30pm'),
    QuatationDetailList(
        name: 'Pushparaj',
        code: 'INV.No #625335',
        date: 'May 21,2019,3.30pm'),
    QuatationDetailList(
        name: 'Pushparaj',
        code: 'INV.No #625335',
        date: 'May 21,2019,3.30pm'),
    QuatationDetailList(
        name: 'Pushparaj',
        code: 'INV.No #625335',
        date: 'May 21,2019,3.30pm'),
    QuatationDetailList(
        name: 'Pushparaj',
        code: 'INV.No #625335',
        date: 'May 21,2019,3.30pm'),
    QuatationDetailList(
        name: 'Pushparaj',
        code: 'INV.No #625335',
        date: 'May 21,2019,3.30pm'),
    QuatationDetailList(
        name: 'Pushparaj',
        code: 'INV.No #625335',
        date: 'May 21,2019,3.30pm'),
    QuatationDetailList(
        name: 'Pushparaj',
        code: 'INV.No #625335',
        date: 'May 21,2019,3.30pm'),
    QuatationDetailList(
        name: 'Pushparaj',
        code: 'INV.No #625335',
        date: 'May 21,2019,3.30pm'),
    QuatationDetailList(
        name: 'Pushparaj',
        code: 'INV.No #625335',
        date: 'May 21,2019,3.30pm'),




  ];
}

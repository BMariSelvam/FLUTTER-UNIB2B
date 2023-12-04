import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universal_b2b/Screens/Sales/Receipt/Sales%20Receipt%20Screen%20Controller.dart';

import '../../../Const/color.dart';
import '../../../Const/font.dart';
import '../../../Const/size.dart';
import '../../../Widget/Constructors/constructors.dart';
import '../../../Widget/submitbutton.dart';
import '../../../Widget/textformfield.dart';

class SalesReceiptScreen extends StatefulWidget {
  const SalesReceiptScreen({Key? key}) : super(key: key);

  @override
  State<SalesReceiptScreen> createState() => _SalesReceiptScreenState();
}

class _SalesReceiptScreenState extends State<SalesReceiptScreen> {
  DateTime? fromDate;
  DateTime? toDate;
  String selectedFilter = "";
  bool isSearching=false;
  Offset _tapPosition = Offset.zero;
  late SalesReceiptListController controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
            child: Text("View"),
          ),
          onTap: () {
            //Get.toNamed(Routes.addProductsScreen);
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
    super.initState();
    controller=Get.put(SalesReceiptListController());
  }
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
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          title: Text(
            "Receipt",
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
            // IconButton(
            //     onPressed: () {
            //       //Get.toNamed(Routes.addquatationscreen);
            //     },
            //     icon: const Icon(
            //       Icons.add_circle_outline,
            //     ))
          ],
        ),
        body: Form(
          child: Column(
            children: [
              if (isSearching)
                Padding(
                  padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: controller.SearchController,
                        hintText: "Search...",
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
                                selectFromDate();
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
              Expanded(child:PurchaseReturnList(),)
            ],
          ),
        )
    );
  }
  PurchaseReturnList() {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: PurchaseReturnListContent.length,
          itemBuilder: (context, index) {
            return Builder(
                builder: (context) {
                  return GestureDetector(
                    onTapDown:  (position) {
                      // _getTapPosition(position);
                      // _showPopupMenu(context, index,);

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
                                        PurchaseReturnListContent[index].name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: MyFont.myFont,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      Text(
                                        PurchaseReturnListContent[index].date,
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
                                      "Net Total",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: MyFont.myFont,
                                          fontSize: 16,
                                          color: MyColors.black,
                                          fontWeight: FontWeight.bold

                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "\$${PurchaseReturnListContent[index].price}.00",
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
                              )
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
  List<PurchaseReturnDetailList>PurchaseReturnListContent = [
    PurchaseReturnDetailList(
        name: 'Order.No #625335',
        price: '100',
        date: 'May 21,2019,3.30pm'),
    PurchaseReturnDetailList(
        name: 'Order.No #625335',
        price: '100',
        date: 'May 21,2019,3.30pm'),
    PurchaseReturnDetailList(
        name: 'Order.No #625336',
        price: '200',
        date: 'May 21,2019,3.30pm'),
    PurchaseReturnDetailList(
        name: 'Order.No #625337',
        price: '300',
        date: 'May 21,2019,3.30pm'),
    PurchaseReturnDetailList(
        name: 'Order.No #625338',
        price: '400',
        date: 'May 21,2019,3.30pm'),
    PurchaseReturnDetailList(
        name: 'Order.No #625339',
        price: '500',
        date: 'May 21,2019,3.30pm'),
    PurchaseReturnDetailList(
        name: 'Order.No #625340',
        price: '600',
        date: 'May 21,2019,3.30pm'),
    PurchaseReturnDetailList(
        name: 'Order.No #625341',
        price: '700',
        date: 'May 21,2019,3.30pm'),
    PurchaseReturnDetailList(
        name: 'Order.No #625342',
        price: '800',
        date: 'May 21,2019,3.30pm'),
    PurchaseReturnDetailList(
        name: 'Order.No #625343',
        price: '900',
        date: 'May 21,2019,3.30pm'),
    PurchaseReturnDetailList(
        name: 'Order.No #625344',
        price: '1000',
        date: 'May 21,2019,3.30pm'),
    PurchaseReturnDetailList(
        name: 'Order.No #625345',
        price: '1100',
        date: 'May 21,2019,3.30pm'),
  ];
  void handleFilterSelection(String value) {
    setState(() {
      selectedFilter = value;
    });

    // Implement the sorting logic based on the selected filter
    switch (value) {
      case "A-Z":
        PurchaseReturnListContent.sort((a, b) => a.name.compareTo(b.name));
        break;
      case "Z-A":
        PurchaseReturnListContent.sort((a, b) => b.name.compareTo(a.name));
        break;
      case "PriceLowToHigh":
        PurchaseReturnListContent.sort((a, b) => int.parse(a.price).compareTo(int.parse(b.price)));
        break;
      case "PriceHighToLow":
        PurchaseReturnListContent.sort((a, b) => int.parse(b.price).compareTo(int.parse(a.price)));
        break;
      default:
        break;
    }
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

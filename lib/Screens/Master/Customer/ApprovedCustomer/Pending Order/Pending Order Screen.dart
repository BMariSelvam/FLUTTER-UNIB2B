import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universal_b2b/Screens/Master/Customer/ApprovedCustomer/Pending%20Order/Pending%20Orderscreen%20Controller.dart';

import '../../../../../Const/approute.dart';
import '../../../../../Const/color.dart';
import '../../../../../Const/font.dart';
import '../../../../../Widget/Constructors/constructors.dart';
import '../../../../../Widget/submitbutton.dart';
import '../../../../../Widget/textformfield.dart';
class PendingOrderScreen extends StatefulWidget {
  const PendingOrderScreen({super.key});

  @override
  State<PendingOrderScreen> createState() => _PendingOrderScreenState();
}

class _PendingOrderScreenState extends State<PendingOrderScreen> {
  late PendingOrdersController controller;
  DateTime? fromDate;
  DateTime? toDate;
  String selectedFilter = "";
  bool isSearching=false;

  @override
  void initState() {
    super.initState();
    controller = Get.put(PendingOrdersController());
  }
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
          "Pending Orders",
          style: TextStyle(
            fontFamily: MyFont.myFont,
            color: MyColors.white,
          ),
        ),actions: [IconButton(onPressed: (){
        setState(() {
          isSearching = !isSearching;
        });
      }, icon: const Icon(Icons.search_sharp,color: MyColors.white,size: 28,))],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isSearching ?
            Padding(
              padding: EdgeInsets.fromLTRB(18, 18, 18, 10),
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: controller.searchController,
                    hintText: "Search...",
                    onChanged: (value) {

                    },
                    hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                    textStyle: TextStyle(fontFamily: MyFont.myFont),
                    inputFormatters: [],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          readOnly: true,
                          controller: controller.fromDateController,
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
                          readOnly: true,
                          controller: controller.toDateController,
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
            ) : const SizedBox(),
            paidList()],
        ),
      ),
    );
  }
  paidList() {
    return ListView.builder(
      // padding: const EdgeInsets.only(top: 1),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: productListContent.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.toNamed(Routes.pendingOrderDetailsScreen);
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            "\$${productListContent[index].price}.00",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: MyFont.myFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
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
        controller.fromDateController.text=_formatDate(picked);
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
        controller.toDateController.text=_formatDate(picked);
      });
    }
  }

  String _formatDate(DateTime date) {
    // Customize the date format as needed
    return "${date.day}-${date.month}-${date.year}";
  }

  List<ProductDetailList> productListContent = [
    ProductDetailList(
        name: 'Order.No #8744334', about: 'Mar 21, 2019, 3:30pm', price: '100'),
    ProductDetailList(
        name: 'Order.No #8744335', about: 'Mar 21, 2019, 3:30pm', price: '200'),
    ProductDetailList(
        name: 'Order.No #8744336', about: 'Mar 21, 2019, 3:30pm', price: '300'),
    ProductDetailList(
        name: 'Order.No #8744337', about: 'Mar 21, 2019, 3:30pm', price: '400'),
    ProductDetailList(
        name: 'Order.No #8744338', about: 'Mar 21, 2019, 3:30pm', price: '500'),
    ProductDetailList(
        name: 'Order.No #8744339', about: 'Mar 21, 2019, 3:30pm', price: '600'),
    ProductDetailList(
        name: 'Order.No #8744340', about: 'Mar 21, 2019, 3:30pm', price: '700'),
    ProductDetailList(
        name: 'Order.No #8744341', about: 'Mar 21, 2019, 3:30pm', price: '800'),
    ProductDetailList(
        name: 'Order.No #8744342', about: 'Mar 21, 2019, 3:30pm', price: '900'),
    ProductDetailList(
        name: 'Order.No #8744343',
        about: 'Mar 21, 2019, 3:30pm',
        price: '1000'),
    ProductDetailList(
        name: 'Order.No #8744344',
        about: 'Mar 21, 2019, 3:30pm',
        price: '1100'),
    ProductDetailList(
        name: 'Order.No #8744345',
        about: 'Mar 21, 2019, 3:30pm',
        price: '1200'),
    ProductDetailList(
        name: 'Order.No #8744346',
        about: 'Mar 21, 2019, 3:30pm',
        price: '1300'),
    ProductDetailList(
        name: 'Order.No #8744347',
        about: 'Mar 21, 2019, 3:30pm',
        price: '1400'),
  ];
}

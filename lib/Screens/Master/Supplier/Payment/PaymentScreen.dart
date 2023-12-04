import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_b2b/Const/approute.dart';
import 'package:universal_b2b/Const/color.dart';
import 'package:universal_b2b/Const/font.dart';
import 'package:universal_b2b/Screens/Master/Supplier/Payment/PaymentController.dart';
import 'package:universal_b2b/Widget/Constructors/constructors.dart';
import 'package:universal_b2b/Widget/submitbutton.dart';
import 'package:universal_b2b/Widget/textformfield.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {
  List<ProductDetailList> originalProductList = [];

  late PaymentController controller;

  bool isChecked = false;
  bool showCheckBox = false;
  String selectedFilter = "";
  Offset _tapPosition = Offset.zero;

  void _getTapPosition(TapDownDetails tapPosition) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(tapPosition
          .globalPosition); // store the tap positon in offset variable
      print(_tapPosition);
    });
  }

  void _showPopupMenu(
    BuildContext context,
    int index,
  ) async {
    final RenderObject? overlay =
        Overlay.of(context).context.findRenderObject();

    await showMenu(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey)),
      surfaceTintColor: MyColors.white,
      context: context,
      position: RelativeRect.fromRect(
          Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 100, 100),
          Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
              overlay.paintBounds.size.height)),
      items: <PopupMenuEntry>[
        PopupMenuItem(
          height: 25,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
            ),
            child: Text("View"),
          ),
          onTap: () {
            Get.toNamed(Routes.paidDetailsScreen);
          },
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          height: 25,
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
  void initState() {
    super.initState();
    controller = Get.put(PaymentController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: MyColors.mainTheme,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon:
                  const Icon(Icons.arrow_back_ios_new, color: MyColors.white)),
          title: Text(
            "Payment",
            style: TextStyle(fontFamily: MyFont.myFont, color: MyColors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: controller.isPaid
                                ? MyColors.lightDarkBlue
                                : MyColors.mainTheme,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          setState(() {
                            controller.isPaid = false;
                          });
                        },
                        child: Text(
                          'Out Standing',
                          style: TextStyle(
                              fontFamily: MyFont.myFont,
                              fontWeight: FontWeight.bold,
                              color: controller.isPaid
                                  ? MyColors.mainTheme
                                  : Colors.white,
                              fontSize: 16),
                        )),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: controller.isPaid
                                ? MyColors.mainTheme
                                : MyColors.lightDarkBlue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          setState(() {
                            controller.isPaid = true;
                          });
                        },
                        child: Text(
                          'Paid',
                          style: TextStyle(
                              fontFamily: MyFont.myFont,
                              fontWeight: FontWeight.bold,
                              color: controller.isPaid
                                  ? Colors.white
                                  : MyColors.mainTheme,
                              fontSize: 16),
                        )),
                  ),
                ],
              ),
              controller.isPaid == true
                  ? Expanded(child: paidList())
                  : Expanded(child: outStandingList()),
            ],
          ),
        ),
        bottomNavigationBar: controller.isPaid
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isChecked ? MyColors.mainTheme : Colors.white60,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      setState(() {
                        showCheckBox = false;
                      });
                    },
                    child: Text(
                      isChecked ? 'Pay \$500.00' : 'Pay',
                      style: TextStyle(
                          fontFamily: MyFont.myFont,
                          fontWeight: FontWeight.bold,
                          color: isChecked ? Colors.white : MyColors.mainTheme,
                          fontSize: 16),
                    )),
              ));
  }

  outStandingList() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 15),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: productListContent.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onLongPress: () {
            setState(() {
              showCheckBox = !showCheckBox;
            });
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
                    showCheckBox
                        ? Transform.scale(
                            scale: 1.3,
                            child: Checkbox(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                checkColor: MyColors.mainTheme,
                                activeColor: Colors.white,
                                side: MaterialStateBorderSide.resolveWith(
                                    (states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return const BorderSide(
                                        color: MyColors.mainTheme, width: 2);
                                  }
                                  return const BorderSide(
                                      color: MyColors.mainTheme, width: 2);
                                }),
                                value: isChecked,
                                onChanged: (val) {
                                  setState(() {
                                    isChecked = val!;
                                  });
                                }),
                          )
                        : const SizedBox(),
                    Expanded(
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
    );
  }

  paidList() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 15),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: productListContent.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTapDown: (position) {
            _getTapPosition(position);
            _showPopupMenu(
              context,
              index,
            );
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
    );
  }

  List<ProductDetailList> productListContent = [
    ProductDetailList(name: 'SKU #625335', about: 'Manivannan', price: '100'),
    ProductDetailList(name: 'SKU #625336', about: 'Gokul', price: '200'),
    ProductDetailList(name: 'SKU #625337', about: 'Manivannan', price: '300'),
    ProductDetailList(name: 'SKU #625337', about: 'Gokul', price: '400'),
    ProductDetailList(name: 'SKU #625338', about: 'Manivannan', price: '500'),
    ProductDetailList(name: 'SKU #625339', about: 'Gokul', price: '600'),
    ProductDetailList(name: 'SKU #625335', about: 'Manivannan', price: '700'),
    ProductDetailList(name: 'SKU #625335', about: 'Gokul', price: '800'),
    ProductDetailList(name: 'SKU #625335', about: 'Manivannan', price: '900'),
    ProductDetailList(name: 'SKU #625335', about: 'Gokul', price: '1000'),
    ProductDetailList(name: 'SKU #625335', about: 'Manivannan', price: '1100'),
    ProductDetailList(name: 'SKU #625335', about: 'Gokul', price: '1200'),
    ProductDetailList(name: 'SKU #625335', about: 'Manivannan', price: '1300'),
    ProductDetailList(name: 'SKU #625335', about: 'Gokul', price: '1400'),
  ];
}

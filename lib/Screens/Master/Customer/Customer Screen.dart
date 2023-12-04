import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universal_b2b/Const/approute.dart';
import 'package:universal_b2b/Const/color.dart';
import 'package:universal_b2b/Screens/Master/Customer/RequestCustomer%20Screen.dart';

import '../../../Const/assets.dart';
import '../../../Const/font.dart';
import '../../../Widget/Constructors/constructors.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  Offset _tapPosition = Offset.zero;
  void _getTapPosition(TapDownDetails tapPosition) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(tapPosition
          .globalPosition); // store the tap positon in offset variable
      print(_tapPosition);
    });
  }
  void _showPopupApprovedMenu(BuildContext context, int index) async {
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
            Get.toNamed(Routes.approvedCustomerScreen);
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
  void _showPopupRequestedMenu(BuildContext context, int index) async {
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
            Get.to(
                  () => RequestCustomerScreen(),
              //arguments: manageuserListContent[index],
            );
          },
        ),
        PopupMenuItem(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
            ),
            child: Text("Approve"),
          ),
          onTap: () {
            // Handle delete action
          },
        ),
        PopupMenuItem(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
            ),
            child: Text("Reject"),
          ),
          onTap: () {
            // Handle delete action
          },
        ),
      ],
    );
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
          "Customer",
          style: TextStyle(fontFamily: MyFont.myFont),
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: MyColors.lightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      color: MyColors.mainTheme,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Text("Approved",style: TextStyle(fontSize: 16,fontFamily: MyFont.myFont,fontWeight: FontWeight.bold),),
                    Text("Request",style: TextStyle(fontSize: 16,fontFamily: MyFont.myFont,fontWeight: FontWeight.bold),)],),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Tab 1 content
                    ApproverList(),
                    RequestList(),
                    // Tab 2 content
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  ApproverList() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: BrandListContent.length,
          itemBuilder: (context, index) {

            return GestureDetector(
              onTapDown:  (position) {
                 _getTapPosition(position);
                 _showPopupApprovedMenu(context, index,);
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
                                  BrandListContent[index].name,
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
                                  BrandListContent[index].code,
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
                              Container(
                                height: 50,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(Assets.CategoryList),
                                      fit: BoxFit.cover
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  ///ListDetailForProductList
  List<BrandDetailList> BrandListContent = [
    BrandDetailList(
      name: 'Pushparaj',
      code: 'Reg.No #825335',
    ),
    BrandDetailList(
      name: 'Pushparaj',
      code: 'Reg.No #825335',
    ),
    BrandDetailList(
      name: 'Pushparaj',
      code: 'Reg.No #825335',
    ),
    BrandDetailList(
      name: 'Pushparaj',
      code: 'Reg.No #825335',
    ),
    BrandDetailList(
      name: 'Pushparaj',
      code: 'Reg.No #825335',
    ),
    BrandDetailList(
      name: 'Pushparaj',
      code: 'Reg.No #825335',
    ),
    BrandDetailList(
      name: 'Pushparaj',
      code: 'Reg.No #825335',
    ),
    BrandDetailList(
      name: 'Pushparaj',
      code: 'Reg.No #825335',
    ),
    BrandDetailList(
      name: 'Pushparaj',
      code: 'Reg.No #825335',
    ),
    BrandDetailList(
      name: 'Pushparaj',
      code: 'Reg.No #825335',
    ),
    BrandDetailList(
      name: 'Pushparaj',
      code: 'Reg.No #825335',
    ),


  ];
  RequestList() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: reqListContent.length,
          itemBuilder: (context, index) {

            return GestureDetector(
              onTapDown:  (position) {
                _getTapPosition(position);
                _showPopupRequestedMenu(context, index,);
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
                                  reqListContent[index].name,
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
                                  reqListContent[index].code,
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
                              Container(
                                height: 50,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(Assets.customerlogo),
                                      fit: BoxFit.cover
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  ///ListDetailForProductList
  List<BrandDetailList> reqListContent = [
    BrandDetailList(
      name: 'Pushparaj 01',
      code: 'Reg.No #625335',
    ),
    BrandDetailList(
      name: 'Pushparaj 01',
      code: 'Reg.No #625335',
    ),
    BrandDetailList(
      name: 'Pushparaj 01',
      code: 'Reg.No #625335',
    ),
    BrandDetailList(
      name: 'Pushparaj 01',
      code: 'Reg.No #625335',
    ),
    BrandDetailList(
      name: 'Pushparaj 01',
      code: 'Reg.No #625335',
    ),
    BrandDetailList(
      name: 'Pushparaj 01',
      code: 'Reg.No #625335',
    ),
    BrandDetailList(
      name: 'Pushparaj 01',
      code: 'Reg.No #625335',
    ),
    BrandDetailList(
      name: 'Pushparaj 01',
      code: 'Reg.No #625335',
    ),
    BrandDetailList(
      name: 'Pushparaj 01',
      code: 'Reg.No #625335',
    ),
    BrandDetailList(
      name: 'Pushparaj 01',
      code: 'Reg.No #625335',
    ),


  ];
}

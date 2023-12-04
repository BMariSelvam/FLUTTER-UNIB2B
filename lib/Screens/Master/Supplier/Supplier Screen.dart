import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universal_b2b/Widget/Constructors/constructors.dart';

import '../../../Const/approute.dart';
import '../../../Const/assets.dart';
import '../../../Const/color.dart';
import '../../../Const/font.dart';
import '../../../Const/size.dart';
import '../../../Widget/Constructors/constructors.dart';

class SupplierScreen extends StatefulWidget {
  const SupplierScreen({Key? key}) : super(key: key);

  @override
  State<SupplierScreen> createState() => _SupplierScreenState();
}

class _SupplierScreenState extends State<SupplierScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: MyColors.mainTheme,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: MyColors.white)),
        title: Text(
          "Supplier",
          style: TextStyle(fontFamily: MyFont.myFont, color: MyColors.white),
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
                  color: MyColors.lightDarkBlue,
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
                    Text("Find",style: TextStyle(fontSize: 16,fontFamily: MyFont.myFont,fontWeight: FontWeight.bold),)],),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Tab 1 content
                    SupplierApproveGridView(),
                    // Tab 2 content
                    SupplierFindGridView()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  SupplierApproveGridView() {
    return  GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Adjusted to 3 columns
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: SupplierGridcontent.length, // Replace with the actual number of items
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Get.toNamed(Routes.supplierprofilescreen,
                arguments: {'source': 'approve'});
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  SupplierGridcontent[index].image, // Replace with your image URL
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                SupplierGridcontent[index].text,
                style: TextStyle(
                  fontFamily: MyFont.myFont,
                  //fontWeight: FontWeight.bold,
                  fontSize: 14,
                  //color: MyColors.primaryCustom,
                ),
              ),
            ), // Replace with your text
              ],
            ),
          ),
        );
      },
    );
  }
  SupplierFindGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Adjusted to 3 columns
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: SupplierGridcontent.length, // Replace with the actual number of items
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Get.toNamed(Routes.supplierprofilescreen, arguments: {'source': 'find'});
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  SupplierGridcontent[index].image, // Replace with your image URL
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    SupplierGridcontent[index].text,
                    style: TextStyle(
                      fontFamily: MyFont.myFont,
                      //fontWeight: FontWeight.bold,
                      fontSize: 14,
                      //color: MyColors.primaryCustom,
                    ),
                  ),
                ), // Replace with your text
              ],
            ),
          ),
        );
      },
    );
  }
  List<SupplierGrid> SupplierGridcontent = [
    SupplierGrid(
      image: Assets.customerlogo,
      text: 'Hot Cup',
    ),
    SupplierGrid(
      image: Assets.worldarrow,
      text: 'World Arrow',
    ),
    SupplierGrid(
      image: Assets.victory,
      text: 'Victory',
    ),
    SupplierGrid(
      image: Assets.lorem,
      text: 'Lorem',
    ),
    SupplierGrid(
      image: Assets.carpentry,
      text: 'Carpentry',
    ),
    SupplierGrid(
      image: Assets.lawfirm,
      text: 'Lawfirm',
    ),
    SupplierGrid(
      image: Assets.premium,
      text: 'Premium',
    ),
    SupplierGrid(
      image: Assets.quillpen,
      text: 'Quill Pen',
    ),SupplierGrid(
      image: Assets.freedom,
      text: 'Freedom',
    ),
  ];
}

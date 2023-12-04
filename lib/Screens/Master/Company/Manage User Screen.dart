import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Const/approute.dart';
import '../../../Const/assets.dart';
import '../../../Const/color.dart';
import '../../../Const/font.dart';
import '../../../Widget/Constructors/constructors.dart';
import '../../../Widget/submitbutton.dart';
import '../../../Widget/textformfield.dart';
import 'Manage Userscreen Controller.dart';
import 'ManageUserViewdetails Screen.dart';

class ManageUserListScreen extends StatefulWidget {
  const ManageUserListScreen({Key? key}) : super(key: key);

  @override
  State<ManageUserListScreen> createState() => _ManageUserListScreenState();
}

class _ManageUserListScreenState extends State<ManageUserListScreen> {
  List<ManageuserDetails> originalProductList = [];
  String selectedFilter = "";
  bool isSearching=false;
  late ManageUserListController controller;
  Offset _tapPosition = Offset.zero;
  void _getTapPosition(TapDownDetails tapPosition) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(tapPosition
          .globalPosition); // store the tap positon in offset variable
      print(_tapPosition);
    });
  }
  void _showPopupMenu(BuildContext context, int index) async {
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
                  () => ManageUserViewScreen(),
              arguments: manageuserListContent[index],
            );
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
    //TODO:implement iniState
    super.initState();
    controller=Get.put(ManageUserListController());
    originalProductList = List.from(manageuserListContent);
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
            "Manage User",
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
                  //Get.toNamed(Routes.addsubcategoryscreen);
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
                        handleSearch();
                      },
                      hintTextStyle: TextStyle(fontFamily: MyFont.myFont),
                      textStyle: TextStyle(fontFamily: MyFont.myFont),
                      inputFormatters: [],
                    ),
                    SizedBox(height: 20,),
                    SubmitButton(
                        isLoading: false,
                        onTap: () {},
                        title: "Search")
                  ],
                ),
              ),
            Expanded(child:SubCategoryList(),)
          ],
        )
    );
  }
  SubCategoryList() {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: manageuserListContent.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTapDown:  (position) {
                _getTapPosition(position);
                _showPopupMenu(context, index,);
              },
              child: Padding(
                padding:  EdgeInsets.only(bottom: 10),
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
                                  manageuserListContent[index].name,
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
                                  manageuserListContent[index].code,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: MyFont.myFont,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  manageuserListContent[index].mail,
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
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image:  DecorationImage(
                                      image: AssetImage(manageuserListContent[index].image),
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
  List<ManageuserDetails> manageuserListContent = [
    ManageuserDetails(
        name: 'Pushparaj',
        code: 'Reg. No : 8744334',
        image: Assets.customerlogo,
        mail: 'pushparaj01@gmail.com'),
    ManageuserDetails(
        name: 'Pushparaj',
        code: 'Reg. No : 8744334',
        image: Assets.customerlogo,
        mail: 'pushparaj01@gmail.com'),
    ManageuserDetails(
        name: 'Pushparaj',
        code: 'Reg. No : 8744334',
        image: Assets.customerlogo,
        mail: 'pushparaj01@gmail.com'),
    ManageuserDetails(
        name: 'Pushparaj',
        code: 'Reg. No : 8744334',
        image: Assets.productBanner,
        mail: 'pushparaj01@gmail.com'),
    ManageuserDetails(
        name: 'Pushparaj',
        code: 'Reg. No : 8744334',
        image: Assets.customerlogo,
        mail: 'pushparaj01@gmail.com'),
    ManageuserDetails(
        name: 'Pushparaj',
        code: 'Reg. No : 8744334',
        image: Assets.customerlogo,
        mail: 'pushparaj01@gmail.com'),
    ManageuserDetails(
        name: 'Pushparaj',
        code: 'Reg. No : 8744334',
        image: Assets.customerlogo,
        mail: 'pushparaj01@gmail.com'),
    ManageuserDetails(
        name: 'Pushparaj',
        code: 'Reg. No : 8744334',
        image: Assets.customerlogo,
        mail: 'pushparaj01@gmail.com'),
  ];

  void handleSearch() {
    String searchTerm = controller.SearchController.text.toLowerCase();

    if (searchTerm.isEmpty) {
      // If search term is empty, reset the product list to the full list
      setState(() {
        manageuserListContent = originalProductList;
      });
    } else {
      // If there is a search term, filter the product list
      List<ManageuserDetails> filteredList = originalProductList
          .where((product) =>
      product.name.toLowerCase().contains(searchTerm) ||
          product.code.toLowerCase().contains(searchTerm))
          .toList();

      setState(() {
        manageuserListContent = filteredList;
      });
    }
  }
}

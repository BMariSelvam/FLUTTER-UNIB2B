import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universal_b2b/Screens/Products/UOM%20Screen/UOM%20List%20Screen%20Controller.dart';

import '../../../Const/approute.dart';
import '../../../Const/color.dart';
import '../../../Const/font.dart';
import '../../../Widget/Constructors/constructors.dart';
import '../../../Widget/submitbutton.dart';
import '../../../Widget/textformfield.dart';
class UOMListScreen extends StatefulWidget {
  const UOMListScreen({Key? key}) : super(key: key);

  @override
  State<UOMListScreen> createState() => _UOMListScreenState();
}

class _UOMListScreenState extends State<UOMListScreen> {
  List<UOMDetailList> originalProductList = [];
  String selectedFilter = "";
  bool isSearching=false;
  late UOMListController controller;
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
            child: Text("Edit"),
          ),
          onTap: () {
            Get.toNamed(Routes.adduomscreen);
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
    controller=Get.put(UOMListController());
    originalProductList = List.from(UOMListContent);
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
          "UOM",
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
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.adduomscreen);
              },
              icon: const Icon(
                Icons.add_circle_outline,
              ))
        ],
      ),
      body:Column(
        children: [
          if (isSearching)
            Padding(
              padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: controller.SearchController,
                    onChanged: (value) {
                      handleSearch();
                    },
                    hintText: "Search...",
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
          Expanded(child:UOMList(),)
        ],
      )
    );
  }

  UOMList() {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: UOMListContent.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTapDown:  (position) {
                _getTapPosition(position);
                _showPopupMenu(context, index,);
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
                                  UOMListContent[index].name,
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
                                  UOMListContent[index].code,
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
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
  ///ListDetailForUOMList
  List<UOMDetailList> UOMListContent = [
    UOMDetailList(
      name: 'Pushparaj',
      code: 'Code #625335',
    ),
    UOMDetailList(
      name: 'Pushparaj',
      code: 'Code #625336',
    ),
    UOMDetailList(
      name: 'Pushparaj',
      code: 'Code #625337',
    ),
    UOMDetailList(
      name: 'Pushparaj',
      code: 'Code #625338',
    ),
    UOMDetailList(
      name: 'Pushparaj',
      code: 'Code #625339',
    ),
    UOMDetailList(
      name: 'Pushparaj',
      code: 'Code #625340',
    ),
    UOMDetailList(
      name: 'Pushparaj',
      code: 'Code #625341',
    ),
    UOMDetailList(
      name: 'Pushparaj',
      code: 'Code #625342',
    ),
    UOMDetailList(
      name: 'Pushparaj',
      code: 'Code #625343',
    ),
    UOMDetailList(
      name: 'Pushparaj',
      code: 'Code #625344',
    ),
    UOMDetailList(
      name: 'Pushparaj',
      code: 'Code #625345',
    ),
    UOMDetailList(
      name: 'Pushparaj',
      code: 'Code #625346',
    ),
    UOMDetailList(
      name: 'Pushparaj',
      code: 'Code #625347',
    ),
    UOMDetailList(
      name: 'Pushparaj',
      code: 'Code #625348', ),
    UOMDetailList(
      name: 'Pushparaj',
      code: 'Code #625349',
    ),
    UOMDetailList(
      name: 'Pushparaj',
      code: 'Code #625350',
    ),
  ];
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
        PopupMenuItem(
          child: buildFilterMenuItem("Price Low to High"),
          value: "PriceLowToHigh",
        ),
        PopupMenuItem(
          child: buildFilterMenuItem("Price High to Low"),
          value: "PriceHighToLow",
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
  void handleFilterSelection(String value) {
    setState(() {
      selectedFilter = value;
    });

    // Implement the sorting logic based on the selected filter
    switch (value) {
      case "A-Z":
        UOMListContent.sort((a, b) => a.name.compareTo(b.name));
        break;
      case "Z-A":
        UOMListContent.sort((a, b) => b.name.compareTo(a.name));
        break;
      default:
        break;
    }
  }
  void handleSearch() {
    String searchTerm = controller.SearchController.text.toLowerCase();

    if (searchTerm.isEmpty) {
      // If search term is empty, reset the product list to the full list
      setState(() {
        UOMListContent = originalProductList;
      });
    } else {
      // If there is a search term, filter the product list
      List<UOMDetailList> filteredList = originalProductList
          .where((product) =>
      product.name.toLowerCase().contains(searchTerm) ||
          product.code.toLowerCase().contains(searchTerm))
          .toList();

      setState(() {
        UOMListContent = filteredList;
      });
    }
  }
}

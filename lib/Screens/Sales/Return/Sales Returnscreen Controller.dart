import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widget/Constructors/constructors.dart';

class SalesReturnListController extends GetxController with StateMixin{

  bool isSearching=false;
  TextEditingController SearchController = TextEditingController();
  TextEditingController FromDateController = TextEditingController();
  TextEditingController ToDateController = TextEditingController();
  TextEditingController StatusController = TextEditingController();
  late List<PurchaseReturnDetailList> filteredPurchaseReturnList = [];



}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesReceiptListController extends GetxController with StateMixin{

  bool isSearching=false;
  TextEditingController SearchController = TextEditingController();
  TextEditingController FromDateController = TextEditingController();
  TextEditingController ToDateController = TextEditingController();
  TextEditingController StatusController = TextEditingController();
}

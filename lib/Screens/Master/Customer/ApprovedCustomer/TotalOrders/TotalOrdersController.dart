import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TotalOrdersController extends GetxController with StateMixin{
  TextEditingController searchController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController statusController = TextEditingController();
}
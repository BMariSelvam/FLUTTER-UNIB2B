import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PendingOrdersController extends GetxController with StateMixin{
  TextEditingController searchController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController statusController = TextEditingController();
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController with StateMixin {
  bool isSearching = false;
  bool isPaid = false;
  TextEditingController SearchController = TextEditingController();
}
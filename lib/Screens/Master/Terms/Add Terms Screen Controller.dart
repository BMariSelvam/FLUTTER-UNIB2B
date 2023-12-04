import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTermsController extends GetxController with StateMixin {
  RxBool isAlertToggle = true.obs;

  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dayController = TextEditingController();
}

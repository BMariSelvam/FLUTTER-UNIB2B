import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetailController extends GetxController with StateMixin {
  String? fileName;

  final profileKey = GlobalKey<FormState>();

  TextEditingController fileController = TextEditingController();
  TextEditingController aboutCompanyController = TextEditingController();
  TextEditingController businessCategoryController = TextEditingController();
}

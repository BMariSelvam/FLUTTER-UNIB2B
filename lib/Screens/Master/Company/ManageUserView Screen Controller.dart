import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageUserViewController extends GetxController with StateMixin{
  RxBool isActiveToggle = true.obs;
  TextEditingController EmployeeidController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

}
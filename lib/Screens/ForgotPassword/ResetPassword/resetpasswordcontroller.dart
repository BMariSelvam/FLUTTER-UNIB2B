import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController with StateMixin {
  final resetPasswordKey = GlobalKey<FormState>();

  RxBool isPassword = false.obs;
  RxBool isConfirmPassword = false.obs;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
}

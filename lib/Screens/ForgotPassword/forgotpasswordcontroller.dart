import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController with StateMixin {
  final forgotPasswordKey = GlobalKey<FormState>();

  TextEditingController forgotPasswordEmailController = TextEditingController();
}

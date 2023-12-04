import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController with StateMixin {
  final regKey = GlobalKey<FormState>();

  TextEditingController companyNameController = TextEditingController();
  TextEditingController regNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController addressLine1Controller = TextEditingController();
  TextEditingController addressLine2Controller = TextEditingController();
  TextEditingController floorNoController = TextEditingController();
  TextEditingController unitNoController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactInformationController extends GetxController with StateMixin {
  final contactKey = GlobalKey<FormState>();

  TextEditingController contactNameController = TextEditingController();
  TextEditingController contactMobileNumberController = TextEditingController();
  TextEditingController contactEmailController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();
  TextEditingController youTubeController = TextEditingController();
}

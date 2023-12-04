import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductsController extends GetxController with StateMixin {
  RxBool isStockToggle = true.obs;
  RxBool isPriceToggle = true.obs;

  TextEditingController skuController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController shortDescriptionController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController subcategoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController uomController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController barCodeController = TextEditingController();
  TextEditingController imageController = TextEditingController();
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AddSalesInvoiceScreenController extends GetxController with StateMixin{
  TextEditingController dateController = TextEditingController();
  TextEditingController invoicecontroller = TextEditingController();
  TextEditingController customercontroller = TextEditingController();
  TextEditingController addressController = TextEditingController();
}

class Product {
  final String name;
  final String image;
  final double rating;
  final String description;

  Product({
    required this.name,
    required this.image,
    required this.rating,
    required this.description,
  });
}
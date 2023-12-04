import 'package:flutter/material.dart';

class DashBoardGrid {
  final String image;
  final String text;
  final Color color;
  final RoundedRectangleBorder border;

  DashBoardGrid(
      {required this.image,
        required this.text,
        required this.color,
        required this.border});
}

class ProductsGrid {
  final String image;
  final String text;
  final Color color;
  final RoundedRectangleBorder border;

  ProductsGrid(
      {required this.image,
        required this.text,
        required this.color,
        required this.border});
}
class MasterGrid {
  final String image;
  final String text;
  final Color color;
  final RoundedRectangleBorder border;

  MasterGrid(
      {required this.image,
        required this.text,
        required this.color,
        required this.border});
}
class SalesGrid {
  final String image;
  final String text;
  final Color color;
  final RoundedRectangleBorder border;

  SalesGrid(
      {required this.image,
        required this.text,
        required this.color,
        required this.border});
}

class ProductDetailList {
  final String name;
  final String about;
  final String price;

  ProductDetailList(
      {required this.name,
        required this.about,
        required this.price});
}
class CategoryDetailList {
  final String name;
  final String code;
  final String image;

  CategoryDetailList(
      {required this.name,
        required this.code,
        required this.image});
}
class SubCategoryDetailList {
  final String name;
  final String code;
  final String image;

  SubCategoryDetailList(
      {required this.name,
        required this.code,
        required this.image});
}
class BrandDetailList {
  final String name;
  final String code;

  BrandDetailList({
    required this.name,
    required this.code,
  });

  Map<String, String> toMap() {
    return {
      'name': name,
      'code': code,
    };
  }

  factory BrandDetailList.fromMap(Map<String, dynamic> map) {
    return BrandDetailList(
      name: map['name'],
      code: map['code'],
    );
  }
}


class UOMDetailList {
  final String name;
  final String code;


  UOMDetailList(
      {required this.name,
        required this.code,});
}

class QuatationDetailList {
  final String name;
  final String code;
  final String date;

  QuatationDetailList(
      {required this.name,
        required this.code,
        required this.date});
}
class PurchaseReturnDetailList {
  final String name;
  final String price;
  final String date;
  bool isSelected;

  PurchaseReturnDetailList(
      {required this.name,
        required this.price,
        required this.date,
      this.isSelected=false});
}
class InvoiceList {

  final String image;
  final String offertext;
  final String name;
  final String offer;
  final String description;
   double rating;

  InvoiceList({
    required this.image,
    required this.name,
    required this.offertext,
    required this.description,
    required this.rating,
  required this.offer,});
}

class CurrencyDetailList {
  final String name;
  final String about;
  final String rate;
  final String value;

  CurrencyDetailList(
      {required this.name,
        required this.about,
        required this.rate,
        required this.value,
      });
}
class TermsDetailList {
  final String name;
  final String about;
  final String days;

  TermsDetailList(
      {required this.name,
        required this.about,
        required this.days,

      });
}
class TaxDetailList {
  final String name;
  final String about;
  final String type;
  final String percentage;

  TaxDetailList(
      {required this.name,
        required this.about,
        required this.type,
        required this.percentage,

      });
}
class newcustomerlist {
  final String name;
  final String id;
  final String image;

  newcustomerlist(
      {required this.name,
        required this.id,
        required this.image});
}

class ManageuserDetails {
  final String name;
  final String code;
  final String image;
  final String mail;


  ManageuserDetails(
      {required this.name,
        required this.code,
        required this.image,
        required this.mail,

      });
}

class SupplierGrid {
  final String image;
  final String text;

  SupplierGrid(
      {required this.image,
        required this.text,
        });
}
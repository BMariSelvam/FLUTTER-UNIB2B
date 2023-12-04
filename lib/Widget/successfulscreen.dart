import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universal_b2b/Const/color.dart';
import 'package:universal_b2b/Const/font.dart';

import '../Const/approute.dart';
import '../Const/assets.dart';
import 'submitbutton.dart';

class SuccessfulScreen extends StatefulWidget {
  final String text;
  final Function onTap;
  final String buttonText;
  const SuccessfulScreen({
    super.key,
    required this.text,
    required this.onTap,
    required this.buttonText,
  });

  @override
  State<SuccessfulScreen> createState() => _SuccessfulScreenState();
}

class _SuccessfulScreenState extends State<SuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.confirmed),
              const SizedBox(height: 20),
              Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: MyFont.myFont,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: MyColors.primaryCustom,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(Assets.successful),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 250,
                child: SubmitButton(
                    isLoading: false,
                    onTap: widget.onTap,
                    title: widget.buttonText)),
          ],
        ),
      ),
    );
  }
}

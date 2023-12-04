import 'package:flutter/material.dart';
import 'package:universal_b2b/Const/color.dart';

import '../Const/font.dart';
import '../Const/size.dart';

class SubmitButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final Function onTap;
  const SubmitButton(
      {Key? key,
      required this.isLoading,
      required this.onTap,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading
          ? null
          : () {
              onTap();
            },
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.mainTheme,
        minimumSize: Size(width(context), 40),
        disabledBackgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // <-- Radius
        ),
      ),
      child: isLoading
          ? const CircularProgressIndicator()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                title,
                style: TextStyle(
                    fontFamily: MyFont.myFont,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
    );
  }
}

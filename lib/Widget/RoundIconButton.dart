import 'package:flutter/material.dart';

import '../Const/font.dart';
import '../Const/size.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isLoading;
  final Function onTap;
  const RoundIconButton(
      {Key? key,
        required this.isLoading,
        required this.icon,
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
        child: Column(
          children: [
          IconButton(
          icon: Icon(
          icon,
          color: Colors.white,
        ),
        onPressed: () {  },)
          ],
        ),
      ),
    );
  }
}

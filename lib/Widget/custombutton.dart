import 'package:flutter/material.dart';
import 'package:universal_b2b/Const/font.dart';

class CustomRoundedButton extends StatelessWidget {
  final String buttonText;
  final IconData iconData;
  final void Function()? onTap;
  final Color backgroundColor;
  final TextStyle textStyle;

  const CustomRoundedButton({
    Key? key,
    required this.buttonText,
    required this.iconData,
    required this.onTap,
    required this.backgroundColor,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        height: 25, // Set a fixed height
        width: 120, // Set a fixed width
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonText,
                style: textStyle,
              ),
              SizedBox(width: 10),
              Icon(
                iconData,
                color: textStyle.color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

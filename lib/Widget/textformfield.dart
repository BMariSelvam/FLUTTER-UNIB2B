import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:universal_b2b/Const/color.dart';
import 'package:universal_b2b/Const/font.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintTextStyle;
  final String? labelText;
  final TextStyle? labelTextStyle;
  final bool? readOnly;
  final TextStyle textStyle;
  final List<TextInputFormatter> inputFormatters;
  final AutovalidateMode autoValidateMode;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final bool? enabled;
  final bool? filled;
  final Color? filledColor;
  final IconButton? suffixIcon;
  final Icon? prefixIcon;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final int? maxLength;
  final int? maxLine;
  final String? initialValue;
  final BorderSide? inputBorder;
  final Color? cursorColor;
  final Widget? suffix;
  final void Function(String)? onChanged;


  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.labelTextStyle,
    this.readOnly,
    required this.textStyle,
    required this.inputFormatters,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.validator,
    this.obscureText,
    this.suffixIcon,
    this.enabled,
    this.onTap,
    this.keyboardType,
    this.maxLength,
    this.initialValue,
    this.hintTextStyle,
    this.filled,
    this.filledColor,
    this.inputBorder,
    this.cursorColor,
    this.onChanged,
    this.prefixIcon,
    this.suffix,
    this.maxLine,

  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          maxLength: widget.maxLength,
          controller: widget.controller,
          readOnly: widget.readOnly ?? false,
          inputFormatters: widget.inputFormatters,
          obscureText: widget.obscureText ?? false,
          obscuringCharacter: "*",
          style: widget.textStyle,
          keyboardType: widget.keyboardType,
          enabled: widget.enabled,
          autovalidateMode: widget.autoValidateMode,
          validator: widget.validator,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          maxLines: widget.maxLine ?? 1,
          initialValue: widget.initialValue,
          cursorColor: widget.cursorColor,
          decoration: InputDecoration(
              filled: true,
              fillColor: MyColors.lightGray,
              hintText: widget.hintText,
              hintStyle: widget.hintTextStyle,
              labelText: widget.labelText,
              labelStyle: widget.labelTextStyle,
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
              suffix: widget.suffix,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              counterText: "",
              contentPadding: const EdgeInsets.all(10.0),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: MyColors.primaryCustom)),
              border: OutlineInputBorder(
                borderSide: widget.inputBorder ?? BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              )),
        ),
      ],
    );
  }
}

class HeadingText extends StatefulWidget {
  final String headingText;
  const HeadingText({super.key, required this.headingText});

  @override
  State<HeadingText> createState() => _HeadingTextState();
}

class _HeadingTextState extends State<HeadingText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.headingText,
      style: TextStyle(
        fontFamily: MyFont.myFont,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}

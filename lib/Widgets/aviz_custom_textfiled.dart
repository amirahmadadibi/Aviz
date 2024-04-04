import 'package:aviz/Constants/color_constants.dart';
import 'package:flutter/material.dart';

class AvizTextFiled extends StatelessWidget {
  const AvizTextFiled(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.onchanged,
      required this.onSubmitted,
      required this.keyboardType,
      this.minLine,
      this.horizontalContentPadding = 10,
      this.verticalContentPadding = 4,
      this.suffixIcon,
      this.defaultFillColor = CustomColor.lightGrey1,
      this.changeFillColor = false,
      this.textinputAction});
  final TextEditingController controller;
  final String hintText;
  final Function(String value) onchanged;
  final Function(String value) onSubmitted;
  final TextInputType keyboardType;
  final double horizontalContentPadding;
  final double verticalContentPadding;
  final int? minLine;
  final Widget? suffixIcon;
  final Color defaultFillColor;
  final bool changeFillColor;
  final TextInputAction? textinputAction;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onchanged,
      keyboardType: keyboardType,
      textAlign: TextAlign.right,
      onSubmitted: onSubmitted,
      maxLines: minLine,
      minLines: minLine,
      textInputAction: textinputAction,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: horizontalContentPadding,
              vertical: verticalContentPadding),
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: CustomColor.lightGrey),
          fillColor: defaultFillColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide: (defaultFillColor == Colors.white)
                ? const BorderSide(color: CustomColor.lightGrey)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(4),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: (defaultFillColor == Colors.white)
                ? const BorderSide(color: CustomColor.lightGrey1)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: (defaultFillColor == Colors.white)
                ? const BorderSide(color: CustomColor.lightGrey)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(4),
          )),
    );
  }
}

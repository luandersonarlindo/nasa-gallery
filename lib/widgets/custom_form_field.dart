// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nasa_app/common/constants/app_colors.dart';

class CustomFormField extends StatelessWidget {
  final ValueChanged<String>? onFieldSubmited;
  final TextEditingController? controller;

  final Icon? sufixIcon;

  const CustomFormField({
    super.key,
    this.onFieldSubmited,
    this.controller,
    this.sufixIcon
  });

  @override
  Widget build(BuildContext context) {
    final defaultBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.blueSecondary,
        width: 2.0
      ),
      borderRadius: .circular(28)
    );
    return TextFormField(
      textInputAction: .search,
      controller: controller,
      onFieldSubmitted: onFieldSubmited,
      decoration: InputDecoration(
        suffixIcon: sufixIcon,
        labelText: 'Search',
        labelStyle: TextStyle(color: AppColors.blueSecondary, fontFamily: 'nasalization'),
        focusedBorder: defaultBorder.copyWith(
          borderSide: BorderSide(
            color: AppColors.blueSecondary,
          )
        ),
        enabledBorder: defaultBorder,
        errorBorder: defaultBorder.copyWith(borderSide: BorderSide(
          color: AppColors.redSecondary
        ))
      ),
    );
  }
}

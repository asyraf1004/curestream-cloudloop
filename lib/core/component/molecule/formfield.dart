import 'package:flutter/material.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/core/preferences/text_styles.dart';

class FormFieldText extends StatelessWidget {
  final String title;
  final String hintText;
  final Icon? prefixIcon;

  FormFieldText(this.title, this.hintText, {this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppText.formTitleText,
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: hintText,
              focusColor: AppColors.formBorderColor,
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.formBorderColor, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

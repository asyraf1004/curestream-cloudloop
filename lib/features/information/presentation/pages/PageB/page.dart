// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_starter/core/component/molecule/formfield.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/core/preferences/text_styles.dart';
import 'package:flutter_starter/features/home/home.dart';
import 'package:flutter_starter/features/information/home.dart';
import 'package:flutter_starter/features/information/presentation/pages/Page%20C/page.dart';
import 'package:flutter_starter/features/login/home.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_starter/l10n/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

class InformationB extends StatefulWidget {
  const InformationB({Key? key}) : super(key: key);

  @override
  State<InformationB> createState() => _InformationBState();
}

class _InformationBState extends State<InformationB> {
  String titlePage = 'Set Up Information';
  String genderTitle = 'Sex';
  String dateOfBirthday = 'Date of Birthday';
  String diabetesType = 'Diabetes Type';
  String weight = 'Weight';
  String totalDailyDose = 'Total Daily Dose';
  String agreement = 'I Agree with the ';
  String termsAndConditions = 'Terms & Conditions';
  bool isSelected = false;
  int selectedIndex = -1;
  int? groupValue = -1;
  int value = 1;

  Color getColor(Set<MaterialState> states) {
    Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColors.checkColor;
    }
    return AppColors.mainColor;
  }

  Widget backButton() => IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: AppColors.mainColor,
      ),
      iconSize: 14.0);

  Widget header() => Padding(
        padding: EdgeInsets.only(
            top: Dimens.dp50,
            bottom: Dimens.dp16,
            right: Dimens.dp16,
            left: Dimens.dp16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            backButton(),
            Column(
              children: [
                Text(
                  titlePage,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: Dimens.dp14,
                    color: AppColors.neutralDark02,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 128,
                      height: 6,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 128,
                      height: 6,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.transparent,
                ),
                iconSize: 14.0),
          ],
        ),
      );
  Widget checkBox() => Padding(
        padding: EdgeInsets.only(
          left: Dimens.dp10,
        ),
        child: Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.dp4),
          ),
          side: BorderSide(
            color:
                isSelected == true ? Colors.transparent : AppColors.checkColor,
          ),
          checkColor: AppColors.whiteColor,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isSelected,
          onChanged: (bool? value) {
            setState(() {
              isSelected = value!;
            });
          },
        ),
      );
  // ignore: avoid_positional_boolean_parameters
  Widget nextButton(bool isSelected) => Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                checkBox(),
                SizedBox(
                  width: Dimens.dp8,
                ),
                Text(
                  agreement,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    color: AppColors.neutralDark01,
                    fontSize: Dimens.dp14,
                  ),
                ),
                Text(
                  termsAndConditions,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    color: AppColors.mainColor,
                    fontSize: Dimens.dp14,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimens.dp16,
            ),
            GestureDetector(
              onTap: isSelected == true
                  ? () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnBoardingPage(),
                        ),
                      );
                    }
                  : () {},
              child: Container(
                height: Dimens.dp46,
                margin: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 24,
                ),
                decoration: BoxDecoration(
                  color: isSelected == true
                      ? AppColors.mainColor
                      : AppColors.mutedColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.formBorderColor),
                ),
                child: Center(
                  child: Text(
                    'Next',
                    style: isSelected == true
                        ? GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: Dimens.dp14,
                            color: AppColors.whiteColor,
                          )
                        : GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: Dimens.dp14,
                            color: AppColors.neutralDark00,
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget mainInformationA(int index, String title, String description) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        padding: EdgeInsets.all(Dimens.dp12),
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.dp8),
          border: Border.all(
            color: selectedIndex == index
                ? AppColors.mainColor
                : AppColors.formBorderColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    color: AppColors.neutralDark01,
                    fontSize: Dimens.dp14,
                  ),
                ),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w300,
                    color: AppColors.neutralDark00,
                    fontSize: Dimens.dp12,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            if (selectedIndex == index)
              Radio(
                value: value,
                groupValue: groupValue,
                onChanged: (newValue) => setState(() {
                  groupValue = newValue as int;
                }),
                activeColor: AppColors.mainColor,
                focusColor: AppColors.checkColor,
                fillColor: MaterialStateColor.resolveWith(
                  (states) => AppColors.mainColor,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget mainInformationB() => Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: Dimens.dp12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weight,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: Dimens.dp14,
                    color: AppColors.neutralDark01,
                  ),
                ),
                SizedBox(
                  height: Dimens.dp4,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.mainColor),
                    ),
                    suffixText: 'Kg',
                    hintText: 'Input your weight',
                    hintStyle: GoogleFonts.inter(
                      color: AppColors.neutralDark00,
                      fontWeight: FontWeight.w400,
                      fontSize: Dimens.dp14,
                    ),
                    focusColor: AppColors.formBorderColor,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.formBorderColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: Dimens.dp12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  totalDailyDose,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: Dimens.dp14,
                    color: AppColors.neutralDark01,
                  ),
                ),
                SizedBox(
                  height: Dimens.dp4,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.mainColor),
                    ),
                    suffixText: 'U',
                    hintText: 'Input daily dose',
                    hintStyle: GoogleFonts.inter(
                      color: AppColors.neutralDark00,
                      fontWeight: FontWeight.w400,
                      fontSize: Dimens.dp14,
                    ),
                    focusColor: AppColors.formBorderColor,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.formBorderColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.dp12,
                ),
                child: Text(
                  diabetesType,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      color: AppColors.neutralDark01,
                      fontSize: Dimens.dp14),
                ),
              ),
              SizedBox(
                height: Dimens.dp4,
              ),
              mainInformationA(
                0,
                'Type 1',
                'A genetic disorder that often shows up early in life.',
              ),
              SizedBox(
                height: Dimens.dp8,
              ),
              mainInformationA(
                1,
                'Type 2',
                'Largely diet-related and develops over time.',
              ),
              SizedBox(
                height: 16,
              ),
              mainInformationB(),
            ],
          ),
          nextButton(isSelected),
        ],
      ),
    );
  }
}

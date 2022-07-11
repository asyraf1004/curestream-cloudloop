// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_starter/core/component/molecule/formfield.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/core/preferences/text_styles.dart';
import 'package:flutter_starter/features/home/home.dart';
import 'package:flutter_starter/features/information/home.dart';
import 'package:flutter_starter/features/login/home.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_starter/l10n/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoardingPage> {
  Widget nextButton() => Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ),
                );
              },
              child: Container(
                height: Dimens.dp46,
                margin: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.formBorderColor)),
                child: Center(
                  child: Text(
                    'Next',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: Dimens.dp14,
                        color: AppColors.whiteColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: 187,
                  height: 223,
                  image: AssetImage(MainAssets.onboardingImg),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Yay! Set Up Completed!',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.neutralDark02),
                ),
                Text(
                  'You can now continue to use the app.',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: AppColors.neutralDark00),
                ),
              ],
            ),
          ),
          nextButton(),
        ],
      ),
    );
  }
}

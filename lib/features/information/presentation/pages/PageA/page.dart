import 'package:flutter/material.dart';
import 'package:flutter_starter/core/component/molecule/formfield.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/core/preferences/text_styles.dart';
import 'package:flutter_starter/features/home/home.dart';
import 'package:flutter_starter/features/information/presentation/pages/PageB/page.dart';
import 'package:google_fonts/google_fonts.dart';

class InformationA extends StatefulWidget {
  const InformationA({Key? key}) : super(key: key);

  @override
  State<InformationA> createState() => _InformationAState();
}

class _InformationAState extends State<InformationA> {
  String titlePage = 'Set Up Information';
  String genderTitle = 'Sex';
  String dateOfBirthday = 'Date of Birthday';
  int selectedIndex = -1;
  int? groupValue = -1;
  int value = 1;

  Widget backButton() => IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: AppColors.mainColor,
      ),
      iconSize: 14.0);

  Widget nextButton(int index) => Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: selectedIndex == index
                  ? () {}
                  : () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InformationB(),
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
                    color: selectedIndex == index
                        ? AppColors.mutedColor
                        : AppColors.mainColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.formBorderColor)),
                child: Center(
                  child: Text(
                    'Next',
                    style: selectedIndex == index
                        ? GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: Dimens.dp14,
                            color: AppColors.neutralDark00)
                        : GoogleFonts.inter(
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
                        color: AppColors.stepsColor,
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
  Widget mainInformation(int index, String gender, Icon genderIcon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            height: 48,
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
                Row(
                  children: [
                    genderIcon,
                    Text(gender),
                  ],
                ),
                if (selectedIndex == index)
                  Radio(
                    value: value,
                    groupValue: groupValue,
                    onChanged: (newValue) => setState(() {
                      groupValue = newValue as int;
                    }),
                    focusColor: AppColors.checkColor,
                    activeColor: AppColors.mainColor,
                    fillColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.mainColor,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget birthdayDate() => Container(
        margin: EdgeInsets.only(top: 16, right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(dateOfBirthday,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: Dimens.dp14,
                    color: AppColors.neutralDark01)),
            SizedBox(
              height: 4,
            ),
            TextField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.mainColor),
                ),
                suffixIcon: Icon(
                  Icons.calendar_month_rounded,
                  color: AppColors.neutralDark01,
                ),
                label: Text('dd/mm/yy'),
                focusColor: AppColors.formBorderColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.formBorderColor),
                  borderRadius: BorderRadius.circular(8),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              SizedBox(
                height: Dimens.dp24,
              ),
              FormFieldText('Full Name', 'Your Name'),
              Padding(
                padding: const EdgeInsets.only(
                  left: Dimens.dp16,
                  bottom: Dimens.dp4,
                  top: Dimens.dp16,
                ),
                child: Text(
                  genderTitle,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: Dimens.dp14,
                      color: AppColors.neutralDark01),
                ),
              ),
              mainInformation(
                0,
                'Male',
                Icon(Icons.male_rounded, color: AppColors.mainColor),
              ),
              SizedBox(
                height: Dimens.dp8,
              ),
              mainInformation(
                1,
                'Female',
                Icon(
                  Icons.female_rounded,
                  color: AppColors.roseFemaleColor,
                ),
              ),
              birthdayDate(),
            ],
          ),
          nextButton(-1),
        ],
      ),
    );
  }
}

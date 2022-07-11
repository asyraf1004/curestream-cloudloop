import 'package:flutter/material.dart';
import 'package:flutter_starter/core/component/molecule/status.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_starter/l10n/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Widget bottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -1),
                blurRadius: 12,
                color: AppColors.neutralDark02.withOpacity(0.02),
              ),
            ],
          ),
          height: Dimens.dp75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Image(
                width: 32,
                height: 32,
                image: AssetImage(MainAssets.homeIcon),
              ),
              Image(
                width: 32,
                height: 32,
                image: AssetImage(
                  MainAssets.listIcon,
                ),
              ),
              Image(
                width: 32,
                height: 32,
                image: AssetImage(
                  MainAssets.accountIcon,
                ),
              ),
              Image(
                width: 32,
                height: 32,
                image: AssetImage(
                  MainAssets.settingsIcon,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget header() => Padding(
          padding: const EdgeInsets.only(top: Dimens.dp50, bottom: Dimens.dp20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 33,
                    height: 24,
                    child: Image(
                      image: AssetImage(MainAssets.unionImg),
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    'CloudLoop',
                    style: GoogleFonts.jost(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
              Container(
                width: 40,
                height: 40,
                child: Image(
                  image: AssetImage(MainAssets.profilePic),
                ),
              ),
            ],
          ),
        );
    Widget mainHomePage() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Health Status Bar',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: Dimens.dp14,
                  color: AppColors.neutralDark01),
            ),
            SizedBox(height: Dimens.dp16),
            Image(
              image: AssetImage(MainAssets.healthStatusImg),
            ),
          ],
        );
    Widget cardBar() => Container(
          margin: EdgeInsets.only(
            bottom: Dimens.dp16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.formBorderColor),
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
                width: 62,
                height: 80,
                child: Column(
                  children: [
                    Container(
                      width: 32,
                      height: 52,
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(MainAssets.loadingImg),
                      ),
                    ),
                    Text(
                      '80%',
                      style: GoogleFonts.inter(
                        fontSize: Dimens.dp10,
                        color: AppColors.neutralDark02,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.formBorderColor),
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
                width: 62,
                height: 80,
                child: Column(
                  children: [
                    Container(
                      width: 44,
                      height: 52,
                      child: Image(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(MainAssets.disableImg),
                      ),
                    ),
                    Text(
                      '11.37 AM',
                      style: GoogleFonts.inter(
                        fontSize: Dimens.dp10,
                        color: AppColors.neutralDark02,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.formBorderColor),
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
                width: 62,
                height: 80,
                child: Column(
                  children: [
                    Container(
                      width: 44,
                      height: 52,
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(MainAssets.insulinImg),
                      ),
                    ),
                    Text(
                      '11.37 AM',
                      style: GoogleFonts.inter(
                        fontSize: Dimens.dp10,
                        color: AppColors.neutralDark02,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.formBorderColor),
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
                width: 62,
                height: 80,
                child: Column(
                  children: [
                    Container(
                      width: 26,
                      height: 52,
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(MainAssets.jarImg),
                      ),
                    ),
                    Text(
                      '11.37 AM',
                      style: GoogleFonts.inter(
                        fontSize: Dimens.dp10,
                        color: AppColors.neutralDark02,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.formBorderColor),
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
                width: 62,
                height: 80,
                child: Column(
                  children: [
                    Container(
                      width: 18,
                      height: 52,
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(MainAssets.batteryImg),
                      ),
                    ),
                    Text(
                      '80%',
                      style: GoogleFonts.inter(
                        fontSize: Dimens.dp10,
                        color: AppColors.neutralDark02,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.dp16),
                child: Center(
                  child: Column(
                    children: [
                      header(),
                      cardBar(),
                      SizedBox(
                        height: 20,
                      ),
                      mainHomePage(),
                      SizedBox(
                        height: Dimens.dp100,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                bottomNavigation(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/core/preferences/text_styles.dart';
import 'package:flutter_starter/features/information/presentation/pages/PageA/page.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_starter/features/sign_in/home.dart';
import 'package:flutter_starter/l10n/l10n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget header() => Container(
        margin: EdgeInsets.only(
            top: Dimens.dp50, left: Dimens.dp16, right: Dimens.dp16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 33,
                  height: 24,
                  child: Image(
                    image: AssetImage(MainAssets.whiteUnionImg),
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
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 18,
                  height: 18,
                  child: Icon(
                    Icons.language,
                    color: AppColors.whiteColor,
                  ),
                ),
                Text(
                  'EN',
                  style: TextStyle(color: AppColors.whiteColor),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget centerPic() => Center(
        child: Container(
          margin: EdgeInsets.only(
            top: 78,
            bottom: 68,
          ),
          child: Image(
            fit: BoxFit.fitWidth,
            image: AssetImage(MainAssets.strokeImg),
          ),
        ),
      );

  Widget titlePage() => Container(
        padding: EdgeInsets.only(
          left: 26,
          right: 26,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to\nCloudLoop',
              style: GoogleFonts.inter(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Automated artificial pancreas system, to help you monitor your health all',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteColor,
                height: 1.75,
              ),
            ),
          ],
        ),
      );

  Widget signInButton() => Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(343, 48),
                primary: AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimens.dp8),
                ),
              ),
              onPressed: () async {
                if (FirebaseAuth.instance.currentUser == null) {
                  GoogleSignInAccount? account = await GoogleSignIn().signIn();

                  if (account != null) {
                    GoogleSignInAuthentication auth =
                        await account.authentication;
                    OAuthCredential credential = GoogleAuthProvider.credential(
                      accessToken: auth.accessToken,
                      idToken: auth.idToken,
                    );
                    await FirebaseAuth.instance
                        .signInWithCredential(credential);
                  }
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    width: 20,
                    height: 20,
                    child: Image(
                      image: AssetImage(MainAssets.googleIcon),
                    ),
                  ),
                  Text(
                    'Continue with Google',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff475569),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Dimens.dp16,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(343, 48),
                primary: AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimens.dp8),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    width: 20,
                    height: 20,
                    child: Image(
                      image: AssetImage(MainAssets.facebookIcon),
                    ),
                  ),
                  Text(
                    'Continue with Facebook',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff475569),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Dimens.dp24,
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5297FF),
      body: Stack(
        children: [
          Column(
            children: [
              header(),
              centerPic(),
              titlePage(),
            ],
          ),
          signInButton(),
        ],
      ),
    );
  }
}

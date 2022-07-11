import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/login/home.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_starter/l10n/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.push<void>(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 128,
              height: 94,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(MainAssets.unionImg),
              ),
            ),
            Text(
              "CloudLoop",
              style: GoogleFonts.jost(
                fontSize: 35,
                fontWeight: FontWeight.w600,
                color: Color(0xff8DBBFF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

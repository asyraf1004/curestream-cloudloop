import 'package:flutter/material.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/core/preferences/dimens.dart';

class StatusBar extends StatelessWidget {
  final Image imageUrl;
  final String status;
  const StatusBar({Key? key, required this.imageUrl, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
          width: 62,
          height: 80,
          margin: EdgeInsets.symmetric(
            horizontal: 7.6,
            vertical: Dimens.dp8,
          ),
          child: Column(
            children: [
              Image(image: AssetImage(imageUrl.toString())),
              Text(status),
            ],
          ),
        ),
      ),
    );
  }
}

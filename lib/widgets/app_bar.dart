import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appBar(
  BuildContext context,
  String title,
  String iconName,
  Function() onBackPressed, [
  Function()? onIconPressed,
]) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new,
        size: 23,
      ),
      onPressed: onBackPressed,
    ),
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 23,
        fontWeight: FontWeight.w600,
      ),
    ),
    actions: [
      if (iconName.isNotEmpty)
        IconButton(
          onPressed: onIconPressed,
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/icons/$iconName.png",
            ),
          ),
        ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FloatingButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const FloatingButton({
    super.key,
    required this.text, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xFF54A8E5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildCard extends StatelessWidget {
  const BuildCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset("assets/icons/card.svg"),
        Positioned(
          left: 17,
          top: 17,
          child: SvgPicture.asset("assets/icons/masterCard.svg"),
        ),
        Positioned(
          right: 31,
          top: 12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Balance",
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "\$120,580,00",
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 12,
          left: 12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Card Holder",
                style: TextStyle(color: Colors.grey[400]),
              ),
              Text(
                "Miles Morales",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const Positioned(
          bottom: 20,
          right: 32,
          child: Text(
            "**** **** **** 51446",
            style: TextStyle(fontSize: 17),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class topMovie extends StatelessWidget {
  final String image;
  final String title;
  final bool select;
  const topMovie({
    super.key,
    required this.image,
    required this.title,
    required this.select,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.only(right: 30, bottom: 7),
          height: 260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset(
            "assets/images/$image.png",
            fit: BoxFit.fill,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        Row(
          children: [
            for (var i = 0; i < 4; i++)
              const Icon(
                Icons.star_rate_rounded,
                color: Color(0xFFFFA235),
              ),
            select
                ? SvgPicture.asset(
                    "assets/icons/star.svg",
                    width: 17,
                    height: 17,
                  )
                : const Icon(
                    Icons.star_rate_rounded,
                    color: Color(0xFFFFA235),
                  )
          ],
        ),
      ],
    );
  }
}

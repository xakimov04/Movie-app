import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CinemaWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String star;
  final String location;
  const CinemaWidget({
    super.key,
    required this.height,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.star,
    required this.location,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: height * 0.121,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5, right: 5),
                  child: Image.asset("assets/images/$image.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Color(0xFF636882),
                          ),
                          Text(
                            location,
                            style: TextStyle(
                                color: Colors.blue,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.star_rate_rounded,
                  color: Color(0xFFFFA235),
                ),
                Text(star)
              ],
            )
          ],
        ),
      ),
    );
  }
}

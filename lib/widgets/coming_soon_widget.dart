import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/data/data.dart';
import 'package:movie/pages/details_movie.dart';

class SoonWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final int index;

  const SoonWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Data data = Data();
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: InkWell(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        onTap: () {
          final item = data.dataMovie[index];
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsMovie(
                image: image,
                movieName: title,
                info: item["info"],
                star: item["star"],
                height: 200,
                time: item["time"],
              ),
            ),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                "assets/images/$image.png",
                fit: BoxFit.cover,
              ),
            ),
            const Gap(6),
            Text(
              title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            Text(
              subTitle,
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: const Color(0xFFAFAFAF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

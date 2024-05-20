import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/modules/save_select_data.dart';
import 'package:movie/pages/select_seats.dart';
import 'package:movie/widgets/app_bar.dart';
import 'package:movie/widgets/floating_button.dart';

class DetailsMovie extends StatefulWidget {
  final String image;
  final String movieName;
  final String info;
  final String star;
  final String time;
  final double height;
  const DetailsMovie({
    super.key,
    required this.image,
    required this.movieName,
    required this.info,
    required this.star,
    required this.height,
    required this.time,
  });

  @override
  State<DetailsMovie> createState() => _DetailsMovieState();
}

class _DetailsMovieState extends State<DetailsMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        "Details Movie",
        "saved",
        () {
          Navigator.pop(context);
        },
        () {
          setState(
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 1),
                  behavior: SnackBarBehavior.fixed,
                  backgroundColor: Colors.white,
                  content: Text(
                    selectData.any((item) => item['image'] == widget.image)
                        ? "already exists"
                        : "${widget.movieName} added",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );

              if (!selectData.any((item) => item['image'] == widget.image)) {
                selectData.add(
                  {
                    "image": widget.image,
                    "title": widget.movieName,
                    "time": widget.time,
                    "star": widget.star,
                  },
                );
              }
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
        child: FloatingButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SelectSeats(),
            ),
          ),
          text: 'Book Ticket',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                height: widget.height,
                child: ListView.builder(
                  padding: const EdgeInsets.all(15),
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      clipBehavior: Clip.hardEdge,
                      margin: const EdgeInsets.only(right: 30, bottom: 7),
                      height: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(
                        "assets/images/${widget.image}.png",
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movieName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(8),
                  Row(
                    children: [
                      Text(
                        widget.info,
                        style: const TextStyle(
                          letterSpacing: 2,
                          color: Color(0xFFBABFC9),
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const Gap(5),
                      const Text(
                        "|",
                        style: TextStyle(color: Color(0xFF696D74)),
                      ),
                      const Gap(5),
                      const Icon(
                        Icons.star_rate_rounded,
                        color: Color(0xFFFFA235),
                      ),
                      Text(
                        widget.star,
                        style: const TextStyle(color: Color(0xFFBABFC9)),
                      )
                    ],
                  ),
                  const Gap(8),
                  Row(
                    children: [
                      ChipMovie("Action"),
                      const Gap(8),
                      ChipMovie("Fiction Fantasy"),
                      const Gap(8),
                      ChipMovie(widget.time),
                    ],
                  ),
                  const Gap(10),
                  Text(
                    "Synopsis",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(5),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "Martial-arts master Shang-Chi confronts the past he thought he left behind when he's drawn into",
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF696D74),
                          ),
                        ),
                        TextSpan(
                          text: " Read More",
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(100)
          ],
        ),
      ),
    );
  }

  Chip ChipMovie(String title) {
    return Chip(
      side: BorderSide.none,
      backgroundColor: const Color(0xFF252932),
      label: Text(
        title,
        style: const TextStyle(color: Color(0xFFB2B5BB)),
      ),
    );
  }
}

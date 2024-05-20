import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/data/data.dart';
import 'package:movie/pages/details_movie.dart';
import 'package:movie/widgets/app_bar.dart';
import 'package:movie/widgets/navigation_widget.dart';
import 'package:movie/widgets/top_movie.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  Data data = Data();
  bool select = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Explore Movie", "search", () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const NavigationWidget(),
          ),
        );
      }),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExploreButton(),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Movies",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "See more",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: const Color(0xFF696D74),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 350,
              child: ListView.builder(
                padding: const EdgeInsets.all(15),
                scrollDirection: Axis.horizontal,
                itemCount: data.topMovie.length,
                itemBuilder: (context, index) {
                  final item = data.topMovie[index];
                  return InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsMovie(
                            image: item["image"],
                            movieName: item["title"],
                            info: item["info"],
                            star: "5.0",
                            height: 400,
                            time: item["time"],
                          ),
                        ),
                      );
                    },
                    child: topMovie(
                      image: item["image"],
                      title: item["title"],
                      select: item["select"],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "See more",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: const Color(0xFF696D74),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: SizedBox(
                height: 320,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.dataRecommend.length,
                  itemBuilder: (context, index) {
                    final item = data.dataRecommend[index];
                    return InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsMovie(
                              image: item["image"],
                              movieName: item["title"],
                              info: item["info"],
                              star: item["star"],
                              height: 400,
                              time: item["time"],
                            ),
                          ),
                        );
                      },
                      child: topMovie(
                        image: item["image"],
                        title: item["title"],
                        select: item["select"],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding ExploreButton() {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
          color: const Color(0xFF32363D),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      select = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:
                          select ? const Color(0xFF54A8E5) : Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        "Now Showing",
                        style: TextStyle(
                            color: select ? Colors.white : Colors.grey,
                            fontSize: 15,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      select = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:
                          select ? Colors.transparent : const Color(0xFF54A8E5),
                    ),
                    child: Center(
                      child: Text(
                        "Upcoming",
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: select ? Colors.grey : Colors.white,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

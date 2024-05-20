import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/data/data.dart';
import 'package:movie/widgets/cinema_widget.dart';
import 'package:movie/widgets/coming_soon_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  SingleChildScrollView _body() {
    double height = MediaQuery.of(context).size.height;
    Data data = Data();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 18, right: 18),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 30, right: 10),
                  child: Icon(
                    Icons.search,
                    color: Color(0xFF6F7277),
                    size: 28,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey.shade800,
                hintText: "Search your favourite movie",
                hintStyle: const TextStyle(color: Color(0xFF6F7277)),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 18),
            child: Text(
              "Coming Soon",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 25,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.395,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.dataMovie.length,
              itemBuilder: (context, index) {
                final item = data.dataMovie[index];
                return SoonWidget(
                  image: item["image"],
                  title: item["title"],
                  subTitle: item["subtitle"],
                  index: index,
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
                  "Cinema Near You",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "See all",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 15,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
          ),
          for (var i in data.dataCinema)
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
              child: CinemaWidget(
                  height: height,
                  image: i["image"],
                  title: i["title"],
                  subtitle: i["subtitle"],
                  star: i["star"],
                  location: i["location"],),
            )
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      toolbarHeight: 90,
      leadingWidth: 250,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back,",
              style: TextStyle(
                  color: const Color(0xFFAFAFAF),
                  fontSize: 20,
                  fontFamily: GoogleFonts.poppins().fontFamily),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Osysyy",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            )
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: InkWell(
            onTap: (){},
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/icons/person.png"),
            ),
          ),
        )
      ],
    );
  }
}

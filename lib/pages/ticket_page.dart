import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/widgets/app_bar.dart';
import 'package:movie/widgets/floating_button.dart';
import 'package:movie/widgets/navigation_widget.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    double withd = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appBar(
        context,
        "E-Ticket",
        "",
        () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Instruction",
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: Text(
                "Come to the cinema, show and scan the barcode to the space provided. Continue to comply with health protocols.",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 18, top: 20, right: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: _buildTicket(withd),
                    ),
                    _buildTicket(withd),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 50),
              child: FloatingButton(
                text: "Download E-Ticket",
                onTap: () {
                  _buildButtom(context, height, withd);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _buildButtom(
      BuildContext context, double height, double witdh) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Container(
              height: height * 0.8,
              width: witdh,
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.08),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color(0xFF54A8E5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 60, left: 30, right: 30),
                          child: Text(
                            "Your ticket has been downloaded",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Adele is a Scottish heiress whose extremely wealthy family owns estates and grounds. When she was a teenager. Read More",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: height * 0.03,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NavigationWidget(),
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xFF1B1E25),
                              ),
                              child: const Center(
                                child: Text(
                                  "Back To Home",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: height * 0.395,
              left: witdh * 0.35,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF54A8E5),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Image.asset("assets/icons/paper_download.png"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Stack _buildTicket(double withd) {
    return Stack(
      children: [
        Container(
          width: withd * 0.88,
          height: 450,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 25, top: 25, right: 50),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Film: Shang-Chi",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "e-ticket",
                      style: TextStyle(
                        color: Colors.red,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Gap(30),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _builText("Date", "06/09/2021"),
                      _builText("Seats", "c4, c5"),
                    ],
                  ),
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _builText("Location", "Viva Cinema"),
                    _builText("Time", "01.00 PM"),
                  ],
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _builText("Payment", "Successful"),
                    _builText("Order", "1904566"),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: withd * 0.81,
          bottom: 110,
          child: const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black,
          ),
        ),
        Positioned(
          bottom: 135,
          child: Row(
            children: [
              for (var i = 0; i < 50; i++)
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: 8,
                    height: 3,
                    color: Colors.black,
                  ),
                )
            ],
          ),
        ),
        Positioned(
          left: withd * 0.81,
          bottom: 110,
          child: const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black,
          ),
        ),
        Positioned(
          bottom: 20,
          left: 15,
          right: 20,
          child: Image.asset(
            "assets/icons/shtrix_code.png",
            fit: BoxFit.cover,
            width: withd,
            height: 80,
          ),
        ),
      ],
    );
  }

  Column _builText(
    String text,
    String date,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: const Color(0xFF717171),
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        Text(
          date,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

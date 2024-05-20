import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/widgets/app_bar.dart';
import 'package:movie/widgets/navigation_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List name = [
    "Personal Data",
    "Email & Payment",
    "Deactive Account",
    "Notification",
    "Your Ticket",
    "Logout",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        "Settings",
        "",
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const NavigationWidget(),
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Image.asset("assets/icons/person.png"),
                title: Text(
                  "Miles Morales",
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  "Film Hunter",
                  style: TextStyle(
                      color: const Color(0xFFAFAFAF),
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
              const Gap(20),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 19),
                child: Divider(
                  thickness: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Account",
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Column(
                children: [
                  for (var i = 0; i <= 2; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: settingsButton(name[i], (i + 1).toString()),
                    ),
                  const Gap(10),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 19),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  const Gap(25),
                  for (var i = 3; i <= 5; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: settingsButton(name[i], (i + 1).toString()),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ListTile settingsButton(String title, String icon) {
    return ListTile(
      onTap: () {},
      leading: SvgPicture.asset(
        "assets/settings/$icon.svg",
        fit: BoxFit.fill,
        width: 56,
        height: 56,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}

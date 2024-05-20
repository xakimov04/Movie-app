import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:movie/modules/save_select_data.dart';
import 'package:movie/widgets/app_bar.dart';
import 'package:movie/widgets/navigation_widget.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  String title = "C4, C5, C6";
  int i = 1;
  String selectedCinema = "Cinema";
  int _selectedIndex = -1;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  void _toggleContainer(int index) {
    setState(() {
      _selectedIndex = _selectedIndex == index ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String formattedDate =
        DateFormat("dd MMMM yyyy").format(DateTime.now());

    return Scaffold(
      appBar: appBar(
        context,
        "Saved Plan",
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
      body: selectData.isEmpty
          ? _buildEmptyState()
          : Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1. $formattedDate",
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: selectData.length,
                      itemBuilder: (context, index) => _buildListItem(index),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Text(
        "No information found",
        style: TextStyle(
          fontSize: 20,
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildListItem(int index) {
    final item = selectData[index];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Dismissible(
        key: Key(item["id"].toString()),
        direction: DismissDirection.horizontal,
        onDismissed: (direction) {
          setState(() {
            selectData.removeAt(index);
          });
        },
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20.0),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        child: Column(
          children: [
            ListTile(
              onTap: () => _toggleContainer(index),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/${item["image"]}.png",
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "action",
                    style: TextStyle(color: Colors.blue),
                  ),
                  Text(
                    item["title"],
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                item["time"],
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star_rate_rounded,
                    color: Colors.amber.shade800,
                  ),
                  Text(
                    item["star"].toString(),
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            if (_selectedIndex == index) _buildExpandedContainer(index),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedContainer(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: 375.0,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Cinema",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const Gap(15),
            _cinemaButton(),
            const Gap(15),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date",
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      const Gap(10),
                      _buildDatePicker(),
                    ],
                  ),
                ),
                const Gap(15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Time",
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      const Gap(10),
                      _buildTimePicker(),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(10),
            Row(
              children: [
                _buildSeats(title),
                const Gap(15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Person",
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  i == 1 ? i = 1 : i--;
                                });
                              },
                              icon: SvgPicture.asset("assets/icons/minus.svg"),
                            ),
                            Text(
                              i.toString(),
                              style: const TextStyle(fontSize: 15),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  i == 10 ? i = 1 : i++;
                                });
                              },
                              icon: SvgPicture.asset("assets/icons/plus.svg"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Gap(15),
            Row(
              children: [
                Expanded(child: _buildCheckoutButton(index)),
                const Gap(15),
                _buildDeleteButton(index),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildSeats(String title) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Seats",
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey),
            ),
            child: ExpansionTile(
              leading: Text(
                title,
                style: const TextStyle(fontSize: 15),
              ),
              title: const Text(""),
              children: [
                _buildseatsname("C4"),
                _buildseatsname("C5"),
                _buildseatsname("C6"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildseatsname(String cinemaName) {
    return TextButton(
      onPressed: () {
        setState(() {
          title = cinemaName;
        });
      },
      child: Text(cinemaName),
    );
  }

  Widget _buildCheckoutButton(int index) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => _buildCheckoutDialog(context),
        );
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFF54A8E5),
        ),
        child: Center(
          child: Text(
            "Checkout",
            style: TextStyle(
              fontSize: 20,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton(int index) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        setState(() {
          selectData.removeAt(index);
        });
      },
      child: Container(
        width: 65,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blue),
        ),
        child: Center(
          child: SvgPicture.asset("assets/icons/delete.svg"),
        ),
      ),
    );
  }

  Widget _buildCheckoutDialog(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = -1;
        });
        Navigator.pop(context);
      },
      child: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return GestureDetector(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2021),
          lastDate: DateTime(2025),
        );
        if (date != null) {
          setState(() {
            selectedDate = date;
          });
        }
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              DateFormat('dd MMMM yyyy').format(selectedDate),
              style: TextStyle(
                fontSize: 15,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Icon(Icons.keyboard_arrow_down_rounded),
          ],
        ),
      ),
    );
  }

  Widget _buildTimePicker() {
    return GestureDetector(
      onTap: () async {
        final time = await showTimePicker(
          context: context,
          initialTime: selectedTime,
        );
        if (time != null) {
          setState(() {
            selectedTime = time;
          });
        }
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              selectedTime.format(context),
              style: TextStyle(
                fontSize: 15,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Icon(Icons.keyboard_arrow_down_rounded),
          ],
        ),
      ),
    );
  }

  Widget _cinemaButton() {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      child: ExpansionTile(
        leading: Text(
          selectedCinema,
          style: const TextStyle(fontSize: 15),
        ),
        title: const Text(""),
        children: [
          const Divider(thickness: 2),
          _buildCinemaOption("Viva Cinema"),
          _buildCinemaOption("EbonyLife Cinema"),
        ],
      ),
    );
  }

  Widget _buildCinemaOption(String cinemaName) {
    return TextButton(
      onPressed: () {
        setState(() {
          selectedCinema = cinemaName;
        });
      },
      child: Text(cinemaName),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:movie/pages/checkout_page.dart';
import 'package:movie/widgets/app_bar.dart';
import 'package:movie/widgets/floating_button.dart';

class SelectSeats extends StatefulWidget {
  const SelectSeats({super.key});

  @override
  _SelectSeatsState createState() => _SelectSeatsState();
}

class _SelectSeatsState extends State<SelectSeats> {
  List<int> selectedIndices = [];
  String selectedCinema = "Cinema";
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar(
        context,
        "Select Seats",
        "",
        () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Cinema",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const Gap(10),
              _buildCinemaSelector(),
              const Gap(15),
              Row(
                children: [
                  Expanded(child: _buildDatePicker()),
                  const Gap(15),
                  Expanded(child: _buildTimePicker()),
                ],
              ),
              const Gap(30),
              Image.asset(
                "assets/icons/blue_color.png",
                fit: BoxFit.cover,
              ),
              const Gap(10),
              _buildSeatRows(width),
              const Gap(35),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.blue,
                        size: 15,
                      ),
                      Gap(10),
                      Text("Selected"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.red,
                        size: 15,
                      ),
                      Gap(10),
                      Text("Reserved"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle_outlined,
                        color: Colors.grey,
                        size: 15,
                      ),
                      Gap(10),
                      Text("Available"),
                    ],
                  )
                ],
              ),
              const Gap(45),
              FloatingButton(
                text: "Checkout",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckoutPage(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSeatRows(double width) {
    return Column(
      children: [
        _buildSeatRow(0, 6, width, 3),
        const Gap(10),
        _buildSeatRow(6, 14, width, 10),
        const Gap(10),
        _buildSeatRow(14, 22, width, 18, booked: true),
        const Gap(10),
        _buildSeatRow(22, 30, width, 26, booked: true),
        const Gap(10),
        _buildSeatRow(30, 36, width, 33),
      ],
    );
  }

  Widget _buildSeatRow(int start, int end, double width, int left,
      {bool booked = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = start; i < end; i++) _buildSeat(i, width, left, booked),
      ],
    );
  }

  Widget _buildSeat(int index, double width, int left, bool booked) {
    bool isSelected = selectedIndices.contains(index);
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: booked
          ? null
          : () {
              setState(() {
                if (isSelected) {
                  selectedIndices.remove(index);
                } else {
                  selectedIndices.add(index);
                }
              });
            },
      child: Container(
        margin: index == left
            ? EdgeInsets.only(left: width * 0.08)
            : const EdgeInsets.only(left: 5),
        width: 33,
        height: 33,
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blue
              : (booked ? Colors.red : Colors.transparent),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildCinemaSelector() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      child: ExpansionTile(
        title: Text(selectedCinema, style: const TextStyle(fontSize: 15)),
        children: [
          const Divider(thickness: 2),
          _buildCinemaOption("Viva Cinema"),
          _buildCinemaOption("EbonyLife Cinema"),
        ],
      ),
    );
  }

  Widget _buildCinemaOption(String name) {
    return TextButton(
      onPressed: () {
        setState(() {
          selectedCinema = name;
        });
      },
      child: Text(name),
    );
  }

  Widget _buildDatePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Date",
          style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Gap(10),
        GestureDetector(
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
          child: _buildPickerContainer(
            Text(
              DateFormat('dd MMMM yyyy').format(selectedDate),
              style: _pickerTextStyle(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Time",
          style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Gap(10),
        GestureDetector(
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
          child: _buildPickerContainer(
            Text(
              selectedTime.format(context),
              style: _pickerTextStyle(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPickerContainer(Widget child) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          child,
          const Icon(Icons.keyboard_arrow_down_rounded),
        ],
      ),
    );
  }

  TextStyle _pickerTextStyle() {
    return TextStyle(
      fontSize: 15,
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.w500,
    );
  }
}

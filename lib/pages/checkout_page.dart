import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:movie/modules/card_namuber_input.dart';
import 'package:movie/modules/email_input.dart';
import 'package:movie/pages/ticket_page.dart';
import 'package:movie/widgets/app_bar.dart';
import 'package:movie/widgets/card_widget.dart';
import 'package:movie/widgets/floating_button.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    double witdh = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appBar(
        context,
        "Checkout",
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
              padding: const EdgeInsets.only(left: 18, right: 18, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payment Method",
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Change"),
                  ),
                ],
              ),
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 18, top: 15),
                child: Row(
                  children: [
                    BuildCard(),
                    Gap(15),
                    BuildCard(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 18),
              child: Text(
                "Payment Details",
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const EmailForm(),
            const Padding(
              padding: EdgeInsets.only(left: 18, top: 5),
              child: Text(
                "Cardholder Name",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 10, right: 18),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Miles Morales',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18, top: 15, bottom: 5),
              child: Text(
                "Card Number",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            const CardInputWidget(),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Row(
                children: [
                  Expanded(child: _buildDatePicker()),
                  const Gap(15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 18, top: 5),
                          child: Text(
                            "CVV",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 18,
                            top: 10,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "123",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 18,
                right: 18,
                top: 20,
                bottom: 10,
              ),
              child: FloatingButton(
                text: "Pay Now    |    \$99.8",
                onTap: () {
                  _buildButtom(context, height, witdh);
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
                            "Your payment was successful",
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
                                  builder: (context) => const TicketPage(),
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
                                  "See E-Ticket",
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
                        child: Image.asset("assets/icons/chekced.png"),
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

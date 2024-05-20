import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardInputWidget extends StatefulWidget {
  const CardInputWidget({super.key});

  @override
  _CardInputWidgetState createState() => _CardInputWidgetState();
}

class _CardInputWidgetState extends State<CardInputWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 5),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: '**** **** **** 51446',
          hintStyle: const TextStyle(fontSize: 13),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
        keyboardType: TextInputType.number,
        maxLength: 16,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        textAlign: TextAlign.left,
        style: const TextStyle(
          letterSpacing: 5.0,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

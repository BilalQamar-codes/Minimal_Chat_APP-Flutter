import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hintText;
  final bool obsecuretext;
  final TextEditingController controller;

  const MyTextfield({
    super.key,
    required this.hintText,
    required this.obsecuretext,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        obscureText: obsecuretext,
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white, // Reference a valid color
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade500, // Reference a valid color
              ),
            ),
            fillColor: Colors.white, // Reference a valid color
            hintText: hintText, // Use the passed hintText
            filled: true,
            hintStyle: TextStyle(
              color: Colors.grey.shade300,
            )),
        // maxLength: 50,
      ),
    );
  }
}

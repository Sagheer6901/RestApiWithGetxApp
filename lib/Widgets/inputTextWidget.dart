import 'package:flutter/material.dart';
import 'package:untitled1/constants.dart';

class InputTextWidget extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final keyboardType;
  final controller;

  const InputTextWidget(
      {required this.labelText,
      required this.icon,
      required this.obscureText,
      required this.keyboardType,
      this.controller})
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        elevation: 0.0,
        shadowColor: primaryColor,
        borderRadius: BorderRadius.circular(10.0),
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 15.0),
          child: TextFormField(
              controller: controller,
              obscureText: obscureText,
              autofocus: false,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                icon: Icon(
                  icon,
                  color: shadeColor,
                  size: 28.0, /*Color(0xff224597)*/
                ),
                labelText: labelText,
                labelStyle: TextStyle(color: shadeColor, fontSize: 14.0),
                hintText: '',
                enabledBorder: InputBorder.none,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                ),
                border: InputBorder.none,
              ),
              validator: (val) {
                if (val!.isEmpty) {
                  return 'le champ de texte est vide!';
                }
              }),
        ),
      ),
    );
  }
}

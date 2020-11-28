import 'package:flutter/material.dart';

class CustomInputText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Enter Tracking Number...',
        labelStyle: TextStyle(fontSize: 13.0),
        focusColor: Colors.black,
        hoverColor: Colors.black,
        suffixIcon: Icon(Icons.search),
      ),
      keyboardType: TextInputType.text,
    );
  }
}

import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String labeltext;
  final inPutType;
  final double iwidth;

  CustomInput({
    this.labeltext,
    this.inPutType,
    this.iwidth,
  });

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    Size maxSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: maxSize.width * widget.iwidth,
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400],
                  offset: Offset(6.0, 6.0),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-6.0, -6.0),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                ),
              ]),
          child: TextField(
            keyboardType: widget.inPutType,
            decoration: InputDecoration(
              hintText: widget.labeltext,
              hintStyle: TextStyle(fontSize: 14),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            ),
          ),
        ),
      ],
    );
  }
}

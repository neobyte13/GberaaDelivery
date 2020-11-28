import 'package:flutter/material.dart';
import '../constants.dart';

class CardWithCheck extends StatefulWidget {
  final imageName;
  final labelText;
  final buttontap;
  const CardWithCheck({
    Key key,
    @required this.maxSize,
    this.imageName,
    this.labelText,
    @required this.buttontap,
  }) : super(key: key);

  final Size maxSize;

  @override
  _CardWithCheckState createState() => _CardWithCheckState();
}

class _CardWithCheckState extends State<CardWithCheck> {
  bool icon = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          icon = !icon;
        });
      },
      child: Container(
        width: widget.maxSize.width * 0.45,
        height: widget.maxSize.height * 0.3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: Colors.grey[400]),
          image: DecorationImage(
            image: AssetImage(
              'assets/images/${widget.imageName}',
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
              offset: Offset(5.0, 5.0),
              blurRadius: 8.0,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-5.0, -5.0),
              blurRadius: 16.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  icon == true
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: Colors.grey,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  widget.labelText,
                  style: kLightGreyText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

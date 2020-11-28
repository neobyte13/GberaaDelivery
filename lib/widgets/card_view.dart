import 'package:flutter/material.dart';
import '../constants.dart';

class CardView extends StatelessWidget {
  final imageName;
  final labelText;
  final buttontap;
  const CardView({
    Key key,
    @required this.maxSize,
    this.imageName,
    this.labelText,
    this.buttontap,
  }) : super(key: key);

  final Size maxSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontap,
      child: Container(
        width: maxSize.width * 0.45,
        height: maxSize.height * 0.25,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: Colors.grey[400]),
          image: DecorationImage(
            scale: maxSize.width * 0.05,
            image: AssetImage(
              'assets/images/$imageName',
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
        child: Container(
            alignment: Alignment(0, 0.8),
            child: Text(
              labelText,
              style: kLightGreyText,
            )),
      ),
    );
  }
}

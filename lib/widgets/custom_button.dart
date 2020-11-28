import 'package:flutter/material.dart';
import '../constants.dart';

class CustomButton extends StatefulWidget {
  final bwidth;
  final bheight;
  final buttonTap;
  final buttonText;
  final Color color;
  final pageRoute;
  final snackText;

  const CustomButton({
    Key key,
    @required this.maxSize,
    this.bwidth,
    this.bheight,
    this.buttonTap,
    this.buttonText,
    this.color,
    this.pageRoute,
    this.snackText,
  }) : super(key: key);

  final Size maxSize;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          backgroundColor: Colors.white,
          content: Container(
            width: 10,
            height: 10,
            child: Image(
              fit: BoxFit.contain,
              image: AssetImage('assets/gif/25.gif'),
            ),
          ),
          action: SnackBarAction(
            label: 'Creating..',
            textColor: kMainColor,
            onPressed: () {},
          ),
        );
        Scaffold.of(context).showSnackBar(snackBar);
        setState(() {
          Navigator.pushNamed(context, widget.pageRoute);
        });
      },
      child: Container(
        width: widget.maxSize.width * widget.bwidth,
        height: widget.maxSize.height * widget.bheight,
        decoration: BoxDecoration(
            color: widget.color,
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
        child: Center(
          child: Text(
            widget.buttonText,
            style: kMainHeading.copyWith(
                fontSize: 20.0, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  @override
  _CounterButtonState createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int x = 0;
  void add() {
    setState(() {
      x++;
    });
  }

  void minus() {
    setState(() {
      if (x != 0) {
        x--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size maxSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
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
          child: Container(
            width: maxSize.width * 0.5,
            height: maxSize.height * 0.06,
            child: Center(child: Text('$x Package Count')),
          ),
        ),
        GestureDetector(
          onTap: () {
            minus();
          },
          child: Container(
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
            child: Container(
              width: maxSize.width * 0.12,
              height: maxSize.height * 0.06,
              child: Icon(Icons.minimize),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            add();
          },
          child: Container(
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
            child: Container(
              width: maxSize.width * 0.12,
              height: maxSize.height * 0.06,
              child: Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}

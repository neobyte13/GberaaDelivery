import 'package:flutter/material.dart';

class InputTextBox extends StatefulWidget {
  final String labeltext;

  InputTextBox({
    this.labeltext,
  });

  @override
  _InputTextBoxState createState() => _InputTextBoxState();
}

class _InputTextBoxState extends State<InputTextBox> {
  bool iconVisible = false;
  bool isHidden = true;

  void toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
      iconVisible == true ? iconVisible = false : iconVisible = true;
      print(iconVisible);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.86,
            height: MediaQuery.of(context).size.height * 0.06,
            child: TextField(
              decoration: InputDecoration(
                hintText: widget.labeltext,
                hintStyle: TextStyle(fontSize: 14),
                prefixIcon: widget.labeltext == "User Name"
                    ? Icon(Icons.email)
                    : Icon(Icons.lock),
                suffixIcon: widget.labeltext == "Password"
                    ? IconButton(
                        icon: iconVisible == false
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: toggleVisibility,
                      )
                    : null,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFD3D3D3),
                    width: 1.0,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(
                    width: 1.0,
                  ),
                ),
              ),
              obscureText: widget.labeltext == "Password" ? isHidden : false,
              keyboardType: TextInputType.text,
            )),
      ],
    );
  }
}

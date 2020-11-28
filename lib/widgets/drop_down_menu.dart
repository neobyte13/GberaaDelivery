import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropDownData extends StatefulWidget {
  List<String> category = [''];
  final elevation;
  final labelText;
  final labelstyle;
  final itemStyle;
  final iconColor;
  DropDownData(
      {this.category,
      this.elevation,
      this.labelText,
      this.labelstyle,
      this.itemStyle,
      this.iconColor});
  @override
  _DropDownDataState createState() => _DropDownDataState();
}

class _DropDownDataState extends State<DropDownData> {
  String selectedCategory;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      elevation: widget.elevation,
      dropdownColor: Color(0xFF161615),
      hint: Text(
        widget.labelText,
        style: widget.labelstyle,
      ),
      value: selectedCategory,
      icon: Icon(
        Icons.arrow_drop_down,
        color: widget.iconColor,
      ),
      underline: Container(),
      onChanged: (newValue) {
        setState(() {
          selectedCategory = newValue;
        });
      },
      items: widget.category.map(
        (category) {
          return DropdownMenuItem(
            child: Text(
              category,
              style: widget.itemStyle,
            ),
            value: category,
          );
        },
      ).toList(),
    );
  }
}

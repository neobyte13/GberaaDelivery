import 'dart:ui';

import 'package:gberaadelivery/constants.dart';
import 'package:gberaadelivery/widgets/common_app_bar.dart';
import 'package:gberaadelivery/widgets/custom_button.dart';
import 'package:gberaadelivery/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class ShipmentCreate extends StatefulWidget {
  @override
  _ShipmentCreateState createState() => _ShipmentCreateState();
}

class _ShipmentCreateState extends State<ShipmentCreate> {
  bool b1isPressed = false;
  bool b2isPressed = false;
  String labeltextOnPress;
  @override
  Widget build(BuildContext context) {
    Size maxSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF161615),
      body: SafeArea(
        child: Column(
          children: [
            CommonAppBar(
              maxSize: maxSize,
              labeltext: 'Package Details',
              aheight: 0.09,
              icolor: Colors.white,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(maxSize.width * 0.06),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Enter the Package Details',
                        style: kMainHeading.copyWith(fontSize: 25.0),
                      ),
                      Image(
                        width: maxSize.width * 0.6,
                        image: AssetImage('assets/images/calculate.png'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomInput(
                            iwidth: 0.4,
                            inPutType: TextInputType.number,
                            labeltext: labeltextOnPress == null
                                ? 'Choose Weight'
                                : 'Weight in $labeltextOnPress',
                          ),
                          WeightSwitcher(
                            maxSize: maxSize,
                            labelText: 'Kg',
                            fontColor:
                                b1isPressed ? Colors.white : Colors.black,
                            containerColor:
                                b1isPressed ? Colors.black : Colors.grey[100],
                            buttonNoPressed: () {
                              setState(() {
                                b1isPressed = !b1isPressed;
                                b2isPressed = false;
                                labeltextOnPress = 'in Kg';
                              });
                            },
                          ),
                          WeightSwitcher(
                            maxSize: maxSize,
                            labelText: 'Lbs',
                            fontColor:
                                b2isPressed ? Colors.white : Colors.black,
                            containerColor:
                                b2isPressed ? Colors.black : Colors.grey[100],
                            buttonNoPressed: () {
                              setState(() {
                                b2isPressed = !b2isPressed;
                                b1isPressed = false;
                                labeltextOnPress = 'in Lbs';
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: maxSize.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomInput(
                            iwidth: 0.2,
                            inPutType: TextInputType.number,
                            labeltext: 'Length',
                          ),
                          Text('X'),
                          CustomInput(
                            iwidth: 0.2,
                            inPutType: TextInputType.number,
                            labeltext: 'Width',
                          ),
                          Text('X'),
                          CustomInput(
                            iwidth: 0.2,
                            inPutType: TextInputType.number,
                            labeltext: 'Height',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: maxSize.height * 0.04,
                      ),
                      CustomButton(
                        maxSize: maxSize,
                        bwidth: 0.4,
                        bheight: 0.06,
                        buttonText: 'Add Details',
                        color: kMainColor,
                        pageRoute: '/location',
                        buttonTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeightSwitcher extends StatelessWidget {
  const WeightSwitcher({
    Key key,
    @required this.maxSize,
    this.labelText,
    this.fontColor,
    this.containerColor,
    this.buttonNoPressed,
  }) : super(key: key);

  final Size maxSize;
  final String labelText;
  final Color fontColor;
  final Color containerColor;
  final buttonNoPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonNoPressed,
      child: Container(
        decoration: BoxDecoration(
            color: containerColor,
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
          width: maxSize.width * 0.14,
          height: maxSize.height * 0.07,
          child: Center(
              child: Text(
            labelText,
            style: TextStyle(fontWeight: FontWeight.bold, color: fontColor),
          )),
        ),
      ),
    );
  }
}

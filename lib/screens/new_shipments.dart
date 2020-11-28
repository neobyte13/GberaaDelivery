import 'package:gberaadelivery/widgets/card_with_check.dart';
import 'package:gberaadelivery/widgets/common_app_bar.dart';
import 'package:gberaadelivery/widgets/counter_button.dart';
import 'package:gberaadelivery/widgets/custom_button.dart';

import 'package:flutter/material.dart';

import '../constants.dart';

class NewShipments extends StatefulWidget {
  @override
  _NewShipmentsState createState() => _NewShipmentsState();
}

class _NewShipmentsState extends State<NewShipments> {
  String counterlabel = 'Document Count';
  DateTime selectedDate = DateTime.now();
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
              labeltext: 'Create New Shipment',
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
                child: Column(
                  children: [
                    SizedBox(
                      height: maxSize.height * 0.07,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CardWithCheck(
                          maxSize: maxSize,
                          labelText: 'Parcel',
                          imageName: 'envelope.png',
                          buttontap: () {
                            counterlabel = 'Documnet Count';
                          },
                        ),
                        CardWithCheck(
                          maxSize: maxSize,
                          labelText: 'Package',
                          imageName: 'parcel.png',
                          buttontap: () {
                            counterlabel = 'Documnet Count';
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CounterButton(),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
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
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: maxSize.width * 0.09,
                              right: maxSize.width * 0.09,
                            ),
                            child: DropdownButton(
                                elevation: 10,
                                underline: Container(),
                                hint: Text('Choose Delivery Company'),
                                items: <String>['A', 'B', 'C', 'A']
                                    .map((String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (_) {}),
                          ),
                        ),
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
                            width: maxSize.width * 0.12,
                            height: maxSize.height * 0.06,
                            child: InkWell(
                                onTap: () async {
                                  final DateTime picked = await showDatePicker(
                                    context: context,
                                    initialDate: selectedDate,
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2021),
                                    helpText: 'Select pickup date',
                                    fieldLabelText: 'Pickup date',
                                  );
                                  if (picked != null && picked != selectedDate)
                                    setState(() {
                                      selectedDate = picked;
                                    });
                                },
                                child: Icon(Icons.calendar_today)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: maxSize.height * 0.07,
                    ),
                    CustomButton(
                      maxSize: maxSize,
                      bheight: 0.07,
                      bwidth: 0.7,
                      buttonText: 'Create',
                      color: kMainColor,
                      pageRoute: '/shipmentcreate',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

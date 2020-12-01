import 'package:gberaadelivery/widgets/card_with_check.dart';
import 'package:gberaadelivery/widgets/common_app_bar.dart';
import 'package:gberaadelivery/widgets/custom_button.dart';

import 'package:flutter/material.dart';

import '../constants.dart';

class NewShipments extends StatefulWidget {
  @override
  _NewShipmentsState createState() => _NewShipmentsState();
}

class _NewShipmentsState extends State<NewShipments> {
  String counterlabel = 'Document Count';
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
                            counterlabel = 'Parcel';
                          },
                        ),
                        CardWithCheck(
                          maxSize: maxSize,
                          labelText: 'Package',
                          imageName: 'parcel.png',
                          buttontap: () {
                            counterlabel = 'Package';
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      maxSize: maxSize,
                      bheight: 0.07,
                      bwidth: 0.7,
                      buttonText: 'Create',
                      color: kMainColor,
                      pageRoute: '/location',
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

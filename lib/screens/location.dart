import 'package:gberaadelivery/constants.dart';
import 'package:gberaadelivery/widgets/common_app_bar.dart';
import 'package:gberaadelivery/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LocationSelect extends StatefulWidget {
  @override
  _LocationSelectState createState() => _LocationSelectState();
}

class _LocationSelectState extends State<LocationSelect> {
  bool swapLocation = true;
  @override
  Widget build(BuildContext context) {
    Size maxSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            CommonAppBar(
              maxSize: maxSize,
              labeltext: 'Pick Up and Delivery',
              aheight: 0.09,
              icolor: Colors.black,
            ),
            Container(
              width: maxSize.width,
              height: maxSize.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: maxSize.width * 0.4,
                        height: maxSize.height * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
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
                        child: Hero(
                          tag: 2,
                          child: Image(
                            image: swapLocation
                                ? AssetImage('assets/images/1.png')
                                : AssetImage('assets/images/3.png'),
                          ),
                        ),
                      ),
                      Container(
                        width: maxSize.width * 0.4,
                        height: maxSize.height * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
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
                        child: Hero(
                          tag: 1,
                          child: Image(
                            image: swapLocation
                                ? AssetImage('assets/images/3.png')
                                : AssetImage('assets/images/1.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF161615),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: maxSize.width * 0.05,
                    right: maxSize.width * 0.05,
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: maxSize.height * 0.07,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '15 August 2020',
                              style: kNormalText,
                            ),
                            Icon(
                              Icons.calendar_today,
                              color: kMainColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: maxSize.height * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Text(
                                swapLocation ? 'Pickup' : 'Delivery',
                                style: kLightGreyText,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                child: Icon(
                                  Icons.swap_horiz,
                                  color: kMainColor,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                swapLocation ? 'Delivery' : 'PickUp',
                                style: kLightGreyText,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: maxSize.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: maxSize.width * 0.4,
                              child: Text(
                                'CHRIS NISWANDEE SMALLSYS INC 795 E DRAGRAM TUCSON AZ 85705 USA',
                                style: kNormalText.copyWith(
                                  fontSize: 10.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              width: maxSize.width * 0.4,
                              child: Text(
                                'CHRIS NISWANDEE SMALLSYS INC 795 E DRAGRAM TUCSON AZ 85705 USA',
                                style: kNormalText.copyWith(
                                  fontSize: 10.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: maxSize.height * 0.02,
                        ),
                        Container(
                          height: 1.0,
                          width: maxSize.width,
                          color: Colors.grey[800],
                        ),
                        SizedBox(
                          height: maxSize.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Package Details',
                                  style: kLightGreyText.copyWith(
                                    fontSize: 10.0,
                                  ),
                                ),
                                SizedBox(
                                  height: maxSize.height * 0.02,
                                ),
                                Text(
                                  'Basic Package',
                                  style: kNormalText,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '150 Kg',
                                  style: kNormalText,
                                ),
                                SizedBox(
                                  height: maxSize.height * 0.001,
                                ),
                                Text(
                                  '25 x 25 x 25',
                                  style: kNormalText,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: maxSize.height * 0.07,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "500\₦ - 700\₦",
                                  style: kMainHeading.copyWith(
                                    color: kMainColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                  ),
                                ),
                                Text(
                                  'Estimated Price',
                                  style: kLightGreyText.copyWith(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: maxSize.width * 0.4,
                              height: maxSize.height * 0.06,
                              decoration: BoxDecoration(
                                  color: kMainColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: kMainColor,
                                      offset: Offset(0.5, 0.5),
                                      blurRadius: 5.0,
                                    ),
                                    BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(-1.0, -1.0),
                                      blurRadius: 10.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ]),
                              child: Center(
                                child: Text(
                                  'Submit',
                                  style: kMainHeading.copyWith(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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

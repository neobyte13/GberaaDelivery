import 'package:gberaadelivery/widgets/card_view.dart';
import 'package:gberaadelivery/widgets/custom_inputtext.dart';
import 'package:gberaadelivery/widgets/drop_down_menu.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size maxSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF161615),
      body: SafeArea(
        child: Column(
          children: [
            Container(
                child: Padding(
              padding: EdgeInsets.only(
                left: maxSize.width * 0.04,
                right: maxSize.width * 0.04,
                bottom: maxSize.height * 0.04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.my_location,
                        color: Colors.white,
                        size: 13.0,
                      ),
                      SizedBox(
                        width: maxSize.width * 0.02,
                      ),
                      DropDownData(
                        category: [
                          'Lagos',
                          'Ogun',
                        ],
                        elevation: 0,
                        labelText: 'Location',
                        iconColor: Colors.white,
                        labelstyle: kNormalText,
                        itemStyle: kNormalText.copyWith(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Send Your Package Anywhere!',
                          style: kMainHeading.copyWith(
                              color: Colors.white, fontSize: 20.0),
                        ),
                        SizedBox(
                          height: maxSize.height * 0.01,
                        ),
                        /*Text(
                          'Track your shipment in one click',
                          style: kLightGreyText.copyWith(fontSize: 15.0),
                        ),**/
                      ],
                    ),
                  ),
                  /*Padding(
                    padding: EdgeInsets.only(top: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: maxSize.width * 0.65,
                          height: maxSize.height * 0.06,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: CustomInputText(),
                          ),
                        ),
                        Container(
                          width: maxSize.width * 0.15,
                          height: maxSize.height * 0.06,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: kMainColor,
                          ),
                        ),
                      ],
                    ),
                  ),**/
                ],
              ),
            )),
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
                      height: maxSize.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CardView(
                          maxSize: maxSize,
                          labelText: 'New Delivery',
                          imageName: '2.png',
                          buttontap: () {
                            Navigator.pushNamed(context, '/newshimpent');
                          },
                        ),
                        CardView(
                          maxSize: maxSize,
                          labelText: 'Completed Deliveries',
                          imageName: 'completed.png',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: maxSize.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CardView(
                          maxSize: maxSize,
                          labelText: 'Track Deliveries',
                          imageName: '1.png',
                        ),
                        CardView(
                          maxSize: maxSize,
                          labelText: 'Get your Groceries',
                          imageName: 'calculate.png',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

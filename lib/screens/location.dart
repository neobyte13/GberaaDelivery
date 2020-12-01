import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gberaadelivery/constants.dart';
import 'package:gberaadelivery/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gberaadelivery/widgets/custom_input.dart';

class LocationSelect extends StatefulWidget {
  @override
  _LocationSelectState createState() => _LocationSelectState();
}

class _LocationSelectState extends State<LocationSelect> {
  bool swapLocation = true;
  final _db = FirebaseFirestore.instance;
  DateTime selectedDate = DateTime.now();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _deliveryController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  bool _success;
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
                  color: Colors.black87,
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: maxSize.height * 0.07,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${selectedDate.toLocal()}".split(' ')[0],
                                style: kNormalText,
                              ),
                              InkWell(
                                  onTap: () async {
                                    final DateTime picked =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate,
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2021),
                                      helpText: 'Select pickup date',
                                      fieldLabelText: 'Pickup date',
                                    );
                                    if (picked != null &&
                                        picked != selectedDate)
                                      setState(() {
                                        selectedDate = picked;
                                      });
                                  },
                                  child: Icon(Icons.calendar_today)),
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
                                child: TextFormField(
                                  controller: _pickupController,
                                  decoration: const InputDecoration(
                                      labelText: 'Pickup Address'),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please enter a valid address';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                width: maxSize.width * 0.4,
                                child: TextFormField(
                                  controller: _deliveryController,
                                  decoration: const InputDecoration(
                                      labelText: 'Delivery Address'),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please enter a valid address';
                                    }
                                    return null;
                                  },
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
                                  Container(
                                    width: maxSize.width * 0.5,
                                    child: TextFormField(
                                      controller: _notesController,
                                      decoration: const InputDecoration(
                                          labelText: 'Notes'),
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Please enter additional notes';
                                        }
                                        return null;
                                      },
                                    ),
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
                                    "\₦500",
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
                                  child: InkWell(
                                    onTap: () {
                                      Random random = new Random();
                                      var curUser =
                                          FirebaseAuth.instance.currentUser;
                                      _db
                                          .collection("ditems")
                                          .doc(curUser.uid +
                                              (random.nextInt(9999999) +
                                                      0000001)
                                                  .toString())
                                          .set({
                                        "pickup": _pickupController.text,
                                        "delivery": _deliveryController.text,
                                        "notes": _notesController.text,
                                        "date":
                                            selectedDate.toLocal().toString(),
                                      }).then((_) {
                                        _pickupController.clear();
                                        _deliveryController.clear();
                                        _notesController.clear();
                                        print(
                                            'Success!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
                                      });
                                    },
                                    child: Text(
                                      'Submit',
                                      style: kMainHeading.copyWith(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600),
                                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}

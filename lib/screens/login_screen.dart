import 'package:gberaadelivery/constants.dart';
import 'package:gberaadelivery/widgets/custom_button.dart';
import 'package:gberaadelivery/widgets/input_text_box.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size maxSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/login.png'),
                Text(
                  'Deliver Everything',
                  style: kMainHeading,
                ),
                SizedBox(
                  height: maxSize.height * 0.03,
                ),
                InputTextBox(
                  labeltext: 'Email',
                ),
                SizedBox(
                  height: maxSize.height * 0.03,
                ),
                InputTextBox(
                  labeltext: 'Password',
                ),
                SizedBox(
                  height: maxSize.height * 0.07,
                ),
                CustomButton(
                  maxSize: maxSize,
                  bheight: 0.07,
                  bwidth: 0.7,
                  buttonText: 'Login',
                  pageRoute: '/homescreen',
                  color: kMainColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an Account ?  ',
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Sign up Now!',
                          style: TextStyle(
                            color: Color(0xFFFBAA29),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:brickgame/constants.dart';
// import 'package:brickgame/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'login_screen.dart';

// class SignupScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Size maxSize = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Container(
//           margin: EdgeInsets.all(20),
//           child: Column(
//             children: [
//               Image.asset('assets/images/login.png'),
//               Text(
//                 'Deliver Everything',
//                 style: kMainHeading,
//               ),
//               SizedBox(
//                 height: maxSize.height * 0.03,
//               ),
//               Text(
//                 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
//                 style: kLightGreyText,
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(
//                 height: maxSize.height * 0.07,
//               ),
//               CustomButton(
//                 maxSize: maxSize,
//                 bheight: 0.07,
//                 bwidth: 0.7,
//                 buttonTap: () {
//                   Navigator.pushNamed(context, '/homescreen');
//                 },
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Doesn\'t have an Account ?  ',
//                     ),
//                     GestureDetector(
//                       onTap: () {},
//                       child: Text(
//                         'Sign up Now!',
//                         style: TextStyle(
//                           color: Color(0xFFFBAA29),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

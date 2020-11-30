import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gberaadelivery/screens/home_screen.dart';
import 'package:gberaadelivery/screens/location.dart';
import 'package:gberaadelivery/screens/login_screen.dart';
import 'package:gberaadelivery/screens/new_shipments.dart';
import 'package:gberaadelivery/screens/onboard_screen/onboard_screen.dart';
import 'package:gberaadelivery/screens/shipment_create.dart';
import 'package:flutter/material.dart';
import 'package:gberaadelivery/screens/signup_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('Error. Turn on internet'),
              ),
            );
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
                title: 'Gberaa Delivery',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.orange,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                initialRoute: '/',
                routes: {
                  '/': (context) => OnBoardingPage(),
                  '/login': (context) => LoginScreen(),
                  '/signup': (context) => SignupScreen(),
                  '/homescreen': (context) => HomeScreen(),
                  '/newshimpent': (context) => NewShipments(),
                  '/shipmentcreate': (context) => ShipmentCreate(),
                  '/location': (context) => LocationSelect(),
                });
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.orange,
            ),
          );
        });
  }
}

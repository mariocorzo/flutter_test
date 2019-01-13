// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_tests/blocs/bloc_provider_test.dart';
import 'package:flutter_module_tests/config/Configuration.dart';
import 'package:flutter_module_tests/routes/home_route.dart';
import 'package:flutter_module_tests/routes/login_route.dart';
import 'package:flutter_module_tests/routes/record_route.dart';
import 'package:flutter_module_tests/routes/splash_route.dart';
import 'package:flutter_module_tests/services/authentication.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  final BaseAuth _auth = FirebaseAuthentication();

  @override
  Widget build(BuildContext context) {
    return BlocProviderTest(
      child: MaterialApp(
        title: 'MyUTN',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        navigatorObservers: <NavigatorObserver>[observer],
        home: _getInitialScreen(),
        routes: {'/splash': (context) => SplashScreen(), '/home': (context) => HomeScreen(), '/record': (context) => RecordScreen()},
      ),
    );
  }

  _getInitialScreen() {
    return Configuration.getInitialScreen();
  }

  Widget _getInitialScreen1() {
    return new StreamBuilder<FirebaseUser>(
      stream: _auth.observeAuthState(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print("FLUTTER TEST FIREBASEAUTH CONNECTION STATE ==>  ${snapshot.connectionState}");
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        } else {
          if (snapshot.hasData) {
//            return MainScreen(firestore: firestore, uuid: snapshot.data.uid);
          print(snapshot.data);
            return HomeScreen();
          }
          return LoginScreen();
        }
      },
    );
  }

}

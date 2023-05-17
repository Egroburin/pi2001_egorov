import 'dart:js';

import 'package:flutter/material.dart';
import 'package:kursach/pages/home.dart';
import 'package:kursach/pages/describe.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/desc': (context) => describes(),
      },
    ));

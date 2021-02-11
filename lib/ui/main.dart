import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'file:///K:/Paul/Documents/Developpement/traveller_flutter/lib/ui/main/MyNavigationBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyNavigationBar()
    );
  }
}

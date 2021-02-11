import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traveller_flutter/ui/Translator.dart';
import 'package:traveller_flutter/ui/Weather.dart';
import 'package:traveller_flutter/ui/main/MainController.dart';

import 'file:///K:/Paul/Documents/Developpement/traveller_flutter/lib/ui/converter/Converter.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyNavigationBarState();
  }
}

class MyNavigationBarState extends State<MyNavigationBar>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  MainController _controller = MainController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.money_dollar),
            label: "Convertisseur",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.translate),
            label: "Traduction",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cloud_sun_rain),
            label: "Météo",
          )
        ],
        onTap: (int index) {
          this.onTabHandler(index);
        },
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  void onTabHandler(int index) {
    _controller.jumpToPage(index);
    this.setState(() {
      this._currentIndex = index;
    });
  }

  Widget getBody() {
    return PageView(
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      controller: _controller,
      children: [
        Converter(),
        Translator(),
        Weather(),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

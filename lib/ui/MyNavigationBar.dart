import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traveller_flutter/ui/Converter.dart';
import 'package:traveller_flutter/ui/Translator.dart';
import 'package:traveller_flutter/ui/Weather.dart';

class MyNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyNavigationBarState();
  }
}

class MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  Widget _converter = Converter();
  Widget _translator = Translator();
  Widget _weather = Weather();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.euro),
            label: "Convertisseur",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: "Traduction",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: "Météo",
          )
        ],
        onTap: (int index) {
          this.onTabHandler(index);
        },
      ),
    );
  }

  void onTabHandler(int index) {
    this.setState(() {
      this._selectedIndex = index;
    });
  }

  Widget getBody() {
    switch (_selectedIndex) {
      case 0:
        return this._converter;
        break;
      case 1:
        return this._translator;
        break;
      case 2:
        return this._weather;
        break;
      default:
        throw Error();
        break;
    }
  }
}

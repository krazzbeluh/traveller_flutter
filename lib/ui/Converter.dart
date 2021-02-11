import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traveller_flutter/ui/geometry/MeasureSize.dart';

class Converter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ConverterState();
  }
}

class ConverterState extends State<Converter> {
  final double _valueFontSize = 35;
  final double _currencyFontSize = 20;
  Size s;

  @override
  Widget build(BuildContext context) {
    final double centerButtonHeight = 150;

    return Stack(
      children: [
        Column(
          children: [
            MeasureSize(
              onChange: (size) {
                setState(() {
                  s = size;
                });
              },
              child: Container(
                color: Colors.blue,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  children: [
                    Text(
                      "1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _valueFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "EUR",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _currencyFontSize,
                      ),
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.center,
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text(
                      "1",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: _valueFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "USD",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: _currencyFontSize,
                      ),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            )),
          ],
        ),
        Positioned(
          top: (s?.height ?? 0) - (centerButtonHeight / 2),
          child: Container(
              alignment: Alignment.center,
              height: centerButtonHeight,
              width: MediaQuery.of(context).size.width,
              child: ClipOval(
                child: Material(
                  color: Colors.blue,
                  child: InkWell(
                    child: SizedBox(
                      width: centerButtonHeight,
                      height: centerButtonHeight,
                      child: Icon(
                        CupertinoIcons.equal_circle_fill,
                        color: Colors.white,
                        size: centerButtonHeight * 0.93,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              )),
        ),
      ],
    );
  }
}

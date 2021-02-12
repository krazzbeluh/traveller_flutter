import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traveller_flutter/ui/geometry/MeasureSize.dart';

import 'TranslatorController.dart';

class Translator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ConverterState();
  }
}

class ConverterState extends State<Translator>
    with AutomaticKeepAliveClientMixin {
  TranslatorController _viewController;

  final double _valueFontSize = 20;
  final double _languageFontSize = 30;
  Size s;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                      "Français",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _languageFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 16,
                      height: MediaQuery.of(context).size.height / 4,
                      child: TextField(
                        maxLines: null,
                        minLines: null,
                        expands: true,
                        controller: _viewController.textFieldController,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: _valueFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
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
                    Spacer(
                      flex: 2,
                    ),
                    Text(
                      "English",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: _languageFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 16,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            "",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: _valueFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
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
                        CupertinoIcons.chevron_down_circle_fill,
                        color: Colors.white,
                        size: centerButtonHeight * 0.93,
                      ),
                    ),
                    onTap: () => _viewController.didTapTranslateButton(),
                  ),
                ),
              )),
        ),
      ],
    );
  }

  @override
  void initState() {
    _viewController = TranslatorController();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;
}

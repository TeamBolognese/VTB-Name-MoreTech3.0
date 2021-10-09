import 'package:flutter/material.dart';
import 'package:moretech_app/constants.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog({Key? key, this.child}) : super(key: key);

  final Widget? child;
  final _duration = Duration(milliseconds: 256);

  late final double _width;
  late final double _heigth;

  late final double _minWidth;
  late final double _minHeigth;

  final _showNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width * 0.85;
    _heigth = MediaQuery.of(context).size.width * 0.85;

    _minWidth = MediaQuery.of(context).size.width * 0.80;
    _minHeigth = MediaQuery.of(context).size.width * 0.80;

    return AlertDialog();
  }

  void show() {
    _showNotifier.value = true;
  }

  void hide() {
    _showNotifier.value = false;
  }
}

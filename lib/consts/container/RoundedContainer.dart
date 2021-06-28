import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constants.dart';

class RoundedContainer extends StatelessWidget {
  RoundedContainer({@required this.prefix, @required this.suffix});

  final String prefix;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
      child: TextField(
        readOnly: true,
        textAlign: TextAlign.center,
        style: BlackPawsTextFieldTextStyle,
        decoration: InputDecoration(
          hintText: prefix + suffix,
          hintStyle: BlackPawsTextFieldTextStyle,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: BlackPawsColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: BlackPawsColor, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constants.dart';

class BlackPawsCircleAvatar extends StatelessWidget {
  BlackPawsCircleAvatar({@required this.radius});

  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: CheerganizeYellowColor,
      radius: radius + 1.0,
      child: CircleAvatar(
          backgroundImage: AssetImage('images/logo.jpg'),
          radius: radius,
          backgroundColor: Color(0xFF181d21)),
    );
  }
}

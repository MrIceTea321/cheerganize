import 'package:Cheerganize/consts/Constants.dart';
import 'package:Cheerganize/consts/RoundedContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartAnimationButton extends StatefulWidget {
  final Function onPressed;

  StartAnimationButton({ Key key, this.onPressed}):super(key: key);

  @override
  _StartAnimationButtonState createState() => _StartAnimationButtonState();

}
class _StartAnimationButtonState extends State<StartAnimationButton>{

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: widget.onPressed,
      backgroundColor: BlackPawsColor,
      child:
        Icon(Icons.play_arrow, color: BasicBlackColor,size: 50,
        )
    );
  }
}
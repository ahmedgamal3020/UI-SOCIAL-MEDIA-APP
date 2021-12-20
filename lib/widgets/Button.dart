import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  required double width,
  required  onPressed,
  required String? text,
  Coloes =Colors.blue,
  ColorsText=Colors.black,
})=> Container(
    width:width,
    decoration: BoxDecoration(
      color:Coloes,
      borderRadius:BorderRadius.circular(20)
  ),
  child: MaterialButton(
    onPressed:onPressed,
    child:
    Text('$text',style: TextStyle(color:ColorsText),),
  ),
);
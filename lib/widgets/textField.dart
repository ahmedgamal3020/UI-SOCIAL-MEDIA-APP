import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultTextField({
  @required label,
  prefix,
  OnChanged,
  OnTap,
  validator,
  IconData? suffix,
  required TextEditingController controller,
  var keyBoardType,
  obscureText =false,
  onPressed
})=>  TextFormField(
  onTap:OnTap ,
  keyboardType: keyBoardType,
  controller:controller ,
  validator:validator ,
  maxLines: 1,
onChanged: OnChanged,
obscureText:obscureText ,
decoration:InputDecoration(
labelText: label,
  prefixIcon:prefix ,
  suffixIcon:suffix !=null ? IconButton(
    onPressed: onPressed,
      icon: Icon(suffix)) :null,
  border: OutlineInputBorder()
),
);
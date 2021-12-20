
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
bool addStory=false;
// ignore: camel_case_types
class profileAvatar extends StatelessWidget {
  final String? imageUrl;
  final bool isActive;
  final bool hasBorder;
  final double Radius;
  const profileAvatar(
      {Key? key,
        required this.Radius,
        required this.imageUrl,
        this.hasBorder=false,
        this.isActive=false
      }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        CircleAvatar(
        radius: Radius,
        backgroundImage:NetworkImage(imageUrl!)
        ),
        isActive?Positioned(
            bottom: 2,
            right: 5,
            child:Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                border: Border.all(width: 2,color: Colors.white)
              ),
            )
        ):SizedBox.shrink()
      ],
    );
  }
}

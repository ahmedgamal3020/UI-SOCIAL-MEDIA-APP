
import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/data/data.dart';
import 'package:demo/model/user_model.dart';
import 'package:demo/screens/profileUsers.dart';
import 'package:demo/ssd.dart';
import 'package:demo/widgets/profileAvatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class onlineAccount extends StatelessWidget {
  final List<User> onlineUsers;
  const onlineAccount({
    Key? key,
    required this.onlineUsers
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        scrollDirection:Axis.horizontal ,
        itemCount: onlineUsers.length,
          itemBuilder:(context,index)
          {
            final User user=onlineUsers[index] ;
            return Container(
              padding: const EdgeInsets.all(2),
              child: InkWell(
                onTap: (){
                  imageProfile=user.imageUrl;
                  nameProfile=user.name;
                  Navigator.push(context, MaterialPageRoute(builder: (contex)=>profileUsers()));

                },
                child: profileAvatar(
                  Radius: 20,
                  imageUrl:user.imageUrl! ,
                isActive: true,
                ),
              ),
            );
          }
      ),
    );
  }
}

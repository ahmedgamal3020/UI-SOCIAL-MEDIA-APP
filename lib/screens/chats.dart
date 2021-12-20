
import 'dart:ui';

import 'package:demo/data/data.dart';
import 'package:demo/widgets/profileAvatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chats extends StatelessWidget {
  const chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Padding(
          padding: const EdgeInsets.only(left: 16),
          child: CircleAvatar(backgroundImage:currentUser.myImageUrl,
          radius: 20,
          ),
        ),
        title: const Text('Chats',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
      ),
      body:ListView.builder(
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  profileAvatar(imageUrl:'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
                       ,Radius:30,
                    isActive: true,
                      ),
                  const SizedBox(width: 5,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Text('ahmed Gamalahmed Gamalahmed Gamalahmed Gamalahmed Gamal',
                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                      ),
                      const SizedBox(height: 2,),
                      Text('hi ahmed how are you ahmed Gamalahmed Gamalahmed Gamalahmed Gamalahmed Gamalahmed Gamalahmed Gamalahmed Gamal',
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,

                      ),


                    ],),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blue[600],
                    radius: 5,
                  )

                ],
              ),
            );
          },
          itemCount: onlineUsers.length),
    );
  }
}


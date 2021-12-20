import 'dart:ui';
import 'package:demo/data/data.dart';
import 'package:demo/model/post_model.dart';
import 'package:demo/ssd.dart';
import 'package:demo/widgets/postContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({Key? key}) : super(key: key);

  @override
  _profileScreenState createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:[
                      const SizedBox(width: 5,),
                      CircleAvatar(
                        radius: 59,
                        backgroundImage:currentUser.myImageUrl

    ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(myname,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            const SizedBox(height: 5,),
                            Container(width: double.infinity,
                              height: 1,
                              color: Colors.grey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              Column(
                                children: [
                                  TextButton(onPressed:(){},
                                      child:const Text('Followers',style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                      ),
                                  ),
                                  const SizedBox(height: 2,),
                                  Text('10,000',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              Column(
                                children: [
                                  TextButton(onPressed:(){},
                                    child:const Text('Folloing',style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  ),
                                  const SizedBox(height: 2,),
                                  Text('200',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                ],
                              ),

                            ],),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed:(){},
                        child:const Text('Change Photo',style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                      Row(
                        children: [
                          Text('Posts => ',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                          ),
                          const SizedBox(width: 5,),
                          Text('200',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                        ],
                      ),
                    ],
                  ),
                  Container(width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:posts.length,
                itemBuilder:(context,index){
                  final Post post=posts[index];
                  if (post.user.name==currentUser.name){
                    return postContainer(post: posts[index]);
                  }
                 return SizedBox();
                }
                ),
          ],
        ),
      ),
    );
  }

  }

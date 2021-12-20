import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo/data/data.dart';
import 'package:demo/model/post_model.dart';
import 'package:demo/ssd.dart';
import 'package:demo/widgets/create_post.dart';
import 'package:demo/widgets/onlineAccount.dart';
import 'package:demo/widgets/postContainer.dart';
import 'package:demo/widgets/stouries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// ignore: camel_case_types
class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        extendBody: true,
        key: scaffoldKey,
        backgroundColor: Colors.grey[200],
        body: CustomScrollView(
             slivers:[
               SliverToBoxAdapter(
                 child:  createPost(currentUser:currentUser),
               ),
               SliverToBoxAdapter(
                 child: onlineAccount(onlineUsers:onlineUsers),
               ),
               SliverToBoxAdapter(
                 child: Stories(
                   stories:stories,
                   currentUser: currentUser,
                 ),
               ),
               SliverList(delegate: SliverChildBuilderDelegate((context,index)
               {
                 final Post post=posts[index];
                 return postContainer(post:post);
               },
                 childCount: posts.length,
               ),

               )
             ]
         )

       );

  }
}

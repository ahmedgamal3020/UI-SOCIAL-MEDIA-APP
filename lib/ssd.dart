import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo/model/story_model.dart';
import 'package:demo/screens/chats.dart';
import 'package:demo/screens/createPost.dart';
import 'package:demo/screens/homeScreen.dart';
import 'package:demo/screens/notficaton.dart';
import 'package:demo/screens/profile.dart';
import 'package:flutter/material.dart';
import 'data/data.dart';
var scaffoldKey =GlobalKey<ScaffoldState>();
final navigtionKey=GlobalKey<CurvedNavigationBarState>();
File ? get;
File? imagePost;
var chickControler;
List showScreens=[
  notfictionScreen(),
  createPosts(),
  homeScreen(),
];
String? comment;
bool showlike=false;
int cunterLikes =20;
int cunterComments =20;
int cuntershares =20;
int? asd;
var image;
var imageProfile;
var nameProfile;
var imageMyStory=get;
bool viewstory=true;
var myname;
var myphoto;
var indexpostprofile=1;
int cuntFollowers=10000;
int cuntFollowing=112;


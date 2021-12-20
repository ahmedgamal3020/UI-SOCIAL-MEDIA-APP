import 'dart:io';
import 'package:demo/data/data.dart';
import 'package:demo/model/user_model.dart';
import 'package:demo/screens/profile.dart';
import 'package:demo/ssd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

//this widget is to enter the post in text fild
bool showPostColorPressed=false;


class createPost extends StatefulWidget {
final User currentUser;
const createPost({Key? key,required this.currentUser}) : super(key: key);

  @override
  _createPostState createState() => _createPostState();
}

class _createPostState extends State<createPost> {

 Widget build(BuildContext context) {
   @override
   File? _image;
   final imagePicker=ImagePicker();
   Future getImage() async {
     var image = await imagePicker.getImage(source: ImageSource.gallery);
     setState(() {
       _image = File(image!.path);
     });
   }
   return Container(
     padding: const EdgeInsets.all(10),
         child: Column(
           children: [
             Row(
               children: [
                 InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder:(context)=>profileScreen()));
                     myname=currentUser.name;
                   },
                   child: CircleAvatar(
                     radius: 24,
                     backgroundImage:currentUser.myImageUrl ,
                     backgroundColor: Colors.grey[200],
                   ),
                 ),
                 const SizedBox(
                   width: 10,
                 ),
                 Expanded(
                   child: Container(
                     height: 40,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30),
                     ),
                     child: TextField(
                       decoration: InputDecoration(
                           hintText: 'what’s on your moid?',
                         border: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.grey,width: 1),
                           borderRadius: BorderRadius.circular(15)
                         )
                       ),
                       onTap: (){
                         final navgationKey =navigtionKey.currentState!;
                         navgationKey.setPage(1);

                       },
                     ),
                   ),
                 ),

               ],
             ),
           ],
         ),
       );
  }
}

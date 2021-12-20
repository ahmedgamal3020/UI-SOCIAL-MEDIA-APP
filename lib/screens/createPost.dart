import 'dart:io';
import 'package:demo/data/data.dart';
import 'package:demo/screens/home.dart';
import 'package:demo/screens/homeScreen.dart';
import 'package:demo/ssd.dart';
import 'package:demo/widgets/profileAvatar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

TextEditingController postContriller =TextEditingController();

// ignore: camel_case_types
class createPosts extends StatefulWidget {
  const createPosts({Key? key}) : super(key: key);

  @override
  _createPostsState createState() => _createPostsState();
}

// ignore: camel_case_types
class _createPostsState extends State<createPosts> {
  File? _image;
  final imagePicker=ImagePicker();
  Future getImage() async {
    // ignore: deprecated_member_use
    var image = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Create Post',style: TextStyle(color: Colors.grey),),
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color:chickControler == null ? Colors.grey[300]:Colors.blue,
            ),
            child: TextButton(
                onPressed: ()
                {
                  imagePost=_image;
                  setState(() {
                    chickControler=postContriller.text.toString();
                  });
                 final navgationKey =navigtionKey.currentState!;
                 navgationKey.setPage(2);
                },
                child: Text('Post',style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                 CircleAvatar(
              radius:20,
              backgroundImage:currentUser.myImageUrl
                 ),
              const SizedBox(width: 5,
             ),
                  Text(currentUser.name),
              const Spacer(),
                  IconButton(
                      icon: Icon(
                        MdiIcons.image,
                        color: Colors.green,
                        size: 30,
                      ),
                      onPressed:getImage
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey,
                width: double.infinity,
                height: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(fontSize: 20),
                controller:postContriller ,
                onChanged:(value)
                {
                  chickControler=_image;
                  setState(() {
                    chickControler = value;
                    if(value.isEmpty)
                      {
                        setState(() {
                          chickControler =null;
                        });
                      }
                    print(chickControler);
                  });
                },
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'What’s on your mind ?',
                  prefixStyle: TextStyle(fontSize: 30),
                  hoverColor: Colors.grey,
                  border:InputBorder.none
                ),
              ),
              const SizedBox(
                height: 10,
              ),
             _image==null ?SizedBox() : Image.file(_image!),


            ],
          ),
        ),
      ),
    );
  }
}
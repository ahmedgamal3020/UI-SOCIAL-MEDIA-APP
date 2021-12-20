import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/screens/home.dart';
import 'package:demo/ssd.dart';
import 'package:demo/widgets/Button.dart';
import 'package:demo/screens/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
class addPhoto extends StatefulWidget {
  const addPhoto({Key? key}) : super(key: key);

  @override
  _addPhotoState createState() => _addPhotoState();
}
// ignore: camel_case_types
class _addPhotoState extends State<addPhoto> {
  File? _image;
  final imagePicker=ImagePicker();
  Future getImage() async {
   var image = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {

      _image = File(image!.path);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
            const  SizedBox(height: 20,),
             Center(
               child: Text('enter your photo',
                 style:TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),
               ),
             ),
             const SizedBox(height: 20,),
              Center(
               child: Stack(
                 alignment: AlignmentDirectional.bottomCenter,
                 children:
                 [
                 _image!=null?CircleAvatar(
                     backgroundImage: FileImage(_image!),
                     radius: 110,

                   )
                    :const CircleAvatar(
                   backgroundImage:AssetImage('Assets/fristphoto.jpg'),
                   radius: 110,

                 ),
                   IconButton(
                       icon:Icon(Icons.camera_alt,size: 40,),
                       onPressed:getImage
                   )
                 ],
               ),
             ),
              Spacer(),
              defaultButton(
                Coloes: _image==null ? Colors.grey[300]:Colors.blue,
                  width: 100,
                  onPressed: (){
                    get=_image;
                    if(_image!=null)
                      {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>home()
                            )
                        );
                      }
                    },
                  text: 'Next',ColorsText: _image== null ?Colors.black:Colors.white
              )
            ],
          ),
        ),
      ),
    );

  }
}



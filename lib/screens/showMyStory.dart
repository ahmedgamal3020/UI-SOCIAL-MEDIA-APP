import 'dart:io';
import 'dart:ui';
import 'package:demo/data/data.dart';
import 'package:demo/ssd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

bool showpost=true;
TextEditingController perfctContraller=TextEditingController();
TextEditingController cptionContraller=TextEditingController();
class showMyStory extends StatefulWidget {
  const showMyStory({Key? key}) : super(key: key);
  @override
  _showMyStoryState createState() => _showMyStoryState();
}

class _showMyStoryState extends State<showMyStory> {
  File? _imagegallery;
  final imagePicker=ImagePicker();
  Future getImagegallery() async {
    // ignore: deprecated_member_use
    var imageStory = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      _imagegallery = File(imageStory!.path);
      imageMyStory=_imagegallery;
      viewstory=false;

    }
    );
  }
  File? _imageCamera;
  final imagePickercamera=ImagePicker();
  Future getImageCamera() async {
    // ignore: deprecated_member_use
    var imageCamera = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _imageCamera = File(imageCamera!.path);
      imageMyStory=_imageCamera;
      viewstory=false;
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            const SizedBox(width: 10 ,),
            CircleAvatar(
              radius: 20,
              backgroundImage: currentUser.myImageUrl,
            ),
          ],
        ),
        backgroundColor: Colors.blue,
        title:Text(currentUser.name,style: TextStyle(fontSize: 20),)
        ,
        elevation: 0,
        actions: [
          Container(
            child: IconButton(
                icon:Icon(Icons.image,color: Colors.black,) ,
                onPressed:getImagegallery,
            ),
          ),
          IconButton(
            icon:Icon(Icons.camera_alt,color: Colors.black,) ,
            onPressed:getImageCamera,
          ),

        ],
      ),
      body: viewstory?Container(
        height: double.infinity,
        color: Colors.blue,
        child: Stack(
          children: [
            Center(
              child: TextField(
                controller:perfctContraller ,
                onChanged: (value){
                  if(value.isEmpty){
                    setState(() {
                      showpost=true;
                    });
                  }
                  else{
                    setState(() {
                      showpost=false;
                    });
                  }
                },
                cursorColor: Colors.white,
                cursorHeight: 50,
                autofocus: true,
                smartDashesType: SmartDashesType.disabled,
                textAlign: TextAlign.center,
                showCursor: true,
                maxLines: 6,
                style: TextStyle(fontSize: 30, color: Colors.white),
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: 'Type Anything perfect',
                    focusColor: Colors.grey,
                    border: InputBorder.none,
                    hoverColor: Colors.white,
                    prefixStyle: TextStyle(fontSize: 30)
                ),

              ),
            ),
            showpost? SizedBox():Positioned(
              bottom: 20,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50)
                ),
                child: MaterialButton(onPressed:(){},
                  minWidth: 20,
                  child: Icon(Icons.send,color: Colors.blue,),
                ),
              ),
            )

          ],
        ),
      ):Container(
        color: Colors.black,
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                    child:_imagegallery==null? Image.file(_imageCamera!,fit: BoxFit.cover,):Image.file(_imagegallery!,fit: BoxFit.cover,)
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 270,
                      child: TextField(
                        controller: cptionContraller,
                        keyboardType: TextInputType.text,
                        maxLines:12,
                        minLines: 1,
                        style:TextStyle(color: Colors.white,) ,
                        decoration: InputDecoration(
                            hintText: 'type a cption',
                            hasFloatingPlaceholder:false ,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(20)
                            ),
                          focusedBorder: OutlineInputBorder(

                            borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(20)

                        ),
                          filled: true,
                          fillColor: Colors.blueGrey,
                          hintStyle: TextStyle(height:0)
                        ),
                      ),

                    ),
                    const SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: MaterialButton(
                        onPressed:(){
                        setState(() {
                          imageMyStory=_imagegallery;
                          Navigator.pop(context);
                        });
                      }
                        ,
                        minWidth: 20,
                        child: Icon(Icons.send,color: Colors.black,),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:demo/ssd.dart';
import 'package:demo/widgets/profileAvatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class showStory extends StatefulWidget {
  const showStory({Key? key,
  }) : super(key: key);
  @override
  _showStoryState createState() => _showStoryState();
}

TextEditingController messageContraller=TextEditingController();
class _showStoryState extends State<showStory> {
  double percent=0.0;
  late Timer _timer;
  String ? stop;

  void stertTime(){
    _timer=Timer.periodic(Duration(milliseconds: 3),(timer){
      percent+=0.001;
      setState(() {
        if(percent>1)
          {
            _timer.cancel();
            Navigator.pop(context);
          }
      });

    }
    );
  }
  @override
  void initState() {
    stertTime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onLongPressStart:(value){
          _timer.cancel();
        },
        onLongPressEnd:(value){stertTime();},
        child: Container(
          color: Colors.black87,
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Image(image: image,fit: BoxFit.cover,),
                ),
              LinearProgressIndicator(
                value:percent ,
              ),
              Positioned(
                top: 26,
                  left: 10,
                  child:  Row(
                    children: [
                      profileAvatar(imageUrl:imageProfile==null?SizedBox():imageProfile
                      ,Radius: 20,),
                      const SizedBox(width: 10,),
                      Text('$nameProfile',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
                    ],
                  )),
              Positioned(
                bottom: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 270,
                      color: Colors.black54,
                      child: TextFormField(
                        controller:messageContraller ,
                        keyboardType: TextInputType.text,
                        maxLines:12,
                        minLines: 1,
                        style:TextStyle(color: Colors.white,) ,
                        decoration: InputDecoration(
                            focusColor: Colors.black54,
                            hintText: 'send message' ,
                            labelStyle: TextStyle(color: Colors.blue),
                            hasFloatingPlaceholder:false ,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.transparent)
                          ),
                          filled: true,
                          fillColor: Colors.blueGrey
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: MaterialButton(onPressed:(){
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                        minWidth: 20,
                        child: Icon(Icons.send,color: Colors.black,),
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      )

    );
  }
}

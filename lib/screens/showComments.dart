
import 'package:demo/data/data.dart';
import 'package:demo/ssd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
bool colorLike=false;
TextEditingController messageContraller=TextEditingController();
class showcomment extends StatefulWidget {
  const showcomment({Key? key}) : super(key: key);
  @override
  _showcommentState createState() => _showcommentState();
}

class _showcommentState extends State<showcomment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        leadingWidth: 0,
        backgroundColor: Colors.white,
        title: Container(
          child: Row(
            children: [
              const Icon(MdiIcons.handOkay,color: Colors.redAccent,size: 20,),
              const SizedBox(width: 3,),
              InkWell(
                  onTap: (){},
                  child: Text('$cunterLikes',style: TextStyle(color: Colors.black,fontSize: 15),)),
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: (){
              setState(() {
                showlike =! showlike;
                if(showlike==true)
                {
                  cunterLikes ++;
                  print('$cunterLikes');
                }
                else{
                  setState(() {
                    cunterLikes --;
                  });
                }
              });
            },
            child:showlike ? Icon(MdiIcons.handOkay,color: Colors.redAccent,):Icon( MdiIcons.handOkay,color: Colors.black,),
          ),
          const SizedBox(width: 10,)
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            ListView.separated(
                itemBuilder:
                    (context,index){
                  final user=onlineUsers[index];
                  return Row(
                    children: [
                      CircleAvatar (
                        radius: 20,
                        backgroundImage:NetworkImage(user.imageUrl!) ,
                        backgroundColor: Colors.blue,
                      ),
                      const SizedBox(width: 4,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('  ${user.name}  ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            const SizedBox(height: 2,),
                            Text('  ahmed  '),

                          ],
                        ),
                      ),
                      Spacer(),
                      TextButton(onPressed: (){setState(() {
                        colorLike =! colorLike;
                      });}, child: Text('Love',style: TextStyle(color: colorLike? Colors.black54:Colors.red),))
                    ],
                  );
                    },
                separatorBuilder:(context,index)=>const SizedBox(height: 8,),
                itemCount:5),
            Positioned(
              bottom: 0,
              child:Row(
                children: [
                  Container(
                  width: 270,
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
                        fillColor: Colors.grey
                    ),
                  ),

            ),
                  const SizedBox(width: 5,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
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
            )
          ],
        ),
      ),
    );

  }
}


import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/data/data.dart';
import 'package:demo/model/post_model.dart';
import 'package:demo/screens/profile.dart';
import 'package:demo/screens/profileUsers.dart';
import 'package:demo/screens/showComments.dart';
import 'package:demo/ssd.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:demo/widgets/profileAvatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
bool showIcon=true;
bool onlongpress=false;

// ignore: camel_case_types
class postContainer extends StatefulWidget {
  final Post post;
  const postContainer({Key? key,required this.post}) : super(key: key);

  @override
  _postContainerState createState() => _postContainerState();
}

class _postContainerState extends State<postContainer> {
  @override
  Widget build(BuildContext context) {
    // ignore: unrelated_type_equality_checks
    bool showImage=false;
    if(widget.post.imageUrl!=null)
      {
        showImage=true;
      }
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _postContainer(post :widget.post),
                const SizedBox(height: 8,),
                Container(
                   decoration: BoxDecoration(
                     color: showImage?Colors.black87:Colors.white,
                     borderRadius: BorderRadius.circular(10 ),
                   ),

                     clipBehavior:Clip.antiAliasWithSaveLayer ,
                     child: widget.post.imageUrl!=null? CachedNetworkImage(imageUrl:widget.post.imageUrl)
                         : Text(widget.post.caption,style: TextStyle(fontWeight: FontWeight.w500),
                     ),
                 ),
                postStats(post:widget.post),
                Padding(
                  //becuse space the textCaption
                  padding: const EdgeInsets.symmetric(horizontal: 20,),
                  child:widget.post.imageUrl!=null?Text(widget.post.caption,style: TextStyle(fontWeight: FontWeight.w500),
                  ):SizedBox(),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}



bool showIconPin=true;

// ignore: camel_case_types
class _postContainer extends StatelessWidget {
  final Post post;
  const _postContainer({Key? key,required this.post, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            imageProfile=post.user.imageUrl;
            nameProfile=post.user.name;
            if(post.user.name==currentUser.name)
              {
                Navigator.push(context, MaterialPageRoute(builder: (contex)=>profileScreen()));
                myname=currentUser.name;
              }
            else
            Navigator.push(context, MaterialPageRoute(builder: (contex)=>profileUsers()));
          },
            child:post.user.name==currentUser.name? CircleAvatar(
    radius: 24,
    backgroundImage:currentUser.myImageUrl ,
    backgroundColor: Colors.grey[200],
    ):profileAvatar( imageUrl:post.user.imageUrl!,
              Radius: 20,
            )
        ),
        SizedBox(width: 5,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.user.name,style: TextStyle(fontWeight: FontWeight.w700),),
            SizedBox(height: 3,),
            Text(post.timeAgo)
          ],
        ),
        Spacer(),
        IconButton( icon:Icon(Icons.more_horiz),
          onPressed: ()
          {
            if(post.user==currentUser)
            {
              scaffoldKey.currentState!.showBottomSheet((context) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          IconButton(icon: showIconPin?Icon(MdiIcons.pinOutline,size: 25,color: Colors.white,):Icon(MdiIcons.pinOffOutline,size: 25,color: Colors.white,),
                              onPressed: (){}),
                          Text('Pin Post',style: TextStyle(fontSize: 25,color: Colors.white,)
                          )

                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              icon:Icon(Icons.edit,size: 25,color: Colors.white,),
                              onPressed:(){}
                          ),
                          const Text('Edit Post',style: TextStyle(fontSize: 25,color: Colors.white,)
                          )

                        ],
                      ),
                      Row(
                        children: [
                          IconButton(icon: Icon(MdiIcons.delete,size: 25,color: Colors.white,),
                              onPressed: (){}),
                          Text('Delate Post',style: TextStyle(fontSize: 25,color: Colors.white,)
                          )

                        ],
                      ),
                    ],
                  ),
                );
              }
              );
            }
                },
        )

      ],
    );
  }
}



class postStats extends StatefulWidget {
  final Post post;
  const postStats({Key? key,required this.post}) : super(key: key);

  @override
  _postStatsState createState() => _postStatsState();
}

class _postStatsState extends State<postStats> {
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 30,
          child: Row(
            children: [
              // this widget is show how like at image and show
              InkWell(
                onLongPress: (){
                  setState(() {
                    onlongpress=true;
                  });
                },
                child: IconButton(
                    icon: showlike ? Icon(MdiIcons.handOkay,color: Colors.redAccent,):Icon( MdiIcons.handOkay,),
                    onPressed: (){
                    setState(() {
                    showlike =! showlike;
                    if(showlike==true)
                    {
                      cunterLikes ++;
                    }
                    else{
                     cunterLikes--;
                    }
                  });
                 }),
              ),
              const SizedBox(width: 6,),
              IconButton(icon:Icon(MdiIcons.comment,),
                  onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>showcomment()));
                  }
                  ),
              const SizedBox(width: 6,),
              IconButton(icon:Icon(MdiIcons.share), onPressed: (){}),
              const SizedBox(width: 6,),
              Spacer(),
              Text('${widget.post.comments} Comment')
            ],
          ),
        ),
        TextButton(
            onPressed:(){},
            child:Text('${cunterLikes} Likes',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            )
        )
      ],
    );
  }
}


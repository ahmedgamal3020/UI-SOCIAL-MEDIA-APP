import 'dart:io';
import 'package:demo/model/story_model.dart';
import 'package:demo/model/user_model.dart';
import 'package:demo/screens/showMyStory.dart';
import 'package:demo/screens/showStories.dart';
import 'package:demo/ssd.dart';
import 'package:demo/widgets/profileAvatar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Stories extends StatelessWidget {
  final List<Story> stories;
  final User currentUser;

  const Stories({Key? key,
    required this.currentUser,
    required this.stories
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15)
        ),
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            scrollDirection: Axis.horizontal,
            itemCount:1+ stories.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(padding:const EdgeInsets.symmetric(horizontal: 4),
                child:_storyCard(
                    isAddStory: true,
                    currentUser: currentUser,
                )
                );
              }
               final Story story = stories[index-1];
              return Padding(padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _storyCard(story: story,),
              );
            }
        )
    );
  }

}


class _storyCard extends StatefulWidget {
  final  bool isAddStory;
  final User? currentUser;
  final Story? story;
  const _storyCard({
    Key? key,
     this.story,
     this.currentUser,
    this.isAddStory=false
  }) : super(key: key);

  @override
  __storyCardState createState() => __storyCardState();
}

class __storyCardState extends State<_storyCard> {
  File? _imageStory;
  final imagePicker=ImagePicker();
  Future getImageStory() async {
    // ignore: deprecated_member_use
    var imageStory = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageStory = File(imageStory!.path);
    }
    );
  }
  @override
  Widget build( context) {
    return
      Stack(
        children: [
          InkWell(
          onTap: (){
                imageProfile = widget.story!.user.imageUrl;
                image = widget.story!.imageUrl;
                nameProfile = widget.story!.user.name;
                   Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => showStory()
                    )
                );

              },

            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(image: widget.isAddStory ?widget.currentUser!.myImageUrl:widget.story!.imageUrl,
                height: double.infinity,
                width: 80,
                fit: BoxFit.cover,),
            ),
          ),
          Positioned(
              top: 2,
              left: 5,
              child: widget.isAddStory ? InkWell(
                onTap: (){
                  viewstory=true;
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => showMyStory()
                      )
                  );
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle),
                  child: Icon(Icons.add),
                ),
              ) : profileAvatar(
                Radius: 20,
                imageUrl:widget.story!.user.imageUrl! ,
                hasBorder: !widget.story!.isViewed,
              ),
          ),
          Positioned(
            bottom: 4,
              left: 7,
              child:Text(widget.isAddStory ? 'Add to story':widget.story!.user.name,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              )
          )

        ],
      );
  }
}

import 'package:demo/data/data.dart';
import 'package:demo/model/post_model.dart';
import 'package:demo/model/user_model.dart';
import 'package:demo/ssd.dart';
import 'package:demo/widgets/postContainer.dart';
import 'package:flutter/material.dart';

class profileUsers extends StatefulWidget {


  const profileUsers({Key? key}) : super(key: key);

  @override
  _profileUsersState createState() => _profileUsersState();
}
bool showFollow=true;

class _profileUsersState extends State<profileUsers> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:[
                      const SizedBox(width: 5,),
                      CircleAvatar(
                        radius: 59,
                        backgroundImage: NetworkImage(imageProfile)
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(nameProfile,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            const SizedBox(height: 5,),
                            Container(width: double.infinity,
                              height: 1,
                              color: Colors.grey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    TextButton(onPressed:(){},
                                      child:const Text('Followers',style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    ),
                                    const SizedBox(height: 2,),
                                    Text('$cuntFollowers',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Column(
                                  children: [
                                    TextButton(onPressed:(){},
                                      child:const Text('Folloing',style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    ),
                                    const SizedBox(height: 2,),
                                    Text('$cuntFollowing',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  ],
                                ),

                              ],),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  showFollow?Container(
                   width: double.infinity,
                   height: 30,
                   decoration: BoxDecoration(color: Colors.lightBlue,borderRadius: BorderRadius.circular(30)),
                   child: MaterialButton(
                       onPressed:(){
                         setState(() {
                           showFollow =!showFollow;
                           cuntFollowers +=1;

                         });
                       },
                     child: Text('Follwo',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                       ),
                 ) :Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 30,
                        decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.circular(30)),
                        child: MaterialButton(
                          onPressed:(){
                            setState(() {
                              showFollow =!showFollow;
                              cuntFollowers -=1;

                            });
                          },
                          child: Text('UnFollwo',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.circular(30)),
                        child: MaterialButton(
                          onPressed:(){},
                          child: Text('Message',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 5,),

                  Container(width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemCount:posts.length,
                itemBuilder:(context,index){
                  final Post post=posts[index];
                  if (post.user.name==nameProfile){
                    return postContainer(post: posts[index]);
                  }
                  return SizedBox();
                }
            ),
          ],
        ),
      ),
    );
  }
}

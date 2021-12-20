import 'package:demo/data/data.dart';
import 'package:demo/widgets/notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class notfictionScreen extends StatelessWidget {
  const notfictionScreen({Key? key,}) : super(key: key);
  @override
  Widget build( context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.grey[300],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 38,
                child:const Text("Notifications",style: TextStyle(fontSize: 26,color: Colors.black,fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 5,),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    final  notificationnotif=notifications[index];
                   return notificationsWidget(
                     imageUrl: notificationnotif.user.imageUrl,
                     name: notificationnotif.user.name,
                     titel: notificationnotif.title,
                     timePost: notificationnotif.timeAgo,
                   );
                  },

                  separatorBuilder: (context,index)=>Container(width: double.infinity,
                  height: 1,
                  color: Colors.grey,),
                  itemCount:notifications.length
              ),
            ],
          ),
        ),
      ),
    );
  }
}

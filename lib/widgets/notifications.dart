
import 'package:flutter/material.dart';

class notificationsWidget extends StatelessWidget {
  final String? imageUrl;
  final String ? titel;
  final String ? name;
  final String ? timePost;


  const notificationsWidget({
    required this.imageUrl,
    required this.titel,
    required this.name,
    required this.timePost,
   Key? key,
 }) : super(key: key);
  @override
  Widget build( context) {
    return InkWell(
      onTap: (){},
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage:NetworkImage(imageUrl!)
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black,),maxLines: 2,overflow:TextOverflow.ellipsis,),
                const SizedBox(height: 2,),
                Text('$titel',style: TextStyle(fontSize: 20,color: Colors.black87),maxLines: 2,overflow:TextOverflow.ellipsis,softWrap: true,),
                Text('$timePost',style: TextStyle(fontSize: 15,color: Colors.grey[700]))

              ],
            ),
          ),
          IconButton(icon:Icon(Icons.cancel), onPressed:(){})
        ],
      ),
    );
  }
}

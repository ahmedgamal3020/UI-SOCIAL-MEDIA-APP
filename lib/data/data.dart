import 'package:demo/model/notifications_model.dart';
import 'package:demo/model/post_model.dart';
import 'package:demo/model/story_model.dart';
import 'package:demo/model/user_model.dart';
import 'package:demo/ssd.dart';
import 'package:demo/widgets/postContainer.dart';
import 'package:flutter/cupertino.dart';

final User currentUser = User(
  name: 'Ahmed Gamal',
  myImageUrl:get== null ? AssetImage('Assets/fristphoto.jpg'): FileImage(get!) ,
);

final List<User> onlineUsers = [
  User(
    name: 'loay Abd Elsalam',
    imageUrl:'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  ),
  User(
    name: 'محمد علي',
    imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
  ),
  User(
    name: 'حسن شحاته',
    imageUrl:'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  ),
  User(
    name: 'مدحت شلبي',
    imageUrl:'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
  ),
  User(
    name: 'ميدو',
    imageUrl: 'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'

  ),
  User(
    name: 'gadoo',
    imageUrl:'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
  ),
  User(
    name: 'mohamed emam',
    imageUrl: 'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  ),
  User(
      name: 'Elizabeth Wong',
      imageUrl: 'https://images.pexels.com/photos/874158/pexels-photo-874158.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  ),
  User(
    name: 'James ',
      imageUrl: 'https://images.unsplash.com/photo-1522196772883-393d879eb14d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
  ),
  User(
    name: 'Jessie Samson',
    imageUrl: 'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'

  ),
  User(
    name: 'David Brooks',
      imageUrl: 'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
  ),
  User(
    name: 'Jane Doe',
    imageUrl: 'https://images.pexels.com/photos/6801642/pexels-photo-6801642.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  ),
  User(
    name: 'Matthew Hinkle',
      imageUrl: 'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
  ),
  User(
    name: 'Amy Smith',
    imageUrl: 'https://images.pexels.com/photos/1819483/pexels-photo-1819483.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  ),
  User(
    name: 'Ed Morris',
    imageUrl: 'https://images.pexels.com/photos/2169500/pexels-photo-2169500.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  ),
  User(
    name: 'Carolyn Duncan',
    imageUrl: 'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
  ),  User(
    name: 'Paul Pinnock',
    imageUrl: 'https://images.pexels.com/photos/1181690/pexels-photo-1181690.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
),
  User(
      name: 'Elizabeth Wong',
      imageUrl:'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
  ), User(
    name: 'James Lathrop',
    imageUrl: 'https://images.pexels.com/photos/1852083/pexels-photo-1852083.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  ),
  User(
    name: 'Jessie Samson',
    imageUrl:'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
  ),
];

 List<Story> stories = [

  Story(
    user: onlineUsers[0],
    imageUrl:
    AssetImage('Assets/تنزيل.jpg')
  ),
  Story(
    user: onlineUsers[1],
    imageUrl:
    AssetImage('Assets/IMG_20210522_131406.jpg') ,
    isViewed: true,
  ),
  Story(
    user: onlineUsers[2 ],
    imageUrl:AssetImage('Assets/preson brack.jpg')
  ),
  Story(
    user: onlineUsers[3],
    imageUrl:
    AssetImage('Assets/IMG20201026102116.jpg') ,
    isViewed: true,
  ),
  Story(
    user: onlineUsers[5],
    imageUrl:
    AssetImage('Assets/dfsfdsf.jpg')   ),
  Story(
    user: onlineUsers[6],
    imageUrl:
    AssetImage('Assets/IMG20201026102116.jpg') ,
    isViewed: true,
  ),
  Story(
    user: onlineUsers[7],
    imageUrl:
    AssetImage('Assets/dfsfdsf.jpg')   ),
  Story(
    user: onlineUsers[8],
    imageUrl:
    AssetImage('Assets/IMG_20210522_131406.jpg')   ),
];

final List<Post> posts = [
  Post(
    user: currentUser,
    caption: chickControler==null?'Check out these cool puppers':'$chickControler',
    timeAgo: '58m',
    imageUrl: 'https://images.pexels.com/photos/610294/pexels-photo-610294.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    likes: cunterLikes,
    comments: cunterComments,
    shares: cuntershares,
  ),
  Post(
    user: onlineUsers[5],
    caption:'إذا نظرت للحياة بروح مبتسمة حتمًا ستجدها مثيرة للاهتمام. تصبح الحياة ذات معنى حينما نجد شيئًا نكافح من أجله ونسعى بشغف للوصول إليه. تكمن السعادة الزوجية في الحب المتبادل، وبتحمل المسؤولية. كثرة المصائب تجعلنا نرى الحياة طويلة جدًا. عندما يسكت الأسد، يبدأ الببغاء في الثرثرة. المتشائم يبحث عن سبب ليخسر الفرصة، على عكس المتفل',
    timeAgo: '3hr',
    imageUrl: 'https://images.pexels.com/photos/1310522/pexels-photo-1310522.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    likes: cunterLikes,
    comments: cunterComments,
    shares: cuntershares,
  ),
  Post(
    user: onlineUsers[4],
    caption: 'This is a very good boi.',
    imageUrl: 'https://images.pexels.com/photos/6015216/pexels-photo-6015216.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    timeAgo: '8hr',
    likes: cunterLikes,
    comments: cunterComments,
    shares: cuntershares,
  ),
  Post(
    user: onlineUsers[3],
    caption: 'Adventure 🏔',
    timeAgo: '15hr',
    imageUrl: 'https://images.pexels.com/photos/5088418/pexels-photo-5088418.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    likes: cunterLikes,
    comments: cunterComments,
    shares: cuntershares,
  ),
  Post(
    user: onlineUsers[0],
    caption:'الأشخاص الذين يتّصفون بالشجاعة الخارجية يجرؤون على الموت، والذين يمتلكون',
    timeAgo: '1d',
    imageUrl: 'https://images.pexels.com/photos/34534/people-peoples-homeless-male.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    likes: cunterLikes,
    comments: cunterComments,
    shares:cuntershares,
  ),
  Post(
    user: onlineUsers[9],
    caption: 'A classic.',
    timeAgo: '1d',
    imageUrl: 'https://images.pexels.com/photos/7101032/pexels-photo-7101032.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    likes: cunterLikes,
    shares: cuntershares,
    comments: cunterComments,
  )
];
List<notification>notifications=[
  notification(
    timeAgo: '15hr',
    user: onlineUsers[0],
    title: 'الاخلاص كنز لا يفني '
  ),
  notification(
    timeAgo: '1d',
      user:  onlineUsers[1],
      title:  'add a story'
  ),
  notification(
    timeAgo: '5hr',
      user: onlineUsers[2],
      title: 'add a post'
  ),
  notification(
    timeAgo: '8hr',
      user: onlineUsers[3],
      title: 'الأشخاص الذين يتّصفون بالشجاعة الخارجية يجرؤون على الموت، '
  ),
  notification(
    timeAgo: '9m',
      user: onlineUsers[4],
      title: 'لمتشائم يبحث عن سبب ليخسر الفرصة، على عكس المتفل '
  ),
  notification(
    timeAgo: '51m',
      user:onlineUsers[5],
      title: 'ahmed gamal app a photo '
  ),
  notification(
    timeAgo: '37m',
      user: onlineUsers[6],
      title: 'ahmed gamal add a photo '
  ),
  notification(
      timeAgo:'3hr',
      user: onlineUsers[7],
      title: 'كثرة المصائب تجعلنا نرى الحياة طويلة جدًا. عندما يسكت الأسد، يبدأ الببغاء في الثرثرة. المتشائم يبحث عن سبب ليخسر الفرصة'
  ),
];
import 'package:demo/model/user_model.dart';

class Post {
  final User user;
  var caption;
  final String timeAgo;
  var imageUrl;
  final int likes;
  final int comments;
  final int shares;

   Post({
    required this.user,
    required this.caption,
    required this.timeAgo,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}
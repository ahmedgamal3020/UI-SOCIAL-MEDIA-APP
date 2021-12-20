
import 'package:demo/model/user_model.dart';

class Story {
  final User user;
   var imageUrl;
  final bool isViewed;

   Story({
     required this.user,
     this.imageUrl,
    this.isViewed = false,
  });
}
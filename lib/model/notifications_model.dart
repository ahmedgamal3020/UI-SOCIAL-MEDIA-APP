
import 'package:demo/model/user_model.dart';

class notification{
  final User user;
  var title;
  final String ? timeAgo;

  notification({
    required this.timeAgo,
    required this.user,
    this.title
});
}
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/models/post_model.dart';

class PostItem extends StatelessWidget {
  
  final Post post;

  PostItem({this.post});
  
  @override
  Widget build(BuildContext context) {
    return Text(post.title);
  }

}
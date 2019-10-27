
import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostBloc extends ChangeNotifier {
   Post _post;
   bool _isLoading;
   
   Post get post => _post;
   bool get isLoading => _isLoading;

  fetchPost() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts/1');
    if (response.statusCode == 200) {
      _post = Post.fromJson(json.decode(response.body));
      notifyListeners();
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
    
  }
   

}
import 'package:flutter/material.dart';
import 'package:padmakanya_api/models/post.dart';
import 'package:padmakanya_api/services/post_service.dart';

class PostsNotifier extends ChangeNotifier {
  List<Post> posts = [];
  bool isLoading = false;
  String? error;

  Future<void> loadPostsFromApi() async {
    try {
      isLoading = true;
      notifyListeners();
      List<Post> fetchedPosts = await PostService.getPostsFromAPI();
      posts = fetchedPosts;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }
}

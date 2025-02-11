import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:padmakanya_api/models/post.dart';

class PostService {
  static Future<List<Post>> getPostsFromAPI() async {
    Uri url = Uri.https('api.slingacademy.com', 'v1/sample-data/photos');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String responseBody = response.body;
      Map<String, dynamic> decodedBody = jsonDecode(responseBody);
      List<dynamic> decodedPosts = decodedBody['photos'];

      List<Post> convertedPosts = decodedPosts.map((element) {
        Map<String, dynamic> data = element as Map<String, dynamic>;
        Post post = Post.fromMap(data);
        return post;
      }).toList();

      return convertedPosts;
    } else {
      throw Exception("Error fetching posts");
    }
  }
}

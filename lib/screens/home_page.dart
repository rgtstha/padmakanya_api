import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:padmakanya_api/models/post.dart';
import 'package:padmakanya_api/widgets/post_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    getPostsFromAPI();
  }

  void getPostsFromAPI() async {
    Uri url = Uri.https('jsonplaceholder.typicode.com', 'posts');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String responseBody = response.body;
      List<dynamic> decodedPosts = jsonDecode(responseBody);
      List<Post> convertedPosts = decodedPosts.map((element) {
        Map<String, dynamic> data = element as Map<String, dynamic>;
        Post post = Post.fromMap(data);
        return post;
      }).toList();

      setState(() {
        posts = convertedPosts;
      });
    } else {
      log("Error Occurd");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: ListView.separated(
          itemCount: posts.length,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (BuildContext context, int index) {
            Post post = posts[index];
            return PostTile(
              post: post,
            );
          }),
    );
  }
}

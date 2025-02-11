import 'package:flutter/material.dart';
import 'package:padmakanya_api/models/post.dart';
import 'package:padmakanya_api/notifiers/posts_notifier.dart';
import 'package:padmakanya_api/widgets/post_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  PostsNotifier postsNotifier = PostsNotifier();

  @override
  void initState() {
    super.initState();
    postsNotifier.loadPostsFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: ListenableBuilder(
          listenable: postsNotifier,
          builder: (_, __) {
            if (postsNotifier.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (postsNotifier.error != null) {
              return Center(
                child: Text(postsNotifier.error!),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {},
              child: ListView.separated(
                itemCount: postsNotifier.posts.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (BuildContext context, int index) {
                  Post post = postsNotifier.posts[index];
                  return PostTile(
                    post: post,
                  );
                },
              ),
            );
          }),
    );
  }
}

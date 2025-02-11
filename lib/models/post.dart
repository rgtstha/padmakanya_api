class Post {
  final int id;
  final String title;
  final String thumbnailUrl;

  Post({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      title: map['title'],
      thumbnailUrl: map['url'],
    );
  }
}

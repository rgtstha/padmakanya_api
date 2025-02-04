class Post {
  final int id;
  final String title;
  final String description;

  Post({
    required this.id,
    required this.title,
    required this.description,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      title: map['title'],
      description: map['body'],
    );
  }
}

Post post = Post(
  id: 1,
  title: "Hello",
  description: "descrption",
);

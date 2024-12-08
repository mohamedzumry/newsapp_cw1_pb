class News {
  final String title;
  final String? imageUrl;
  final String description;
  final String content;

  const News({
    required this.title,
    this.imageUrl,
    required this.description,
    required this.content,
  });
}

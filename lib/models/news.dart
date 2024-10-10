class News {
  final String title;
  final String description;
  final String imageUrl; // Change to image
  final String content; // Add this
  final String url; // Add this
  final String category;

  News({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.content, // Add this
    required this.url, // Add this
    required this.category,
  });
}
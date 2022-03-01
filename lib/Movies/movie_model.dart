class Movie {
  final String id;
  final String title;
  final String description;
  final String rating;
  final String imageUrl;
  final List<String> geneType;

  Movie(
      {required this.id,
      required this.title,
      required this.description,
      required this.rating,
      required this.imageUrl,
      required this.geneType});
}

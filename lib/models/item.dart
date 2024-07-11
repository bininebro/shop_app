class Item {
  final String image;
  final String rank;
  final String title;
  final List<String> subtitles;
  final double rating;
  final int ratingCount;
  final List<String> tags;

  Item({
    required this.image,
    required this.rank,
    required this.title,
    required this.subtitles,
    required this.rating,
    required this.ratingCount,
    required this.tags,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      image: json['image'],
      rank: json['rank'],
      title: json['title'],
      subtitles: List<String>.from(json['subtitles']),
      rating: json['rating'].toDouble(),
      ratingCount: json['rating_count'],
      tags: List<String>.from(json['tags']),
    );
  }
}

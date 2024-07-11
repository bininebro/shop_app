class Cat {
  final String name;
  final String image;
  final String review;

  Cat({required this.name, required this.image, required this.review});

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      name: json['name'],
      image: json['image'],
      review: json['review'],
    );
  }
}

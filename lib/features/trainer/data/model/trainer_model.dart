class TrainerModel {
  final String name;
  final String image;
  final String specialty;
  final double rating;
  final int experienceYears;

  TrainerModel({
    required this.name,
    required this.image,
    required this.specialty,
    required this.rating,
    required this.experienceYears,
  });

  factory TrainerModel.fromJson(Map<String, dynamic> json) {
    return TrainerModel(
      name: json['name'],
      image: json['image'],
      specialty: json['specialty'],
      rating: (json['rating'] as num).toDouble(),
      experienceYears: json['experienceYears'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "image": image,
      "specialty": specialty,
      "rating": rating,
      "experienceYears": experienceYears,
    };
  }
}

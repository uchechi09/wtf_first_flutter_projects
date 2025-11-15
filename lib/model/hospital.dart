import 'package:wtf_flutter_projects/model/review.dart';

class Hospital {
  final String id;
  final String address;
  final String name;
  final String description;
  final int numberOfAmbulances;
  final int rating;
  final String website;
  final List<String> phoneNumber;
  final List<Review> review;

  Hospital({
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.website,
    this.description = "",
    required this.numberOfAmbulances,
    this.rating = 0,
    this.id = "",
    this.review = const[],
  });
}

import 'package:wtf_flutter_projects/model/user_details.dart';

class Review {
  final String message;
  final UserDetails user;
  final DateTime date;

  Review({required this.message, required this.user, required this.date});
}


import 'package:first_flutter/app/app.dart';

class User {
  User({
    this.token,
    this.id,
    this.nickName,
    this.gender,
  });

  final String token;
  final int id;
  final String nickName;
  final Gender gender;
}
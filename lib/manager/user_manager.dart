
import 'package:first_flutter/app/app.dart';
import 'package:first_flutter/model/user.dart';

class UserManager {
  UserManager._();

  static UserManager _instance;
  static UserManager get instance {
    if (_instance == null) {
      _instance = UserManager._();
    }
    return _instance;
  }

  User user;

  String get genderDesc {
    if (user == null) {
      return 'unknow';
    }
    switch (user.gender) {
      case Gender.male:
        return 'male';
      case Gender.female:
        return 'female';
      default:
        return 'unknow';
    }
  }

}
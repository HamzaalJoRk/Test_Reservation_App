import 'package:get/get.dart';

class AuthController extends GetxController {
  int? id;
  String? token;
  String? name;
  String? email;
  String? location;
  String? phoneNumber;
  String? fname;
  String? lname;
  String? personImage;

  void reset() {
    id = 0;
    token = '';
    name = '';
    email = '';
    phoneNumber = '';
    location = '';
    fname = '';
    lname = '';
  }

  void setToken(String newToken) {
    token = newToken;
    update();
  }

  void setName(String newName) {
    name = newName;
    update();
  }

  void setEmail(String newEmail) {
    email = newEmail;
    update();
  }

  void setlocation(String newlocation) {
    location = newlocation;
    update();
  }

  void setphoneNumber(String newphoneNumber) {
    phoneNumber = newphoneNumber;
    update();
  }

  void setFName(String newfname) {
    fname = newfname;
    update();
  }

  void setLName(String newlname) {
    lname = newlname;
    update();
  }

  void setId(int newid) {
    id = newid;
    update();
  }
}

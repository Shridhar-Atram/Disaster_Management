import 'package:disaster_management/src/features/authentication/models/user_model.dart';
import 'package:disaster_management/src/repository/authentication_repository/authentication_repository.dart';
import 'package:disaster_management/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  //controllers
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());
  getUserdata() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  Future<List> getAllUser() async => await _userRepo.allUser();
  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}

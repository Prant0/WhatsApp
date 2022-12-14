import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/features/auth/repository/auth_repository.dart';
import 'package:whatsapp_ui/models/user_model.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);

  return AuthController(
    ref: ref,
    authRepository: authRepository,
  );
});

final userDataAuthProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider);
  return authController.getUserData();
});

class AuthController {
  final AuthRepository authRepository;
  final ProviderRef ref;

  AuthController({required this.authRepository, required this.ref});

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepository.signInWithPhone(context, phoneNumber);
  }

  void verifyOTP(BuildContext context, String verificationId, String userOTP) {
    authRepository.veridyOTP(
        context: context, verificationId: verificationId, userOTP: userOTP);
  }

  void saveDataToFirebase(
    BuildContext context,
    String name,
    File? profilePic,
  ) {
    authRepository.saveUserDataToFirebase(
        name: name, profilePic: profilePic!, ref: ref, context: context);
  }

  Future<UserModel?> getUserData() async {
    UserModel ?user = await authRepository.getCurrentUserData();
    return user;
  }


  Stream<UserModel> userDataById(String userId){
    return authRepository.getUserData(userId);
  }
}

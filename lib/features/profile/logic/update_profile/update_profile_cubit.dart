import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:holo_cart/core/helper/sharded_pref_helper.dart';
import 'package:holo_cart/core/helper/shared_pref_keys.dart';
import 'package:holo_cart/features/profile/data/model/update_profile_model/update_profile_model.dart';
import 'package:holo_cart/features/profile/data/model/update_profile_model/update_profile_response_model.dart';
import 'package:holo_cart/features/profile/data/repo/update_profile/update_profile_repo.dart.dart';

import '../../data/model/get_profile_model/profile_response_model.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this._repo) : super(UpdateProfileInitial());

  final UpdateProfileRepo _repo;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  File? profileImage;

  // البيانات الأصلية
  String? oldFullName;
  String? oldUserName;
  String? oldPhone;
  String? oldAddress;

  String? oldProfileImageUrl;

void loadInitialData(UserProfileModel user) {
  fullNameController.text = user.fullName;
  userNameController.text = user.userName;
  phoneController.text = user.phoneNumber;
  addressController.text = user.address ?? "";

  oldFullName = user.fullName;
  oldUserName = user.userName;
  oldPhone = user.phoneNumber;
  oldAddress = user.address;
  oldProfileImageUrl = user.profileImage; }

  void setProfileImage(File file) {
    profileImage = file;
    emit(state);
  }

  Future<void> validateThenUpdate() async {
    if (!formKey.currentState!.validate()) return;

    final id = await SharedPrefHelper.getInt(SharedPrefKeys.userId);

    final request = UpdateProfileRequest(
      id: id,
      fullName: fullNameController.text.trim().isNotEmpty
          ? fullNameController.text.trim()
          : oldFullName ?? "",

      userName: userNameController.text.trim().isNotEmpty
          ? userNameController.text.trim()
          : oldUserName ?? "",

      phoneNumber: phoneController.text.trim().isNotEmpty
          ? phoneController.text.trim()
          : oldPhone ?? "",

      address: addressController.text.trim().isNotEmpty
          ? addressController.text.trim()
          : oldAddress ?? "",

      profileImage: profileImage,
    );

    emit(UpdateProfileLoading());

    final result = await _repo.updateProfile(request);
    result.fold(
      (failure) => emit(UpdateProfileFailure(failure.errorMessage)),
      (response) => emit(UpdateProfileSuccess(response)),
    );
  }
}
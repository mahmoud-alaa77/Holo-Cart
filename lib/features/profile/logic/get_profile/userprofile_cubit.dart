import 'package:bloc/bloc.dart';
import 'package:holo_cart/core/helper/sharded_pref_helper.dart';
import 'package:holo_cart/core/helper/shared_pref_keys.dart';
import 'package:holo_cart/features/profile/data/model/get_profile_model/profile_response_model.dart';
import 'package:holo_cart/features/profile/data/repo/get_profile/user_profile_repo.dart';
import 'package:meta/meta.dart';

part 'userprofile_state.dart';

class UserProfileCubit extends Cubit<UserprofileState> {
  final ProfileRepo profileRepo;

  UserProfileCubit(this.profileRepo) : super(UserprofileInitial());

  Future<void> getUserProfile() async {
    String token = await SharedPrefHelper.getSecuredString(SharedPrefKeys.token);

    if (token.isEmpty) {
      emit(UserProfileGuestState());
      return;
    }

    emit(UserprofileLoading());

    try {
      final userId = await SharedPrefHelper.getInt(SharedPrefKeys.userId);

      final result = await profileRepo.getUserProfile(userId.toString());
      result.fold(
        (failure) => emit(UserprofileError(failure.errorMessage)),
        (userProfileResponse) {
          
          if (userProfileResponse == null ||
              userId == 0 ||
              userProfileResponse.data.fullName.isEmpty ||
              userProfileResponse.data.email.isEmpty) {
            emit(GuestProfileState());
            return;
          }
          emit(UserprofileLoaded(userProfileResponse.data));
        },
      );
    } catch (e) {
      emit(UserprofileError(e.toString()));
    }
  }
}

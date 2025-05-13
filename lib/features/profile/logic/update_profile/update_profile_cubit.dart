import 'package:bloc/bloc.dart';
import 'package:holo_cart/features/profile/data/model/update_profile_model/update_profile_model.dart';
import 'package:holo_cart/features/profile/data/repo/update_profile/update_profile_repo.dart.dart';
import 'package:meta/meta.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this._updateProfileRepo) : super(UpdateProfileInitial());
  final UpdateProfileRepo _updateProfileRepo ;
   Future<void> updateProfile(UpdateProfileRequest request) async {
    emit(UpdateProfileLoading());

    final result = await _updateProfileRepo.updateProfile(request);
    result.fold(
      (failure) => emit(UpdateProfileFailure(failure.errorMessage)),
      (_) => emit(UpdateProfileSuccess()),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_initial_params.dart';
import 'profile_navigator.dart';
import 'profile_state.dart';
import '../../../../../domain/repositories/bottom_nav/setting/setting_tabs/profile/profile_base_api_service.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileBaseApiService baseApiServices;
  final ProfileNavigator navigator;
  final ProfileInitialParams initialParams;
  ProfileCubit(this.initialParams, this.baseApiServices, this.navigator)
      : super(ProfileState.initial(initialParams: initialParams));

  Future<void> profile({required Map<String, dynamic> body}) async {
    emit(state.copyWith(isLoading: true));
    final profile = await baseApiServices.profile(body: body);
    profile.fold((l) => emit(state.copyWith(isLoading: false, error: l.error)),
        ((r) => emit(state.copyWith(success: r, isLoading: false))));
  }
}

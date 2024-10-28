import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/data/models/local/local_user_info_store_model.dart';

class LoginDataSources extends Cubit<LocalUserInfoStoreModel> {
  LoginDataSources() : super(LocalUserInfoStoreModel.empty());
  setLoginDataSources({required LocalUserInfoStoreModel loginSuccessModel}) =>
      emit(loginSuccessModel);
}

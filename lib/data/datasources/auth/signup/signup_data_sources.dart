import '/data/models/local/local_user_info_store_model.dart';

class SignupDataSources {
  LocalUserInfoStoreModel? _signupSuccessModel;

  LocalUserInfoStoreModel? get signupSuccessModel => _signupSuccessModel;

  void setSignupDataSources({
    required LocalUserInfoStoreModel signupSuccessModel,
  }) {
    _signupSuccessModel = signupSuccessModel;
  }

  void clearSignupDataSources() {
    _signupSuccessModel = null;
  }
} 
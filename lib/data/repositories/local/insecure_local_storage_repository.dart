import 'package:flutter_template/data/models/local/local_user_info_store_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/domain/repositories/local/local_storage_base_api_service.dart';

import 'dart:convert';
import '/domain/failures/local/remove_local_storage_failure.dart';

import '/domain/failures/local/get_local_storage_failure.dart';
import '/domain/failures/local/set_local_storage_failure.dart';

class InsecureLocalStorageRepository implements LocalStorageRepository {
  @override
  Future<Either<SetLocalStorageFailure, bool>> setUserData(
      {required LocalUserInfoStoreModel localUserInfoStoreModel}) async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      String userJson = jsonEncode(localUserInfoStoreModel.toJson());
      await sp.setString('user_info', userJson);
      // await prefs.setString("token", mockLoginSuccessModel.token);
      return right(true);
    } catch (ex) {
      return left(SetLocalStorageFailure(error: ex.toString()));
    }
  }

  @override
  Future<Either<GetLocalStorageFailure, LocalUserInfoStoreModel>>
      getUserData() async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      String? userJson = sp.getString('user_info');
      if (userJson == null) {
        return right(LocalUserInfoStoreModel.empty());
      }

      Map<String, dynamic> userMap = jsonDecode(userJson);
      return right(LocalUserInfoStoreModel.fromJson(userMap));
      // return right(MockLoginSuccessModel.empty()
      //     .copyWith(token: prefs.getString("token")));
    } catch (ex) {
      return left(GetLocalStorageFailure(error: ex.toString()));
    }
  }

  @override
  Future<Either<RemoveLocalStorageFailure, bool>> removeUserData() async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.remove("user_info");
      return right(true);
    } catch (ex) {
      return left(RemoveLocalStorageFailure(error: ex.toString()));
    }
  }

  @override
  Future<Either<GetLocalStorageFailure, bool>> getBool(
      {required String key}) async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      return right(sp.getBool(key) ?? false);
    } catch (ex) {
      return left(GetLocalStorageFailure(error: ex.toString()));
    }
  }

  @override
  Future<Either<SetLocalStorageFailure, bool>> setBool(
      {required String key, required bool value}) async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setBool(key, value);
      return right(true);
    } catch (ex) {
      return left(SetLocalStorageFailure(error: ex.toString()));
    }
  }

  //

  @override
  Future<Either<SetLocalStorageFailure, bool>> setSelectedLanguage(
      {required String lang}) async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      // String userJson =
      //     jsonEncode(mockLocalSelectedLanguageStoreModel.toJson());
      await sp.setString('selectedLanguage', lang);
      // await prefs.setString("token", mockLoginSuccessModel.token);
      return right(true);
    } catch (ex) {
      return left(SetLocalStorageFailure(error: ex.toString()));
    }
  }

  @override
  Future<Either<GetLocalStorageFailure, String>> getSelectedLanguage() async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      String? userJson = sp.getString('selectedLanguage') ?? 'en';

      // String userMap = jsonDecode(userJson);
      // return right(MockLocalSelectedLanguageStoreModel.fromJson(userMap));
      return right(userJson);
      // return right(MockLoginSuccessModel.empty()
      //     .copyWith(token: prefs.getString("token")));
    } catch (ex) {
      return left(GetLocalStorageFailure(error: ex.toString()));
    }
  }

  @override
  Future<Either<RemoveLocalStorageFailure, bool>>
      removeSelectedLanguage() async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.remove("selectedLanguage");
      return right(true);
    } catch (ex) {
      return left(RemoveLocalStorageFailure(error: ex.toString()));
    }
  }

// App logo

  @override
  Future<Either<SetLocalStorageFailure, bool>> setLogoBase64(
      {required String logoBase64}) async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString('logoBase64', logoBase64);
      return right(true);
    } catch (ex) {
      return left(SetLocalStorageFailure(error: ex.toString()));
    }
  }

  @override
  Future<Either<GetLocalStorageFailure, String>> getLogoBase64() async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      String? logo = sp.getString('logoBase64') ?? '';
      return right(logo);
    } catch (ex) {
      return left(GetLocalStorageFailure(error: ex.toString()));
    }
  }
}

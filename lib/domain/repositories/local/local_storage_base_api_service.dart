import 'package:flutter_template/data/models/local/local_user_info_store_model.dart';
import 'package:fpdart/fpdart.dart';

import '/domain/failures/local/remove_local_storage_failure.dart';

import '/domain/failures/local/get_local_storage_failure.dart';
import '/domain/failures/local/set_local_storage_failure.dart';

abstract class LocalStorageRepository {
  // App User

  Future<Either<SetLocalStorageFailure, bool>> setUserData(
      {required LocalUserInfoStoreModel localUserInfoStoreModel});

  Future<Either<GetLocalStorageFailure, LocalUserInfoStoreModel>> getUserData();
  Future<Either<RemoveLocalStorageFailure, bool>> removeUserData();

  // App Theme

  Future<Either<SetLocalStorageFailure, bool>> setBool(
      {required String key, required bool value});

  Future<Either<GetLocalStorageFailure, bool>> getBool({required String key});

  // App Language

  Future<Either<SetLocalStorageFailure, bool>> setSelectedLanguage(
      {required String lang});

  Future<Either<GetLocalStorageFailure, String>> getSelectedLanguage();
  Future<Either<RemoveLocalStorageFailure, bool>> removeSelectedLanguage();

// App logo

  Future<Either<SetLocalStorageFailure, bool>> setLogoBase64(
      {required String logoBase64});

  Future<Either<GetLocalStorageFailure, String>> getLogoBase64();
}

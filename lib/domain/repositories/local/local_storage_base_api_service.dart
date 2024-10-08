import 'package:fpdart/fpdart.dart';

import '/domain/entities/local/mock_local_user_info_store_model.dart';
import '/domain/failures/local/remove_local_storage_failure.dart';

import '/domain/failures/local/get_local_storage_failure.dart';
import '/domain/failures/local/set_local_storage_failure.dart';

abstract class LocalStorageRepository {
  
  Future<Either<SetLocalStorageFailure, bool>> setUserData(
      {required MockLocalUserInfoStoreModel mockLocalUserInfoStoreModel});

  Future<Either<GetLocalStorageFailure, MockLocalUserInfoStoreModel>> getUserData();
  Future<Either<RemoveLocalStorageFailure, bool>> removeUserData();
  

  Future<Either<SetLocalStorageFailure, bool>> setBool(
      {required String key, required bool value});

  Future<Either<GetLocalStorageFailure, bool>> getBool({required String key});
}

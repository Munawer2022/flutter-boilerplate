import 'package:fpdart/fpdart.dart';
import '/domain/entities/home/mock_home_model.dart';
import '/data/models/home/home_model.dart';
import '/core/app_url.dart';
import '/domain/repositories/network/network_base_api_service.dart';
import '/domain/failures/home/home_failure.dart';
import '/domain/repositories/home/home_base_api_service.dart';

class HomeRepository implements HomeBaseApiService {
  final NetworkBaseApiService _networkRepository;

  HomeRepository(this._networkRepository);

  @override
  Future<Either<HomeFailure, MockHomeModel>> home() => _networkRepository
      .get<Map<String, dynamic>>(url: AppUrl.home)
      .then((value) => value.fold((l) => left(HomeFailure(error: l.error)),
          (r) => right(HomeModel.fromJson(r).toDomain())));
}

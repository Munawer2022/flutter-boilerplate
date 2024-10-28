import 'package:fpdart/fpdart.dart';
import '../../../models/bottom_nav/home/home_model.dart';
import '/core/app_url.dart';
import '/domain/repositories/network/network_base_api_service.dart';
import '../../../../domain/failures/bottom_nav/home/home_failure.dart';
import '../../../../domain/repositories/bottom_nav/home/home_base_api_service.dart';

class HomeRepository implements HomeBaseApiService {
  final NetworkBaseApiService _networkRepository;

  HomeRepository(this._networkRepository);

  @override
  Future<Either<HomeFailure, HomeModel>> home() => _networkRepository
      .get<Map<String, dynamic>>(url: AppUrl.home)
      .then((value) => value.fold((l) => left(HomeFailure(error: l.error)),
          (r) => right(HomeModel.fromJson(r))));
}

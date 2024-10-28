import 'package:flutter_template/data/models/bottom_nav/home/home_model.dart';
import 'package:fpdart/fpdart.dart';
import '../../../failures/bottom_nav/home/home_failure.dart';

abstract class HomeBaseApiService {
  Future<Either<HomeFailure, HomeModel>> home();
}

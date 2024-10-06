import 'package:equatable/equatable.dart';

class MockProfileModel extends Equatable {
 const MockProfileModel();
  factory MockProfileModel.empty() => const MockProfileModel();
  MockProfileModel copyWith() => const MockProfileModel();
  @override
  List<Object?> get props => [];
}
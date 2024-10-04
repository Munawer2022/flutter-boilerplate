import 'package:equatable/equatable.dart';

class MockHomeModel extends Equatable {
  const MockHomeModel();
  factory MockHomeModel.empty() => const MockHomeModel();
  MockHomeModel copyWith() => const MockHomeModel();
  @override
  List<Object?> get props => [];
}

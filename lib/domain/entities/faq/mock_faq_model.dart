import 'package:equatable/equatable.dart';

class MockFaqModel extends Equatable {
 const MockFaqModel();
  factory MockFaqModel.empty() => const MockFaqModel();
  MockFaqModel copyWith() => const MockFaqModel();
  @override
  List<Object?> get props => [];
}
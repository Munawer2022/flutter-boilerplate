import 'package:equatable/equatable.dart';

class MockSettingModel extends Equatable {
 const MockSettingModel();
  factory MockSettingModel.empty() => const MockSettingModel();
  MockSettingModel copyWith() => const MockSettingModel();
  @override
  List<Object?> get props => [];
}
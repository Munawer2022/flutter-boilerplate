import 'package:equatable/equatable.dart';

class MockNotificationModel extends Equatable {
 const MockNotificationModel();
  factory MockNotificationModel.empty() => const MockNotificationModel();
  MockNotificationModel copyWith() => const MockNotificationModel();
  @override
  List<Object?> get props => [];
}
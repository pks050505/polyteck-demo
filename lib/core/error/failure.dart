import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String errorMessage;
  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure({required String errorMessage}) : super(errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}

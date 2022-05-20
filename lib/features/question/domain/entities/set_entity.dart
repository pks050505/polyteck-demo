import 'package:equatable/equatable.dart';

class SetEntity extends Equatable {
  final String subjectId;
  final String setId;
  final String setName;
  const SetEntity(
      {required this.setId, required this.subjectId, required this.setName});
  @override
  List<Object?> get props => [subjectId, setId, setName];
  @override
  bool? get stringify => true;
}

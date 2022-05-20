import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:polytech/features/question/data/models/subject_model.dart';

abstract class SubjectFirebaseDataSource {
  Future<List<SubjectModel>> getAllSubjectTiles();
}

class SubjectFirebaseDataSourceImpl implements SubjectFirebaseDataSource {
  final FirebaseFirestore firestore;
  SubjectFirebaseDataSourceImpl(this.firestore);
  @override
  Future<List<SubjectModel>> getAllSubjectTiles() async {
    var data = await firestore.collection('subject').get();
    return data.docs.map((e) {
      var a = e.data();
      print('subject $a');
      print(a);
      return SubjectModel.fromJson(a);
    }).toList();
  }
}

// var data = [
//   {
//     "subjectId": 'cheId',
//     "subjectName": 'Chemistry',
//   },
//   {
//     "subjectId": 'phyId',
//     "subjectName": 'Physics',
//   },
//   {
//     "subjectId": 'matId',
//     "subjectName": 'Math',
//   },
// ];

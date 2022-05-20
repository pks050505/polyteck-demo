import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:polytech/features/question/data/models/qeustion_model.dart';

abstract class QuestionFirebaseDataSource {
  Future<List<QuestionModel>> getAllQuestion(String setId);
}

class QuestionFirebaseDataSourceImpl implements QuestionFirebaseDataSource {
  final FirebaseFirestore firestore;
  QuestionFirebaseDataSourceImpl(this.firestore);
  @override
  Future<List<QuestionModel>> getAllQuestion(String setId) async {
    var data = await firestore
        .collection('question')
        .where('setId', isEqualTo: setId)
        .get();
    return data.docs.map((e) {
      var a = e.data();
      return QuestionModel.fromJson(a);
    }).toList();

    // var list = data.where((element) => element['setId'] == setId).toList();
    // var a = List.generate(
    //     list.length, (index) => QuestionModel.fromJson(list[index]));
    // return Future.value(a);
  }
}

// List<Map<String, dynamic>> data = [
//   {
//     "questionId": "question1",
//     "setId": "setId1",
//     "subjectId": "cheId",
//     "questionName": "What is Your Name ?",
//   },
//   {
//     "questionId": "question2",
//     "setId": "setId1",
//     "subjectId": "cheId",
//     "questionName": "What is Your Name ?",
//   },
//   {
//     "questionId": "question2",
//     "setId": "setId1",
//     "subjectId": "cheId",
//     "questionName": "What is Your Name ?",
//   },
//   {
//     "questionId": "question2",
//     "setId": "setId1",
//     "subjectId": "cheId",
//     "questionName": "What is Your Name ?",
//   },
//   {
//     "questionId": "question2",
//     "setId": "setId1",
//     "subjectId": "cheId",
//     "questionName": "What is Your Name ?",
//   },
//   {
//     "questionId": "question2",
//     "setId": "setId1",
//     "subjectId": "cheId",
//     "questionName": "What is Your Name ?",
//   },
//   {
//     "questionId": "question2",
//     "setId": "setId1",
//     "subjectId": "cheId",
//     "questionName": "What is Your Name ?",
//   },
//   {
//     "questionId": "question2",
//     "setId": "setId1",
//     "subjectId": "cheId",
//     "questionName": "What is Your Name ?",
//   },
//   {
//     "questionId": "question2",
//     "setId": "setId2",
//     "subjectId": "cheId",
//     "questionName": "What is Your Name ?",
//   },
//   {
//     "questionId": "question2",
//     "setId": "setId2",
//     "subjectId": "cheId",
//     "questionName": "What is Your Name ?",
//   },
//   {
//     "questionId": "question2",
//     "setId": "setId3",
//     "subjectId": "cheId",
//     "questionName": "What is Your Name ?",
//   },
// ];

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:polytech/features/question/data/models/set_model.dart';

abstract class SetFirebaseDataSource {
  Future<List<SetModel>> getAllSet(String subjectId);
}

class SetFirebaseDataSourceImpl implements SetFirebaseDataSource {
  final FirebaseFirestore firestore;
  SetFirebaseDataSourceImpl(this.firestore);

  @override
  Future<List<SetModel>> getAllSet(String subjectId) async {
    String sub = await Future.value(subjectId);

    print('subject id  $sub');
    var data = await firestore
        .collection('set')
        .where('subjectId', isEqualTo: sub)
        .get();
    return data.docs.map((e) {
      var a = e.data();
      print('set $a');
      print(a);
      return SetModel.fromJson(a);
    }).toList();

    // var list =
    //     data.where((element) => element['subjectId'] == subjectId).toList();
    // var a =
    //     List.generate(list.length, (index) => SetModel.fromJson(list[index]));
    // return Future.value(a);
  }
}

// List<Map<String, dynamic>> data = [
  // {
  //   'setId': "setId1",
  //   'subjectId': "cheId",
  //   'setName': "set 1",
  // },
  // {
  //   'setId': "setId2",
  //   'subjectId': "cheId",
  //   'setName': "set 2",
  // },
  // {
  //   'setId': "setId3",
  //   'subjectId': "phyId",
  //   'setName': "set 1",
  // },
  // {
  //   'setId': "setId4",
  //   'subjectId': "phyId",
  //   'setName': "set 2",
  // },
  // {
  //   'setId': "setId5",
  //   'subjectId': "matId",
  //   'setName': "set 1",
  // },
  // {
  //   'setId': "setId6",
  //   'subjectId': "matId",
  //   'setName': "set 2",
  // },
  // {
  //   'setId': "setId7",
  //   'subjectId': "matId",
  //   'setName': "set 3",
  // }
// ];

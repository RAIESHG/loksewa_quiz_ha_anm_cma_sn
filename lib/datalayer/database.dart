import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loksewa_quiz_ha_anm_cma_sn/datalayer/questionmodel.dart';


class Database{

  Stream<List<QuestionModel>> getfirebase() {

    var ref = FirebaseFirestore.instance.collection('question');
    return ref.snapshots().map((val) => val.docs.map((docs) => QuestionModel.fromFireStore(docs)).toList());
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wtf_flutter_projects/model/hospital.dart';

class HospitalNotifier extends ChangeNotifier {
  List<Hospital> hospitals = [];

  HospitalNotifier() {
    fetchHospitals();
  }

  void fetchHospitals() async {
    try {
      QuerySnapshot<Map<String, dynamic>> query = await FirebaseFirestore
          .instance
          .collection("hospitals")
          .get();

      List<QueryDocumentSnapshot<Map<String, dynamic>>> data = query.docs;

      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in query.docs) {
        Map<String, dynamic> docData = doc.data();

        Hospital hospital = Hospital.fromJson(docData);

        hospitals.add(hospital);

        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wtf_flutter_projects/model/hospital.dart';
import 'package:wtf_flutter_projects/provider/hospital_notifier.dart';
import 'package:wtf_flutter_projects/widgets/contact_item.dart';

class HospitalList extends StatelessWidget {
  const HospitalList({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    var hospitalNoti = Provider.of<HospitalNotifier>(context);
    List<Hospital> hospitals = hospitalNoti.hospitals;
    return ListView.builder(
      itemCount: hospitals.length,
      itemBuilder: (context, index) { 
        var hospital = hospitals[index];
        return Contactitem(hospital: hospital,);
      }
    );
  }
}

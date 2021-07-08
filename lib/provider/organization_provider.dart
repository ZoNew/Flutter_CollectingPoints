import 'package:collecting_points/model/organization.dart';
import 'package:flutter/foundation.dart';

class OrganizationProvider with ChangeNotifier {
  List<Organization> _organizations = [
    // Organization(name: "ร้าน dmi",ownerId: ,memberId: [])
  ];

  // ดึงข้อมูล
  List<Organization> getTransaction(){
    return _organizations;
  }

  // เพิ่มข้อมูล
  void addUser(Organization organization){
    _organizations.add(organization);
  }

}
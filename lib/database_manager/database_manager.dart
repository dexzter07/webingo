import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference profileList = FirebaseFirestore.instance.collection('profileInfo');
  final CollectionReference orderList = FirebaseFirestore.instance.collection('orderList');

  Future<void> createUserData(String firstName, String lastName, String contactNumber, String emergencyNumber, String date, String time,
      String uid) async {
    return await profileList
        .doc(uid)
        .set({
      'fName': firstName,
      'lName': lastName,
      'contact': contactNumber,
      'emergency':emergencyNumber,
      'date':date,
      'time':time,
        });
  }

  Future<void> createOrderData(String length, String width, String height, String weight, String vatStatus,String vatNumber,String reason,String hsCode, String date, String time,
      String uid) async {
    return await orderList
        .doc(uid)
        .set({
      'length': length,
      'width': width,
      'height': height,
      'weight':weight,
      'vatStatus':vatStatus,
      'vatNumber':vatNumber,
      'reason':reason,
      'hsCode':hsCode,
      'date':date,
      'time':time,
      'uid':uid
    });
  }
}
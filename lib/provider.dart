import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  List<Map<String, String>> _details = [];
  
  List<Map<String, String>> get details => List.unmodifiable(_details);

  void remove(Map<String,String> item) {
    _details.remove(item);
    notifyListeners();
  }

  void addDetail(String name, String age, String place, String phone) {
    if(name.isNotEmpty && age.isNotEmpty&& place.isNotEmpty && phone.isNotEmpty)
    _details.add({
      'name': name,
      'age': age,
      'place': place,
      'phone': phone,
    });
    notifyListeners();
  }
}

//   String _name = "";
//   String _age = "";
//   String _phone = "";
//   String _place = "";

//   String get name => _name;
//   String get age => _age;
//   String get phone => _phone;
//   String get place => _place;

//   void changeName(String newName) {
//     _name = newName;
//     notifyListeners();
//   }

//   void changeage(String age) {
//     _age = age;
//     notifyListeners();
//   }

//   void changeplace(String place) {
//     _place = place;
//     notifyListeners();
//   }

//   void changephone(String phone) {
//     _phone = phone;
//     notifyListeners();
//   }
// }



class DataModel {
  String? id;
  String name;
  String email;
  String mobile;
  String gender;

  DataModel(
      {this.id,
        required this.name,
      required this.email,
      required this.mobile,
      required this.gender});

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'gender': gender,
    };
  }

  static DataModel fromJson(Map<String, dynamic> map) {
    return DataModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      mobile: map['mobile'].toString() ,
      gender: map['gender'] ?? '',
    );
  }
}

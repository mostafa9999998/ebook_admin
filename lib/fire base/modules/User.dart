class User {
  String? id;
  String? name;
  String? phone_number;
  late bool active;


  User({required this.name, required this.phone_number, required this.active,});

  User.fromjeson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    phone_number = data['phone_number'];
    active = data['active'];

  }
  Map<String, dynamic> tojeson() {
    return {
      'id': id,
      'name': name,
      'phone_number': phone_number ,
      'active': active,
    };
  }
}
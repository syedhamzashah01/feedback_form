class User {
  final int? id;
  final String name;
  final int age;
  final String email;
  final String password;
  final String cnic;
  final String department;

  User({
    this.id,
    required this.name,
    required this.age,
    required this.email,
    required this.password,
    required this.cnic,
    required this.department,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'email': email,
      'password': password,
      'cnic': cnic,
      'department': department,
    };
  }
}

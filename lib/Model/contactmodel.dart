class Contact {
  String firstName;
  String lastName;
  String phoneNumber;
  String email;

  Contact({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });
  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }
}

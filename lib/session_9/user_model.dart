class UserSubmission {
  final String fullName;
  final String email;
  final String password; // Just for demo, usually don't pass raw passwords around like this
  final int age;
  final String? bio;

  UserSubmission({
    required this.fullName,
    required this.email,
    required this.password,
    required this.age,
    this.bio,
  });

  @override
  String toString() {
    return 'UserSubmission(name: $fullName, email: $email, age: $age)';
  }
}

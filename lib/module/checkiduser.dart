class UserIDcheck {
  final bool status;

  UserIDcheck({
    required this.status,
  });
  factory UserIDcheck.fromJson(Map<String, dynamic> json) {
    return UserIDcheck(
      status: json['status'],
    );
  }
}

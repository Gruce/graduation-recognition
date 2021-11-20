class User {
  final String firstName;
  final String lastName;
  final int age;
final String action;
  const User({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.action,
  });

  User copy({
    String? firstName,
    String? lastName,
    int? age,
    String? action,
  }) =>
      User(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        age: age ?? this.age,
        action: action ?? this.action,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          age == other.age &&
          action == other.action;

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode ^ age.hashCode ^ action.hashCode;
}

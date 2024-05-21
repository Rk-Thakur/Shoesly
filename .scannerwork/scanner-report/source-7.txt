import 'package:equatable/equatable.dart';

class UserResponseEntity extends Equatable {
  final String? id;
  final String? email;
  final String? token;
  const UserResponseEntity({
    required this.id,
    required this.email,
    required this.token,
  });

  @override
  List<Object?> get props => [id, email, token];
}

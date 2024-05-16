import 'package:shoesly/features/authentication/domain/entities/user_response_entity.dart';

class UserResponseModel extends UserResponseEntity {
  const UserResponseModel({
    required super.id,
    required super.email,
    required super.token,
  });

  UserResponseModel copyWith({String? id, String? email, String? token}) {
    return UserResponseModel(
      id: id ?? this.id,
      email: email ?? this.email,
      token: token ?? this.token,
    );
  }
}

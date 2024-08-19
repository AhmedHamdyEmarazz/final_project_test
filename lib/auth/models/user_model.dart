class UserModel {
  late num? id;
  late String? name;
  late String? email;
  late String? created_at;
  late String? updated_at;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      this.created_at,
      this.updated_at});

  UserModel.fromJson(Map json) {
    id = json['id'] ?? 1;
    email = json['email'] ?? '';
    name = json['name'] ?? '';
    created_at = json['created_at'] ?? '';
    updated_at = json['updated_at'] ?? '';
  }
}

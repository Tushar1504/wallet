class UserModel {
  final String name;
  final int phoneNumber;
  final String mailId;
  final String panNo;
  final String password;
  UserModel(
      {required this.name,
      required this.mailId,
      required this.panNo,
      required this.password,
      required this.phoneNumber});
}

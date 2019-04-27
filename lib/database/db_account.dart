class AccountObject {
  int accountNo;
  String studentID = '';
  String password = '';
  String firstName = '';
  String lastName = '';
  String email = '';
  String telNo = '';
  String qrCode = '';
  int noOfFeedback;
  double avgRating;
  int token;
  String categotyHave = '';
  String profilePic;
  String inSession;
  DateTime createdAt;
  DateTime updatedAt;

  AccountObject(
      this.accountNo,
      this.studentID,
      this.password,
      this.firstName,
      this.lastName,
      this.email,
      this.telNo,
      this.qrCode,
      this.noOfFeedback,
      this.avgRating,
      this.token,
      this.categotyHave,
      this.profilePic,
      this.inSession,
      this.createdAt,
      this.updatedAt);
}

AccountObject user1 = AccountObject(
    1,
    '5931307021',
    'password',
    'Patsornchai',
    'Wiboontanasarn',
    'patsornchai@gmail.com',
    '0812345678',
    'qr_bus',
    5,
    4.5,
    100,
    '0',
    'bus_pic',
    'false',
    DateTime.parse('2019-04-20 17:18:35'),
    DateTime.parse('2019-04-20 17:18:35'));

    AccountObject user2 = AccountObject(
    2,
    '5931333321',
    'password',
    'Tembhum',
    'Chaiwattanayon',
    'tembhum.ch@gmail.com',
    '0812345678',
    'qr_hope',
    5,
    4.5,
    100,
    '0',
    'hope_pic',
    'false',
    DateTime.parse('2019-04-20 17:18:35'),
    DateTime.parse('2019-04-20 17:18:35'));

import 'dart:io';

// accountStatus
// -'NoSession'
// -'SessionOne'
// -'SessionTwo'
// -'SessionThree'
// -'SessionFour'


class AccountObject {
  int accountNo;
  String studentID = '';
  String password = '';
  String firstName = ''; //editable
  String lastName = ''; //editable
  String email = ''; //editable
  String telNo = ''; //editable
  String qrCode = '';
  int noOfFeedback;
  double avgRating;
  int token;
  String categotyHave = ''; //editable
  String profilePic; //editable
  String inSession;
  DateTime createdAt;
  DateTime updatedAt;
  File newProfilePic; //For Local use only

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
      this.updatedAt,
      this.newProfilePic);
}

DateTime sampleTimeA = DateTime.parse('2019-04-20 12:12:12');
File emptyFileA;

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
    'assets/profile/Bus.PNG',
    'false',
    sampleTimeA,
    sampleTimeA,
    emptyFileA);

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
    'assets/profile/Hope.PNG',
    'false',
    sampleTimeA,
    sampleTimeA,
    emptyFileA);

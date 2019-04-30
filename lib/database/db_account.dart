import 'dart:io';

// accountStatus
// -'NoSession'
// -'SessionOne'
// -'SessionTwo'
// -'SessionThree'
// -'SessionFour'


class AccountObject {
  int aid;
  String it_chula = '';
  String password = '';
  String first_Name = '';
  String last_Name = '';
  String email = '';
  String tel_No = '';
  String qrCode = '';
  int no_Of_Feedback;
  double avg_Rating;
  int token;
 // String categotyHave = '';
  String image;
  bool in_session;
  DateTime createdAt;
  DateTime updatedAt;
   AccountObject({
      this.aid,
      this.it_chula,
      this.password,
      this.first_Name,
      this.last_Name,
      this.email,
      this.tel_No,
      this.qrCode,
      this.no_Of_Feedback,
      this.avg_Rating,
      this.token,
   //   this.categotyHave,
      this.image,
      this.in_session,
      this.createdAt,
      this.updatedAt});
//       factory AccountObject.fromJson(Map<String, dynamic> json) {
  
//     return AccountObject(
//       accountNo: json['username'],
//       firstName: json['fullname'],
//       lastName: json['lastname'],
//       telNo: json['phoneno'],
//       email: json['email'],
//        studentID: json['username'],
//       qrCode: json['fullname'],
//       noOfFeedback: json['lastname'],
//       avgRating: json['phoneno'],
//        token: json['username'],
//       categotyHave: json['fullname'],
//       profilePic: json['lastname'],
//       inSession: json['phoneno'],
  
      
//     );
   
//   }
 factory AccountObject.fromJson(Map<String, dynamic> json) {

  
    return AccountObject(
      aid: json['aid'],
      first_Name: json['first_name'],
      last_Name: json['last_name'],
      tel_No: json['tel_no'],
      email: json['email'],
       it_chula: json['it_chula'],
       qrCode: json['qrcode'],
       no_Of_Feedback: json['no_of_feedback'],
       avg_Rating: json['avg_rating'],
        token: json['token'],
       //categotyHave: json['fullname'],
       image: json['image'],
       in_session: json['in_session'],
  
      
    );
}
 }
 

DateTime sampleTimeA = DateTime.parse('2019-04-20 12:12:12');
File emptyFileA;

// AccountObject user1 =  AccountObject(
//     1,
//     '5931307021',
//     'password',
//     'Patsornchai',
//     'Wiboontanasarn',
//     'patsornchai@gmail.com',
//     '0812345678',
//     'qr_bus',
//     5,
//     4.5,
//     100,
//     '0',
//     'assets/profile/Bus.PNG',
//     'false',
//     sampleTimeA,
//     sampleTimeA,
//     emptyFileA);

// AccountObject user2 = AccountObject(
//     2,
//     '5931333321',
//     'password',
//     'Tembhum',
//     'Chaiwattanayon',
//     'tembhum.ch@gmail.com',
//     '0812345678',
//     'qr_hope',
//     5,
//     4.5,
//     100,
//     '0',
//     'assets/profile/Hope.PNG',
//     'false',
//     sampleTimeA,
//     sampleTimeA,
//     emptyFileA);

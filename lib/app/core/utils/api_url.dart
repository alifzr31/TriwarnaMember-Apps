class ApiUrl {
  static final String baseUrl = 'https://member.triwarna.co.id/api';
  static final String profileStorage = 'https://member.triwarna.co.id/storage/profile';
  static final String qrStorage = 'https://member.triwarna.co.id/storage/qr/members';
  static final String prizeStorage = 'https://member.triwarna.co.id/storage/prizes/';
  static final String voucherStorage = 'https://member.triwarna.co.id/storage/qr/points/';
  static final String receiptImage = 'https://member.triwarna.co.id/storage/attachments/';
  static final String receiptSignature = 'https://member.triwarna.co.id/storage/signatures/';
  static final EndPoint endPoint = EndPoint();
}

class EndPoint {
  // AUTH
  static final String login = '/login';
  static final String register = '/register';
  static final String verifyEmail = '/send-verify-email';
  static final String logout = '/logout';
  
  // DASHBOARD
  static final String store = '/triwarna_store';
  static final String profile = '/profile';
  static final String lottery = '/undian';

  // POINT
  static final String point = '/point';
  static final String redeemPoint = '/point/update';
  static final String prize = '/point/prize_list';

  // VOUCHER
  static final String voucher = '/voucher';

  // SHOPPING
  static final String shopping = '/history';
  
  // ACCOUNT
  static final String updateProfile = '/profile/update';
  static final String createPin = '/profile/pin/create';
  static final String changePin = '/profile/pin/update';
  static final String changePass = '/profile/password/update';
  static final String village = '/desa';
}
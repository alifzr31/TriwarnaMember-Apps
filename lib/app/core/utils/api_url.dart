class ApiUrl {
  static final String baseUrl = 'http://10.1.1.152/triwarna/api';
  static final String profileStorage = 'http://10.1.1.152/triwarna/storage/profile';
  static final String qrStorage = 'http://10.1.1.152/triwarna/storage/qr/members';
  static final String prizeStorage = 'http://10.1.1.152/triwarna/storage/prizes/';
  static final String voucherStorage = 'http://10.1.1.152/triwarna/storage/qr/points/';
  static final String receiptImage = 'http://10.1.1.152/triwarna/storage/attachments/';
  static final String receiptSignature = 'http://10.1.1.152/triwarna/storage/signatures/';
  static final EndPoint endPoint = EndPoint();
}

class EndPoint {
  // AUTH
  static final String login = '/login';
  static final String register = '/register';
  
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
  static final String changePin = '/profile/pin/update';
  static final String changePass = '/profile/password/update';
  static final String village = '/desa';
}
class ApiUrl {
  static final String baseUrl = 'http://10.1.1.152/triwarna/api';
  static final String profileStorage = 'http://10.1.1.152/triwarna/storage/profile';
  static final String qrStorage = 'http://10.1.1.152/triwarna/storage/qr/members';
  static final String prizeStorage = 'http://10.1.1.152/triwarna/storage/prizes/';
  static final EndPoint endPoint = EndPoint();
}

class EndPoint {
  // AUTH
  static final String login = '/login';
  static final String register = '/register';
  
  // DASHBOARD
  static final String store = '/triwarna_store';
  static final String profile = '/profile';

  // POINT
  static final String point = '/point';
  static final String redeemPoint = '/point/update';
  static final String prize = '/point/prize_list';

  // ACCOUNT
  static final String updateProfile = '/profile/update';
  static final String changePin = '/profile/pin/update';
  static final String changePass = '/profile/password/update';
  static final String village = '/desa';
}
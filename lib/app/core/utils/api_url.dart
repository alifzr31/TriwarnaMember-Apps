class ApiUrl {
  static final String baseUrl = 'http://10.1.1.152/triwarna/api';
  static final String profileStorage = 'http://10.1.1.152/triwarna/storage/profile';
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
}
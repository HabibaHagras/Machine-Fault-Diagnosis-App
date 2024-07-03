class ApiEndPoints {
  static final String baseUrl ='https://dcmotorproject-001-site1.atempurl.com/api/';
    // static final String baseUrl = 'https://dummyjson.com/users';
// http://restapi.adequateshop.com/api/

  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'authaccount/registration';
  final String loginEmail = 'login';
}
// authaccount/login
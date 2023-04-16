
const String baseApiUrl = 'https://student.valuxapps.com';
const String version = '/api';
const String loginEndPoint = '/login';
const String profileEndPoint = '/profile';
const String registerEndPoint = '/register';
const String homeEndPoint = '/home';
const String categoriesEndPoint = '/categories';
const String updateProfileEndPoint = '/update-profile';
const String searchEndPoint = '/products/search';
const String changeFavoritesEndPoint = '/favorites';
const String favoritesEndPoint = '/favorites';
String categoriesDetailsEndPoint(int categoriesId)=> '/categories/$categoriesId';

String productsDetailsEndPoint(int productsId)=>'/products/$productsId';



 String? token = '' ;
 late String language ;
import 'package:injectable/injectable.dart';

@lazySingleton
class UserDataService {
  String? storeId;
  String? userId;
  String? logo;
  String? storeName;
  String? address;
  String? storeStatus;
}

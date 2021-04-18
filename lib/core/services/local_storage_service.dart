import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class LocalStorageService {
  GetStorage _box = GetStorage();

  void save(String key, String value) {
    _box.write(key, value);
  }

  String? read(String key) {
    return _box.read<String>(key);
  }

  void clear(String key) {
    _box.write(key, null);
  }
}

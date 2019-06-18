import 'package:waste_sorting_helper/model/wast_type_entity.dart';
import 'package:waste_sorting_helper/model/wast_search_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "Wast") {
      return Wast.fromJson(json) as T;
    } else if (T.toString() == "WastSearchEntity") {
      return WastSearchEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}

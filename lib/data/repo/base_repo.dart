
import 'package:shcedule_appointmant/data/repo/model.dart';

abstract class BaseRepository {
  Future<BaseModel> getApartment();
}
import 'package:shcedule_appointmant/data/repo/base_entity.dart';
import 'package:shcedule_appointmant/data/repo/model.dart';

import 'base_repo.dart';

Map<String, dynamic> apartment = {
  "description": "Home",
  "media_urls": [
    {
      "type": "image",
      "url": "https://i.pinimg.com/564x/23/d8/0c/23d80c73cc2e4500d00254e3e3e7d6d4.jpg",
    },
    {
      "type": "image",
      "url": "https://i.pinimg.com/564x/28/98/f2/2898f273c4272244e06fa4ab6fc3cb9d.jpg",
    },
    {
      "type": "image",
      "url": "https://q-xx.bstatic.com/xdata/images/hotel/max500/150571840.jpg?k=0757ca2e8ecc7d2eac3f6dc8f6f141acdb729530d7dfeca8437f4581758a7bfd&o=",
    }
  ],
  "dates": [
      "2021-08-01",
      "2021-08-02",
      "2021-08-01",
      "2021-08-03",
      "2021-08-04",
      "2021-08-05",
      "2021-08-06",
      "2021-08-07",
      "2021-08-11",
      "2021-08-12",
      "2021-08-13",
      "2021-08-14",
      "2021-08-15",
      "2021-08-16",
      "2021-08-17",
      "2021-08-18",
      "2021-08-20",
  ]
};

class FakeRepo extends BaseRepository {
  @override
  Future<BaseModel> getApartment() {
    return Future.delayed(
      const Duration(microseconds: 300),
          () => Apartment.fromMap(apartment),
    );
  }


}
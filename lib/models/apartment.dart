import 'package:equatable/equatable.dart';

abstract class BaseModel extends Equatable {
  const BaseModel();

  static BaseModel fromMap(Map map) {
    throw UnimplementedError();
  }
}

class MediaUrl extends BaseModel {
  final String type;
  final String url;

  MediaUrl({this.type, this.url});

  static MediaUrl fromMap(Map json) => MediaUrl(
        type: json["type"],
        url: json["url"],
      );

  @override
  List<Object> get props => [type, url];
}

class Apartment extends BaseModel {
  final String description;
  final List<MediaUrl> medialUrls;
  final List<DateTime> dates;
  final String address;

  const Apartment({this.description, this.medialUrls, this.dates, this.address});

  @override
  static Apartment fromMap(Map json) {
    List<DateTime> dates =
        (json["dates"] ?? []).map<DateTime>((String date) => DateTime.parse(date)).toList();
    List<MediaUrl> medialUrls = (json["media_urls"] ?? [])
        .map<MediaUrl>((Map<String, String> mediaUrl) => MediaUrl.fromMap(mediaUrl))
        .toList();

    return Apartment(
      description: json["description"],
      address: json["address"],
      dates: dates,
      medialUrls: medialUrls,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [description, dates, medialUrls, address];
}

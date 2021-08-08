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

  static BaseModel fromMap(Map json) => MediaUrl(
        type: json["type"],
        url: json["url"],
      );

  @override
  List<Object> get props => [type, url];
}

class Apartment extends BaseModel {
  final String description;
  final List<BaseModel> medialUrls;
  final List<DateTime> dates;

  const Apartment({this.description, this.medialUrls, this.dates});

  @override
  static BaseModel fromMap(Map json) {
    List<DateTime> dates =
        (json["dates"] ?? []).map<DateTime>((String date) => DateTime.parse(date)).toList();
    List<BaseModel> medialUrls = (json["media_urls"] ?? [])
        .map<BaseModel>((Map<String, String> mediaUrl) => MediaUrl.fromMap(mediaUrl))
        .toList();

    return Apartment(
      description: json["description"],
      dates: dates,
      medialUrls: medialUrls,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [description, dates, medialUrls];
}

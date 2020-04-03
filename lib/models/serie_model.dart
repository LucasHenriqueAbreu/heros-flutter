import 'package:heros/models/thumbnail_model.dart';
import 'package:heros/models/urls_model.dart';

class Serie {
  int id;
  String title;
  String description;
  String resourceURI;
  Urls urls;
  String modified;
  String start;
  String end;
  Thumbnail thumbnail;

  Serie(
      {this.id,
      this.title,
      this.description,
      this.resourceURI,
      this.urls,
      this.modified,
      this.start,
      this.end,
      this.thumbnail});

  Serie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    resourceURI = json['resourceURI'];
    // urls = json['urls'] != null ? new Urls.fromJson(json['urls']) : null;
    modified = json['modified'];
    start = json['start'];
    end = json['end'];
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['resourceURI'] = this.resourceURI;
    if (this.urls != null) {
      data['urls'] = this.urls.toJson();
    }
    data['modified'] = this.modified;
    data['start'] = this.start;
    data['end'] = this.end;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    return data;
  }
}

import 'package:heros/models/thumbnail_model.dart';
import 'package:heros/models/urls_model.dart';

class Character {
  int id;
  String name;
  String description;
  String modified;
  String resourceURI;
  List<Urls> urls;
  Thumbnail thumbnail;

  Character({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.resourceURI,
    this.urls,
    this.thumbnail,
  });

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    resourceURI = json['resourceURI'];
    if (json['urls'] != null) {
      urls = new List<Urls>();
      json['urls'].forEach((v) {
        urls.add(new Urls.fromJson(v));
      });
    }
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['modified'] = this.modified;
    data['resourceURI'] = this.resourceURI;
    if (this.urls != null) {
      data['urls'] = this.urls.map((v) => v.toJson()).toList();
    }
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    return data;
  }
}

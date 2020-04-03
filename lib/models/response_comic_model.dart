import 'comic_model.dart';

class ComicDataWrapper {
  ComicDataContainer data;

  ComicDataWrapper(this.data);

  ComicDataWrapper.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new ComicDataContainer.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
  }
}

class ComicDataContainer {
  int offset;
  int limit;
  int total;
  int count;
  List<Comic> comics;

  ComicDataContainer(
      {this.offset, this.limit, this.total, this.count, this.comics});

  ComicDataContainer.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      comics = new List<Comic>();
      json['results'].forEach((v) {
        comics.add(new Comic.fromJson(v)); // corno
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['count'] = this.count;
    if (this.comics != null) {
      data['results'] = this.comics.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

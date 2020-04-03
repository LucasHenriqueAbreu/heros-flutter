import 'package:heros/models/storie_model.dart';

class StorieDataWrapper {
  StorieDataContainer data;

  StorieDataWrapper(this.data);

  StorieDataWrapper.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new StorieDataContainer.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
  }
}

class StorieDataContainer {
  int offset;
  int limit;
  int total;
  int count;
  List<Storie> stories;

  StorieDataContainer(
      {this.offset, this.limit, this.total, this.count, this.stories});

  StorieDataContainer.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      stories = new List<Storie>();
      json['results'].forEach((v) {
        stories.add(new Storie.fromJson(v)); // corno
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['count'] = this.count;
    if (this.stories != null) {
      data['results'] = this.stories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

import 'package:heros/models/serie_model.dart';

class SerieDataWrapper {
  SerieDataContainer data;

  SerieDataWrapper(this.data);

  SerieDataWrapper.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new SerieDataContainer.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
  }
}

class SerieDataContainer {
  int offset;
  int limit;
  int total;
  int count;
  List<Serie> series;

  SerieDataContainer(
      {this.offset, this.limit, this.total, this.count, this.series});

  SerieDataContainer.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      series = new List<Serie>();
      json['results'].forEach((v) {
        series.add(new Serie.fromJson(v)); // corno
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['count'] = this.count;
    if (this.series != null) {
      data['results'] = this.series.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

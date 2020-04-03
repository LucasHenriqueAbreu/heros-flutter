import 'event_model.dart';

class EventDataWrapper {
  EventDataContainer data;

  EventDataWrapper(this.data);

  EventDataWrapper.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new EventDataContainer.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
  }
}

class EventDataContainer {
  int offset;
  int limit;
  int total;
  int count;
  List<Event> events;

  EventDataContainer(
      {this.offset, this.limit, this.total, this.count, this.events});

  EventDataContainer.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      events = new List<Event>();
      json['results'].forEach((v) {
        events.add(new Event.fromJson(v)); // corno
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['count'] = this.count;
    if (this.events != null) {
      data['results'] = this.events.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

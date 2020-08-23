class Chants {
  final String title;
  final int id;
  final String body;
  final int duration;
  Chants(this.title, this.id, this.body, this.duration);

  Chants.fromData(Map<String, dynamic> data)
      : title = data['title'],
        id = data['id'],
        body = data['content'],
        duration = data['duration'];
}

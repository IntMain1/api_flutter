class Source {
  String? id;
  String? name;

  Source({this.id, this.name});
  //factory function to map
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }
}

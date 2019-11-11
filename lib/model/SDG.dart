class SDG {
  String id;
  String title;
  String description;
  String imageLink;
  SDG({this.id, this.title, this.description, this.imageLink});
  void parseRawJson(Map<dynamic, dynamic> rawJson) {
    this.id = rawJson["id"].toString();
    this.title = rawJson["title"];
    this.description = rawJson["description"];
    this.imageLink = rawJson["imageLink"];
  }
}
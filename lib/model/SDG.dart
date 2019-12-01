class SDG {
  String id;
  String title;
  String description;
  String imageLink;
  bool isPicked;
  SDG({this.id, this.title, this.description, this.imageLink}) {
    this.isPicked = false;
  }
  SDG parseRawJson(Map<dynamic, dynamic> rawJson) {
    this.id = rawJson["id"].toString();
    this.title = rawJson["title"];
    this.description = rawJson["description"];
    this.imageLink = rawJson["imageLink"];
    return this;
  }
}
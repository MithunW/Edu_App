class PaperShowcase {
  String id;
  String url;
  String name;

  PaperShowcase({
    this.id,
    this.url,
    this.name,
  });

  void setId(String id) {
    this.id = id;
  }

  String getId() {
    return this.id;
  }

  void setUrl(String url) {
    this.url = url;
  }

  String getUrl() {
    return this.url;
  }

  void setName(String name) {
    this.name = name;
  }

  String getName() {
    return this.name;
  }
}

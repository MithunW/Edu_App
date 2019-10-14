class PaperShowcase {
  String id;
  String url;
  String name;
  int number;
  int hTime;
  int mTime;
  PaperShowcase({
    this.id,
    this.url,
    this.name,
    this.number,
    this.hTime,
    this.mTime,
  });

  void setId(String id) {
    this.id = id;
  }

  void setUrl(String url) {
    this.url = url;
  }

  void setName(String name) {
    this.name = name;
  }

  void setNumber(int n) {
    this.number = n;
  }

  void sethTime(int n) {
    this.hTime = n;
  }

  void setmTime(int n) {
    this.mTime = n;
  }
}

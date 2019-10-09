class Paper {
  String id;
  List<Question> qs;

  Paper({
    this.id,
    this.qs,
  });

  factory Paper.fromJson(Map<String, dynamic> json) {
    var list = json['qs'] as List;
    List<Question> qsList = list.map((i) => Question.fromJson(i)).toList();
    return Paper(
      id: json["id"],
      qs: qsList,
    );
  }

  void setId(String id) {
    this.id = id;
  }
}

class Question {
  int n;
  Content q;
  List<Answer> as;
  int a;

  Question({
    this.n,
    this.q,
    this.as,
    this.a,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    var asFromJson = json['as'] as List;
    List<Answer> asList = asFromJson.map((i) => Answer.fromJson(i)).toList();
    return Question(
      n: json["n"],
      q: Content.fromJson(json["q"]),
      as: asList,
      a: json["a"],
    );
  }
}

class Answer {
  int n;
  String t;
  String i;

  Answer({
    this.n,
    this.t,
    this.i,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      n: json["n"],
      t: json["t"],
      i: json["i"],
    );
  }
}

class Content {
  String t;
  String i;

  Content({
    this.i,
    this.t,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      t: json["t"],
      i: json["i"],
    );
  }
}

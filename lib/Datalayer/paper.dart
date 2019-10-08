class Paper {
  int id;
  List<Question> qs;

  Paper({
    this.id,
    this.qs,
  });

  factory Paper.fromJson(Map<String, dynamic> json) {
    return Paper(
      id: json["id"],
      qs: json["qs"].map((q) => Question.fromJson(q)),
    );
  }
}

class Question {
  int n;
  Content q;
  List<Answer> as;
  String a;

  Question({
    this.n,
    this.q,
    this.as,
    this.a,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      n: json["n"],
      q: Content.fromJson(json["q"]),
      as: json["as"].map((a) => Answer.fromJson(a)),
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

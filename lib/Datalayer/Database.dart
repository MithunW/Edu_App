class Database {
  static List<String> getPapers() {
    List list = new List<String>();
    int counter = 10;
    int count = counter;
    do {
      int paper = (count + 1) - counter;
      list.add('ප්‍රශ්න පත්‍රය $paper ');
      counter--;
    } while (counter > 0);

    //TODO implement the backend connection for the function
    return list;
  }

  static List getQuestions() {
    List list = new List<String>();
    int counter = 10;
    int count = counter;
    do {
      int question = (count + 1) - counter;
      list.add('ප්‍රශ්න $question ');
      counter--;
    } while (counter > 0);

    return list;
  }
}

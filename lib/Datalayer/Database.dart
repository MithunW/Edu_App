class Database {
  //TODO implement the backend connection for the functions

  static List<String> getPapers() {
    List list = new List<String>();
    int counter = 10;
    int count = counter;
    do {
      int paper = (count + 1) - counter;
      list.add('ප්‍රශ්න පත්‍රය $paper ');
      counter--;
    } while (counter > 0);

    return list;
  }

  static List<String> getUsers() {
    List list = new List<String>();
    int counter = 15;
    int count = counter;
    do {
      int user = (count + 1) - counter;
      list.add('User $user ');
      counter--;
    } while (counter > 0);

    return list;
  }

  static List<String> getQuestions() {
    List list = new List<String>();
    int counter = 10;
    int count = counter;
    do {
      int q = (count + 1) - counter;
      list.add('ප්‍රශ්න $q ');
      counter--;
    } while (counter > 0);

    return list;
  }
}

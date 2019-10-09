import 'package:edu_app/Datalayer/paperShowcase.dart';

class Database {
  List<PaperShowcase> getPapers() {
    List list = new List<PaperShowcase>();
    int counter = 1;
    do {
      PaperShowcase paper = new PaperShowcase();

      //TODO: need to implement a method get the details from the Papers table in db and
      //create papershowcase object(used only to show the available papers)
      // and return them as a list to the home view

      paper.setId(counter.toString());
      paper.setUrl('url here');
      paper.setName('paper$counter.json');
      list.add(paper);
      counter++;
    } while (counter < 11);

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

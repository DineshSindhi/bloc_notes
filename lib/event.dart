abstract class ListEvent{}

class addNotes extends ListEvent{
  String title;
  String desc;
  addNotes({required this.title,required this.desc});
}
class upNotes extends ListEvent{
  String title;
  String desc;
  int index;
  upNotes({required this.title,required this.desc,required this.index});
}
class deleteNotes extends ListEvent{
  int index;
  deleteNotes({required this.index});
}
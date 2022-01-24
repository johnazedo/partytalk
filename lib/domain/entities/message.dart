

class Message {
  late String? id;
  late bool mine;
  late bool read;
  late String text;
  late String time;

  Message({this.id, required this.mine, this.read = false, required this.text, required this.time});
}
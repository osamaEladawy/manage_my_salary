// ignore_for_file: must_be_immutable

class MyModel {
  int? _id;
  String? _date;
  num? _installment;
  String? _note;

  MyModel(dynamic obj) {
    _id = obj['id'];
    _date = obj['date'];
    _note = obj['note'];
    _installment = obj['installment'];
  }

  MyModel.fromSnapshot(Map<String, dynamic> documents) {
    _id = documents['id'];
    _date = documents["date"];
    _note = documents['note'];
    _installment = documents['installment'];
  }

  Map<String, dynamic> toJson() => {
        'id': _id,
        "date": _date,
        "note": _note,
        "installment": _installment,
      };

  String? get note => _note;
  String? get date => _date;
  num? get id => _id;
  num? get installment => _installment;

  set noteDate(String? date) => _date;
  set noteContent(num? installment) => _installment;
  set noteTitle(String? note) => _note;
}

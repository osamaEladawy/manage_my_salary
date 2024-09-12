
class Users {
  int? _id;
  String? _name;
  String? _email;
  String? _country;
  num? _monthlySalary;
  num? _bankIncome;

  Users(dynamic obj) {
    _id = obj['id'];
    _name = obj['name'];
    _email = obj['email'];
    _country = obj['country'];
    _monthlySalary = obj['monthlySalary'];
    _bankIncome = obj['bankIncome'];
  }

  Users.fromSnapshot(Map<String, dynamic> map) {
    _id = map['id'];
    _name = map['name'];
    _email = map['email'];
    _country = map['country'];
    _monthlySalary = map['monthlySalary'];
    _bankIncome = map['bankIncome'];
  }

  Map<String, dynamic> toJson() => {
        'id': _id,
        "name": _name,
        "email": _email,
        "country": _country,
        "monthlySalary": _monthlySalary,
        "bankIncome": _bankIncome,
      };

  String? get name => _name;
  String? get email => _email;
  String? get country => _country;
  num? get monthlySalary => _monthlySalary;
  num? get bankIncome => _bankIncome;

  set userName(String? content) => _name;
  set userEmail(String? email) => _email;
  set userCountry(String? country) => _country;
  set userBankIncome(num? bankIncome) => _bankIncome;
  set userMonthlySalary(num? monthlySalary) => _monthlySalary;
}

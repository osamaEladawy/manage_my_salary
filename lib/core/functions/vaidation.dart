String? validate(String value, type, [int min = 0, int max = 0]) {
  if (value.isEmpty) {
    return "This field is required";
  }
  if (value.isNotEmpty && type == "Name" && value.length < 2) {
    return "This $type  less than $min characters";
  }
  if (value.isNotEmpty &&
      type == "Email" &&
      value.endsWith("@gmail.com") == false) {
    return "This $type not end @gmail.com";
  }
  // if (type == "bankIncome" &&  value.startsWith("abc") == false) {
  //   return "This $type should be a number";
  // }
  // if (value != null && type == "monthlySalary" && value != num) {
  //   return "This $type should be a number";
  // }
  if (value.length < min) {
    return "This $type less than $min";
  }
  if (value.length > max) {
    return "Mus'nt be $type longer than $max";
  }
  return null;
}

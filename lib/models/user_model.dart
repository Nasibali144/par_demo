class User {
  int id;
  String name;
  String salary;
  String age;

  User({this.id, this.age, this.salary, this.name});

  User.fromJson(Map<String, dynamic> json)
  : id = json['id'],
    name = json['name'],
    salary = json['salary'],
    age = json['age'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'age' : age,
    'salary' : salary,
  };

}
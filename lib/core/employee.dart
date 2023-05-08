class Employee {
  final int id;
  final String title;
  final String body;

  Employee({required this.id, required this.title, required this.body});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
enum Skill { FLUTTER, DART, OTHER }

class Address{
  final String _street;
  final String _city;
  final int _zipCode;

  Address(this._street, this._city, this._zipCode);

  String get street => _street;
  String get city => _city;
  int get zipCode => _zipCode;
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skill;
  Address _address;
  final int _yearsOfExperience;

  Employee(this._name, this._baseSalary, List<Skill> skills, this._address, this._yearsOfExperience) : _skill = List<Skill>.unmodifiable(skills);

  Employee.mobileDev(this._name, this._baseSalary, List<Skill> skills, this._address, this._yearsOfExperience): _skill = List<Skill>.unmodifiable(skills){
    if(!_skill.contains(Skill.FLUTTER) && !_skill.contains(Skill.DART)){
      throw ArgumentError('Mobile Developer need Flutter or Dart!');
    }
  }

  String get employeeName => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get employeeSkills => _skill;
  Address get employeeAddress => _address;
  int get employeeYOE => _yearsOfExperience;

  double computeSalary(){
    double salary = _baseSalary + (_yearsOfExperience * 2000 );

    if(_skill.contains(Skill.FLUTTER)) salary += 5000;
    if(_skill.contains(Skill.DART)) salary += 3000;
    if(_skill.contains(Skill.OTHER)) salary += 1000;

    return salary;
  }

  void printDetails() {
    print('Employee: $_name\nBase Salary: \$${_baseSalary}\nEmployee Skills: $_skill\nEmployee Address: ${_address.street} ${_address.city} ${_address.zipCode}\nEmployee YOE: $_yearsOfExperience');
  }
}

void main() {
  var address1 =  Address('St 123', 'Phnom Penh', 123456);
  var emp1 = Employee('Sokea', 40000, [Skill.OTHER], address1, 3);
  emp1.printDetails();
  print(emp1.computeSalary());

  var address2 =  Address('St 456', 'Phnom Penh', 123456);
  try{
    var emp2 = Employee.mobileDev('Ronan', 45000,[Skill.OTHER], address2, 20);
    emp2.printDetails();
    print(emp2.computeSalary());
  } catch (ArgumentError){
    print(ArgumentError);
  };
  
}
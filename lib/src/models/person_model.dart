class PersonModel{
  String? _name;
  String? _surname;
  String? _email;
  int? _dni;
  String? _location;
  int? _phoneNumber;
  String? _password;

  PersonModel(String name, String surname, String email, int dni, String location, int phoneNumber, String password,){
    _name = name;
    _surname = surname;
    _email = email;
    _dni = dni;
    _location = location;
    _phoneNumber = phoneNumber;
    _password = password;
  }

  String get name => _name!;
  set name(String name){
    _name = name;
  }
  String get surname => _surname!;
  set surname(String surname){
    _surname = surname;
  }
  String get email => _email!;
  set email(String email){
    _email = email;
  }
  int get dni => _dni!;
  set dni(int dni){
    _dni = dni;
  }
  String get location => _location!;
  set location(String name){
    _location = location;
  }
  int get phoneNumber => _phoneNumber!;
  set phoneNumber(int phoneNumber){
    _phoneNumber = phoneNumber;
  }
  String get password => _password!;
  set password(String password){
    _password = password;
  }

}
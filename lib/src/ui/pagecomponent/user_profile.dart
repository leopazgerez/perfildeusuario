import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          _top(),
          _bottom(),
        ],
      ),
    );
  }

  Widget _top() {
    String dropdownValue = 'Salta';
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(),
              labelText: 'Nombre y pellido'),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          validator: (email) {
            if (email == null || email.isEmpty) {
              return 'E-mail es requerido';
            }
            String pattern = r'\w+@\w+\.\w+';
            RegExp regex = RegExp(pattern);
            if (!regex.hasMatch(email)) return 'Formato Incorrecto de E-mail';
            return null;
          },
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(),
            labelText: 'Email',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          validator: (dni) {
            if (dni == null || dni.isEmpty) {
              return 'DNI requerido';
            } else if (dni.length < 10) {
              return 'DNI incorrecto';
            }
            return null;
          },
          decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(), labelText: 'DNI'),
        ),
        const SizedBox(
          height: 20,
        ),
        DropdownButtonFormField(
          value: dropdownValue,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Salta', 'Joaquin V. Gonzalez', 'Quebrachal', 'Metan']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(fontSize: 20),
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  Widget _bottom() {
    return Container();
  }
}


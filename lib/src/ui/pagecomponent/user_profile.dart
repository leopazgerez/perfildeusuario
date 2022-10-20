import 'package:flutter/material.dart';
import 'package:perfildeusuario/src/models/person_model.dart';
import 'package:perfildeusuario/src/ui/pagecomponent/custom_button.dart';

class UserProfile extends StatefulWidget {
  final PersonModel? model;
  const UserProfile({Key? key, this.model}) : super(key: key);
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController nameAndSurnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dniController = TextEditingController();
  List<String> locationList = [
    'Salta',
    'Joaquin V. Gonzalez',
    'Quebrachal',
    'Metan'
  ];
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
        Column(
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Editar perfil",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Nombre y apellido",
                    style: TextStyle(color: Colors.grey.shade800),
                  ),
                ),
              ],
            ),
          ],
        ),
        TextFormField(
          controller: nameAndSurnameController,
          decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(),
              hintText:
                  (widget.model?.name != null && widget.model?.surname != null)
                      ? '${widget.model!.name} ${widget.model!.surname}'
                      : 'Nombre y apellido'),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child:
                  Text("Email", style: TextStyle(color: Colors.grey.shade800)),
            ),
          ],
        ),
        TextFormField(
          controller: emailController,
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
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(),
            hintText: widget.model?.email ?? 'Email',
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text("DNI", style: TextStyle(color: Colors.grey.shade800)),
            ),
          ],
        ),
        TextFormField(
          controller: dniController,
          keyboardType: TextInputType.number,
          validator: (dni) {
            if (dni == null || dni.isEmpty) {
              return 'DNI requerido';
            } else if (dni.length < 10) {
              return 'DNI incorrecto';
            }
            return null;
          },
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(),
            hintText: widget.model?.dni.toString() ?? 'DNI',
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text("Localidad",
                  style: TextStyle(color: Colors.grey.shade800)),
            ),
          ],
        ),
        DropdownButtonFormField(
          icon: const Icon(Icons.arrow_drop_down_sharp),
          value: dropdownValue,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: locationList.map<DropdownMenuItem<String>>((String value) {
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
  _button(){
    return CustomButton(
        text: "Guardar",
      backgroundColor: const Color(0xFF0000CC),
    );
  }
  Widget _bottom() {
    return Container();
  }
}

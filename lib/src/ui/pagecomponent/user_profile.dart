import 'package:flutter/material.dart';
import 'package:perfildeusuario/src/models/person_model.dart';

class UserProfile extends StatefulWidget {
  final PersonModel? model;
  const UserProfile({Key? key, this.model}) : super(key: key);
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final numberPhoneController = TextEditingController();
  final numberPhone = "3877777";
  final currentPassword = "pass";
  final nameAndSurname = 'Ana Paz';
  final email = 'example@gmail.com';
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
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //_top(),
            //_bottom(),
            _titleTextForm("Nombre y apellido"),
            _textFormField(nameAndSurname, "Nombre y apellido"),
            _titleTextForm("Email"),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child:TextFormField(
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
            ),
            _titleTextForm("DNI"),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child: TextFormField(
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
            ),
            Row(
              children: [
                _titleTextForm("Localidad"),
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
            ),
            _titleTextForm("Celular"),
            _textFormField(numberPhone, "387678953.."),
            _titleTextForm("Cambiar contraseña"),
            _textFormField("","Nueva contraseña"),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                /*
                decoration: const InputDecoration.collapsed(
                  hintText: "Nueva contraseña",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),*/
                decoration: InputDecoration(
                  isCollapsed: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  hintText: "Nueva contraseña",
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  suffixIcon: SizedBox(
                    width: 52,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(Icons.info_outline),
                          Icon(Icons.remove_red_eye_outlined),
                        ]),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration.collapsed(
                  hintText: "Repetir contraseña nueva",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _titleTextForm(String title) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: Colors.grey.shade800,
      ),
    );
  }

  Widget _textFormField(String initialValue, String hintText, {bool? obscureText}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        initialValue: initialValue,
        obscureText: !(obscureText == null),
        decoration: InputDecoration.collapsed(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  _bottom() {
    return [
      const Text(
        "Cambiar contraseña",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      TextFormField(
        keyboardType: TextInputType.number,
        controller: numberPhoneController,
        decoration: const InputDecoration(
            labelText: "Ingrese su numero de celular", icon: Icon(Icons.phone)),
      ),
    ];
  }
  /*
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
  }*/
}

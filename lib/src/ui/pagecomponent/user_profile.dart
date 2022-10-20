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
  final numberPhoneController = TextEditingController();
  final numberPhone = "3877777";
  final currentPassword = "pass";
  TextEditingController nameAndSurnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dniController = TextEditingController();
  final double paddingVertical = 8;
  final double paddingHorizontal = 16;
  final double borderRadiusTextForm = 12;
  final double sizeTextForm = 14;
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
            _top(),
            //_bottom(),
            _titleTextForm("Celular"),
            _textFormField(numberPhone, "387678953.."),
            _titleTextForm("Cambiar contraseña"),
            _customTextFormField("", "Nueva contraseña", TextInputType.text, obscureText: true, iconInfo: true, iconEye: true),
            _customTextFormField("", "Repetir contraseña nueva", TextInputType.text, obscureText: true, iconEye: true),
            _customButton(
                "Guardar", const Color(0xFF0000CC), 36, 16, FontWeight.w500, 1),
          ],
        ),
      ),
    );
  }

  Widget _customButton(
      text, backgroundColor, height, textSize, textWeight, letterSpacing) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: CustomButton(
          text: "Guardar",
          onTap: () {},
          backgroundColor: const Color(0xFF0000CC),
          height: 36,
          textSize: 16,
          textWeight: FontWeight.w500,
          letterSpacing: 1,
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

  IconButton _iconButton(icon, onPressed) {
    return IconButton(
      
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      color: Colors.grey.shade600,
      highlightColor: Colors.transparent,
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }

  Widget _customTextFormField(
      String initialValue, String hintText, keyboardType ,{bool? obscureText, bool? iconInfo, bool? iconEye}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadiusTextForm),
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: paddingVertical,
      ),
      child: Row(children: [
        Expanded(
          child: TextFormField(
            initialValue: initialValue,
            keyboardType: keyboardType,
            obscureText: obscureText != null,
            decoration: InputDecoration.collapsed(
              hintText: hintText,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: sizeTextForm,
              ),
            ),
          ),
        ),
        Visibility(
          visible: iconInfo != null,
          child: _iconButton(
            
            Icons.info_outline,
            () {},
          ),
        ),
        Visibility(
          visible: iconEye != null,
          child: _iconButton(Icons.remove_red_eye_outlined, () {}),)
      ]),
    );
  }

  Widget _tFField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
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
    );
  }

  Widget _textFormField(String initialValue, String hintText,
      {bool? obscureText}) {
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
}
/*
/*
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
                ///
                decoration: const InputDecoration.collapsed(
                  hintText: "Nueva contraseña",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                ///
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
            */
 */
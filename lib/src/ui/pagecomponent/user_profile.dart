import 'package:flutter/material.dart';

//import '../../models/person_model.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final numberPhoneController = TextEditingController();
  final numberPhone = "3877777";
  final currentPassword = "pass";
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

  _top() {
    return [];
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
}

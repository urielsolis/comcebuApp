import 'package:comcebu/preferencias/preferencias_usuario.dart';
import 'package:comcebu/utils/dimensiones.dart';
import 'package:flutter/material.dart';

class FloatingButtonWidget extends StatefulWidget {
  FloatingButtonWidget({Key? key}) : super(key: key);

  @override
  _FloatingButtonWidgetState createState() => _FloatingButtonWidgetState();
}

class _FloatingButtonWidgetState extends State<FloatingButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final _pref = new PreferenciasUsuario();
    return FloatingActionButton(
      clipBehavior: Clip.antiAlias,
      heroTag: 'fabaddim',
      onPressed: () {
        if (_pref.usuario == "") {
          Navigator.pushNamed(context, "/");
        } else {
          Navigator.pushNamed(context, "crearinmueble");
        }
      },
      child: Icon(
        Icons.add,
        size: vw(context) * 0.13,
      ),
      backgroundColor: Color(0xFFE50914),
    );
  }
}

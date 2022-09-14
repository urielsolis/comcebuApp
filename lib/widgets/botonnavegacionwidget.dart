import 'package:comcebu/preferencias/preferencias_usuario.dart';
import 'package:comcebu/utils/dimensiones.dart';
import 'package:flutter/material.dart';

class BotonNavegacion extends StatelessWidget {
  final _pref = new PreferenciasUsuario();
  int historyCount = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: vw(context),
          height: vh(context) * 0.06,
          color: Color(0xFF007632),
        ),
        Positioned(
          top: -(vw(context) * 0.1),
          left: vw(context) * 0.4,
          width: vw(context) * 0.2,
          height: vw(context) * 0.2,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed('scaner');
            },
            clipBehavior: Clip.antiAlias,
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.all(0),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromRGBO(255, 255, 255, 1),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(vw(context) * 0.1),
                ),
              ),
            ),
            child: Container(
              color: Colors.white,
              child: Icon(
                Icons.qr_code_scanner_rounded,
                color: Color(0xFF007632),
                size: vw(context) * 0.1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

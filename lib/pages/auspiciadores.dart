import 'dart:io' show Platform;
import 'package:comcebu/utils/dimensiones.dart';
import 'package:comcebu/widgets/appbar_widget.dart';
import 'package:comcebu/widgets/botonnavegacionwidget.dart';
import 'package:comcebu/widgets/menuwidget.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class auspicia extends StatefulWidget {
  auspicia({Key? key}) : super(key: key);

  @override
  State<auspicia> createState() => _auspiciaState();
}

class _auspiciaState extends State<auspicia> {
  String textCode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: ''),
      body: Stack(
        children: <Widget>[
          Container(
            width: vw(context) * 0.8,
            margin: EdgeInsets.symmetric(horizontal: vw(context) * 0.1),
            child: Image.asset('assets/Auspiciadores.png'),
          ),
          Container(
            width: vw(context) * 0.95,
            margin: EdgeInsets.only(
                left: vw(context) * 0.025,
                right: vw(context) * 0.025,
                top: vh(context) * 0.15),
            child: Image.asset('assets/LOGOS PARA CREDENCIALES-01.jpg'),
          ),
          Container(
            width: vw(context) * 0.95,
            margin: EdgeInsets.only(
                left: vw(context) * 0.025,
                right: vw(context) * 0.025,
                top: vh(context) * 0.25),
            child: Image.asset('assets/logosSinDiamantes.png'),
          ),
        ],
      ),
      drawer: MenuWidget().createState().build(context),
      backgroundColor: Color(0xFF005329),
      bottomNavigationBar: BotonNavegacion().build(context),
      // floatingActionButton: FloatingButtonWidget().createState().build(context),
    );
  }

  @override
  void dispose() {
    // controller?.dispose();
    super.dispose();
  }
}

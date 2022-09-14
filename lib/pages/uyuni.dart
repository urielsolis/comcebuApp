import 'dart:io' show Platform;
import 'package:comcebu/utils/dimensiones.dart';
import 'package:comcebu/widgets/appbar_widget.dart';
import 'package:comcebu/widgets/botonnavegacionwidget.dart';
import 'package:comcebu/widgets/menuwidget.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class uyuni extends StatefulWidget {
  uyuni({Key? key}) : super(key: key);

  @override
  State<uyuni> createState() => _uyuniState();
}

class _uyuniState extends State<uyuni> {
  String textCode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Uyuni'),
      body: Stack(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: vh(context) * 0.1),
              width: vw(context) * 1.5,
              child: Image.asset('assets/Experiencia Uyuni.jpg'),
            ),
          )
        ],
      ),
      drawer: MenuWidget().createState().build(context),
      backgroundColor: Color(0xFFFBF9DE),
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

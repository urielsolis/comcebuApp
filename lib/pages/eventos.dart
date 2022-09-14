import 'dart:io' show Platform;
import 'package:comcebu/utils/dimensiones.dart';
import 'package:comcebu/widgets/appbar_widget.dart';
import 'package:comcebu/widgets/botonnavegacionwidget.dart';
import 'package:comcebu/widgets/menuwidget.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class eventos extends StatefulWidget {
  eventos({Key? key}) : super(key: key);

  @override
  State<eventos> createState() => _eventosState();
}

class _eventosState extends State<eventos> {
  String textCode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Lista de Eventos'),
      body: Stack(
        children: <Widget>[],
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

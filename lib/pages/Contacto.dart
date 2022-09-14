import 'dart:io' show Platform;
import 'package:comcebu/utils/dimensiones.dart';
import 'package:comcebu/widgets/appbar_widget.dart';
import 'package:comcebu/widgets/botonnavegacionwidget.dart';
import 'package:comcebu/widgets/menuwidget.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class contacto extends StatefulWidget {
  contacto({Key? key}) : super(key: key);

  @override
  State<contacto> createState() => _contactoState();
}

class _contactoState extends State<contacto> {
  String textCode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Contactanos'),
      body: Stack(
        children: <Widget>[
          Container(
            clipBehavior: Clip.antiAlias,
            height: vh(context) * 0.3,
            width: vh(context) * 1,
            decoration: new BoxDecoration(
              color: Color(0xFFFBF9DE),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(200),
                bottomRight: Radius.circular(200),
              ),
            ),
            child: Image.asset(
              'assets/Montaje Razas.png',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.only(top: vh(context) * 0.4),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: vw(context) * 0.1),
                  dense: true,
                  leading: Icon(
                    Icons.whatsapp,
                    color: Color(0xFFFBF9DE),
                  ),
                  title: Text(
                    '+591 77647616',
                    style: TextStyle(
                      color: Color(0xFFFBF9DE),
                      fontSize: vw(context) * 0.045,
                    ),
                  ),
                  onTap: () => null,
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: vw(context) * 0.1),
                  dense: true,
                  leading: Icon(
                    Icons.facebook,
                    color: Color(0xFFFBF9DE),
                  ),
                  title: Text(
                    'https://www.facebook.com/Comcebu',
                    style: TextStyle(
                      color: Color(0xFFFBF9DE),
                      fontSize: vw(context) * 0.045,
                    ),
                  ),
                  onTap: () => null,
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: vw(context) * 0.1),
                  dense: true,
                  leading: Icon(
                    Icons.photo_camera,
                    color: Color(0xFFFBF9DE),
                  ),
                  title: Text(
                    'https://www.instagram.com/comcebu/',
                    style: TextStyle(
                      color: Color(0xFFFBF9DE),
                      fontSize: vw(context) * 0.045,
                    ),
                  ),
                  onTap: () => null,
                ),
              ],
            ),
          )
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

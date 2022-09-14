import 'dart:io' show Platform;
import 'package:comcebu/utils/dimensiones.dart';
import 'package:comcebu/widgets/appbar_widget.dart';
import 'package:comcebu/widgets/botonnavegacionwidget.dart';
import 'package:comcebu/widgets/menuwidget.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';

class ubicaciones extends StatefulWidget {
  ubicaciones({Key? key}) : super(key: key);

  @override
  State<ubicaciones> createState() => _ubicacionesState();
}

class _ubicacionesState extends State<ubicaciones> {
  String textCode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Ubicaciones'),
      body: Stack(
        children: <Widget>[
          Container(
            width: vw(context) * 0.77,
            height: vh(context) * 0.06,
            margin: EdgeInsets.only(
                left: vw(context) * 0.1, top: vh(context) * 0.1),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF007632),
                onSurface: Color(0xFF007632),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      vh(context) * 0.018,
                    ),
                    side: BorderSide(color: Colors.white, width: 1)),
              ),
              onPressed: () {
                MapsLauncher.launchCoordinates(
                    -17.7854869, -63.2121302, 'FexpoCruz');
              },
              child: Text(
                "Fexpocruz",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: (vw(context) * 0.05),
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(
            width: vw(context) * 0.77,
            height: vh(context) * 0.06,
            margin: EdgeInsets.only(
                left: vw(context) * 0.1, top: vh(context) * 0.17),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF007632),
                onSurface: Color(0xFF007632),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      vh(context) * 0.018,
                    ),
                    side: BorderSide(color: Colors.white, width: 1)),
              ),
              onPressed: () {
                MapsLauncher.launchCoordinates(
                    -17.7611752, -63.2042579, 'Hotel Marriott');
              },
              child: Text(
                "Hotel Marriott",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: (vw(context) * 0.05),
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(
            width: vw(context) * 0.77,
            height: vh(context) * 0.06,
            margin: EdgeInsets.only(
                left: vw(context) * 0.1, top: vh(context) * 0.24),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF007632),
                onSurface: Color(0xFF007632),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      vh(context) * 0.018,
                    ),
                    side: BorderSide(color: Colors.white, width: 1)),
              ),
              onPressed: () {
                MapsLauncher.launchCoordinates(
                    -17.7458853, -63.199441, 'Hotel Swissôtel');
              },
              child: Text(
                "Hotel Swissôtel",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: (vw(context) * 0.05),
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(
            width: vw(context) * 0.77,
            height: vh(context) * 0.06,
            margin: EdgeInsets.only(
                left: vw(context) * 0.1, top: vh(context) * 0.31),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF007632),
                onSurface: Color(0xFF007632),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      vh(context) * 0.018,
                    ),
                    side: BorderSide(color: Colors.white, width: 1)),
              ),
              onPressed: () {
                MapsLauncher.launchCoordinates(
                    -17.7854993, -63.2155243, 'Hotel Novotel');
              },
              child: Text(
                "Hotel Novotel",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: (vw(context) * 0.05),
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
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

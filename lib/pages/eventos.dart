import 'dart:convert';
import 'dart:io' show Platform;
import 'package:comcebu/preferencias/preferencias_usuario.dart';
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
  String dropdownValue = "0";
  List<dynamic> actividades = [];
  List<dynamic> actividadesMostradas = [];
  final _pref = new PreferenciasUsuario();

  @override
  void initState() {
    if (_pref.usuario != "") {
      Map<String, dynamic> user = json.decode(_pref.usuario);
      if (user != null) {
        actividades = user['Actividades'];
      }
      actividadesMostradas = actividades
          .where((element) =>
              int.parse(element['Dia']) == (int.parse(dropdownValue) + 1))
          .toList();
    }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Lista de Eventos'),
      body: Stack(
        children: <Widget>[
          Container(
            width: vw(context) * 0.8,
            margin: EdgeInsets.symmetric(horizontal: vw(context) * 0.1),
            child: Image.asset('assets/Eventos Del Día.png'),
          ),
          Container(
            margin: EdgeInsets.only(
                top: vh(context) * 0.12, left: vw(context) * 0.22),
            padding: EdgeInsets.symmetric(horizontal: vw(context) * 0.1),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1.0,
                    style: BorderStyle.solid,
                    color: Color(0xFFD1CD9E)),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
            child: DropdownButton(
              value: dropdownValue,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Color(0xFFD1CD9E),
              ),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Color(0xFFD1CD9E)),
              dropdownColor: Color(0xFF007632),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              underline: Container(
                height: 0,
              ),
              onChanged: (String? newValue) {
                dropdownValue = newValue!;
                setState(() {});
                actividadesMostradas = actividades
                    .where((element) =>
                        int.parse(element['Dia']) ==
                        (int.parse(dropdownValue) + 1))
                    .toList();
                setState(() {});
              },
              items: [
                {"texto": 'Dia 1/ Jue, 15', "valor": "0"},
                {"texto": 'Dia 2/ Vie, 15', "valor": "1"},
                {"texto": 'Dia 3/ Sab, 15', "valor": "2"},
                {"texto": 'Dia 4/ Dom, 15', "valor": "3"},
                {"texto": 'Dia 5/ Lun, 15', "valor": "4"}
              ].map<DropdownMenuItem<String>>((Map<String, dynamic> value) {
                return DropdownMenuItem<String>(
                  value: value["valor"],
                  child: Text(value["texto"]),
                );
              }).toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: vh(context) * 0.22),
            child: Column(children: _mosAct()),
          )
        ],
      ),
      drawer: MenuWidget().createState().build(context),
      backgroundColor: Color(0xFF005329),
      bottomNavigationBar: BotonNavegacion().build(context),
      // floatingActionButton: FloatingButtonWidget().createState().build(context),
    );
  }

  List<Widget> _mosAct() {
    List<Widget> res = [];
    actividadesMostradas.forEach((element) {
      res.add(ListTile(
        contentPadding:
            EdgeInsets.symmetric(vertical: 0, horizontal: vw(context) * 0.1),
        dense: true,
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Color(0xFFFBF9DE),
        ),
        title: Text(
          element['Actividad'],
          style: TextStyle(
            color: Color(0xFFFBF9DE),
            fontSize: vw(context) * 0.04,
          ),
        ),
        subtitle: Text(
          (element['feInicio'] != null ? element['feInicio'] : '') +
              '-' +
              (element['feFin'] != null ? element['feFin'] : ''),
          style: TextStyle(
            color: Color(0xFFFBF9DE),
            fontSize: vw(context) * 0.03,
          ),
        ),
        onTap: () => null,
      ));
    });
    return res;
  }

  @override
  void dispose() {
    // controller?.dispose();
    super.dispose();
  }
}

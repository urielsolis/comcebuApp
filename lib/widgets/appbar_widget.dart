import 'package:comcebu/preferencias/preferencias_usuario.dart';
import 'package:comcebu/utils/dimensiones.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final dynamic title;

  AppBarWidget({@required this.title});
  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(55);
  AppBar build(BuildContext context) {
    final _pref = new PreferenciasUsuario();
    return AppBar(
      elevation: 1,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Color(0xFF007632),
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Color(0xFFFFFFFF),
          size: vw(context) * 0.09,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    );
  }
}

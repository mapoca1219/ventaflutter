import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  final Function onVerTodosProductos;
  final Function onVerUnProducto;
  final Function onSalir;

  MenuDrawer({
    required this.onVerTodosProductos,
    required this.onVerUnProducto,
    required this.onSalir,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menú',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Ver Todos los Productos'),
            onTap: onVerTodosProductos as void Function()?,
          ),
          ListTile(
            title: const Text('Ver Un Producto'),
            onTap: onVerUnProducto as void Function()?,
          ),
          ListTile(
            title: const Text('Salir'),
            onTap: onSalir as void Function()?,
          ),
        ],
      ),
    );
  }
}

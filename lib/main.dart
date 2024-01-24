// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text('Hello World!'),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:venta_flutter/widget/MenuDrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Menu Lateral',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Principal'),
      ),
      drawer: MenuDrawer(
        onVerTodosProductos: () {
          // Navegar a la página de ver todos los productos
          // Puedes implementar la navegación según tus necesidades
          print('Ver Todos los Productos');
        },
        onVerUnProducto: () {
          // Navegar a la página de ver un producto
          print('Ver Un Producto');
        },
        onSalir: () {
          // Cerrar la aplicación
          print('Salir');
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: Text('Contenido de la Página Principal'),
      ),
    );
  }
}

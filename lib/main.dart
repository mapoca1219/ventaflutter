import 'package:venta_flutter/src/data/service/product_service.dart';
import 'package:venta_flutter/src/likeButt.dart';
import 'package:venta_flutter/src/router/routerr.dart';
import 'package:venta_flutter/src/view/screen/dash_board_screen.dart';
import 'package:venta_flutter/src/view/screen/login_screen.dart';
import 'package:venta_flutter/src/viewmodel/address_viewmodel.dart';
import 'package:venta_flutter/src/viewmodel/auth_viemodel.dart';
import 'package:venta_flutter/src/viewmodel/bottom_navigate_provider.dart';
import 'package:venta_flutter/src/viewmodel/cart_viewmodel.dart';
import 'package:venta_flutter/src/viewmodel/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> BottomNavigationProvider()),
        ChangeNotifierProvider(create: (_)=> CartViewModel()),
        ChangeNotifierProvider(create: (_)=> AddressViewModel()),
        // ChangeNotifierProvider(create: (_)=> ProductViewModel()..getListProduct()),
        ChangeNotifierProvider(create: (_)=>AuthViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: Routerr.onGenerateRouter,
        home: DashBoardScreen(),
      ),
    );
  }
}

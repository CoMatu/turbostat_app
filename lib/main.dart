import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';
import 'package:turbostat_app/core/auth/auth_provider.dart';
import 'package:turbostat_app/core/auth/base_auth.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/pages/add_part_page.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/pages/load_data_page.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/pages/logo_screen.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/pages/pages.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/pages/select_data_source_page.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/pages/start_page.dart';
import 'package:turbostat_app/generated/i18n.dart';
//import '../lib copy/features/turbostat_tdd/presentation/providers/providers.dart';
import '../injection_container.dart' as di;
import 'features/turbostat_tdd/presentation/providers/current_car.dart';
import 'features/turbostat_tdd/presentation/providers/current_entry.dart';
import 'features/turbostat_tdd/presentation/providers/current_maintenance.dart';
import 'features/turbostat_tdd/presentation/providers/entries.dart';
import 'features/turbostat_tdd/presentation/providers/maintenancies.dart';
import 'features/turbostat_tdd/presentation/providers/page_counter.dart';
import 'features/turbostat_tdd/presentation/providers/parts.dart';
import 'features/turbostat_tdd/presentation/providers/parts_cart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //без него ловит ошибку main
  await Firebase.initializeApp();
  await di.init();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageCounter()),
        ChangeNotifierProvider(create: (context) => CurrentCar()),
        ChangeNotifierProvider(create: (context) => Maintenances()),
        ChangeNotifierProvider(create: (context) => CurrentMaintenance()),
        ChangeNotifierProvider(create: (context) => Entries()),
        ChangeNotifierProvider(create: (context) => CurrentEntry()),
        ChangeNotifierProvider(create: (context) => Parts()),
        ChangeNotifierProvider(create: (context) => PartsCart()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: BaseAuthImpl(),
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.yellow,
            pageTransitionsTheme: PageTransitionsTheme(builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            })),
        home: LogoScreen(),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'turbostat',
        routes: {
          'logo_screen': (context) => LogoScreen(),
          'start_page': (context) => StartPage(),
          'load_data_page': (context) => LoadDataPage(),
          'select_page': (context) => SelectDataSourcePage(),
          'add_car': (context) => AddCarPage(),
          'edit_car': (context) => EditCarPage(),
          'add_maintenance': (context) => AddMaintenancePage(),
          'maintenancies_page': (context) => MaintenancesPage(),
          'edit_maintenance': (context) => EditMaintenancePage(),
          'add_entry': (context) => AddEntryPage(),
          'edit_entry': (context) => EditEntryPage(),
          'add_part': (context) => AddPartPage(),
          'parts_page': (context) => PartsPage(),
          'maintenance_details': (context) => MaintenanceDetailsPage(),
        },
      ),
    );
  }
}

//TODO на дашбод рекламу но начало показа только через 10 запусков чтобы не оттолкнуть

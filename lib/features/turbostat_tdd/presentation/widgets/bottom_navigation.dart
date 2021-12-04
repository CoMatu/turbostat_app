import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_app/generated/i18n.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    selectedIndex = Provider.of<PageCounter>(context, listen: false).pageIndex;
    super.didChangeDependencies();
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      Provider.of<PageCounter>(context, listen: false).updateIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PageCounter>(builder: (context, page, child) {
      return BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: AppLocalizations.of(context)!.history,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: AppLocalizations.of(context)!.stats,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: AppLocalizations.of(context)!.cars,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: AppLocalizations.of(context)!.settings,
          ),
        ],
        currentIndex: page.pageIndex,
        selectedItemColor: Colors.black,
        onTap: onItemTapped,
      );
    });
  }
}

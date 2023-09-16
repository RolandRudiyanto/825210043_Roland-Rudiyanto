import 'package:flutter/material.dart';
import 'package:stopwatch/about.dart';
import 'package:stopwatch/stopwatch.dart';
import 'package:stopwatch/time.dart';

class Menu extends StatefulWidget {

  final String name;
  final String email;

  const Menu({Key? key, required this.name, required this.email}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedItem=0;
  static List<Widget> _page=<Widget>[
    Time(),
    StopWatch(),
    About()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Center(
        child: _page.elementAt(_selectedItem),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              label: "Timer"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.watch_later_outlined),
              label: "Stopwatch"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp),
              label: "About"
          ),
        ],
        currentIndex: _selectedItem,
        onTap: (setValue){
          setState(() {
            _selectedItem=setValue;
          });
        },
      ),
    );
  }
}

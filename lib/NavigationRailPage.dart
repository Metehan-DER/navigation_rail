import 'package:flutter/material.dart';

class NavigationRailWidget extends StatefulWidget {
  const NavigationRailWidget({super.key});

  @override
  State<NavigationRailWidget> createState() => _NavigationRailWidgetState();
}

class _NavigationRailWidgetState extends State<NavigationRailWidget> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // ekran ölçüsü aldık
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("Yan Sekme Örneği"),
        centerTitle: true,
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            backgroundColor: Colors.pinkAccent,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('FAVORİLER'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person_outline_rounded),
                selectedIcon: Icon(Icons.person),
                label: Text('HESAP'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.shopping_cart_outlined),
                selectedIcon: Icon(Icons.shopping_cart),
                label: Text('SEPET'),
              ),
            ],
            selectedIconTheme: IconThemeData(color: Colors.pinkAccent),
            unselectedIconTheme: IconThemeData(color: Colors.black),
            selectedLabelTextStyle: TextStyle(color: Colors.white),
          ),
          const VerticalDivider( // dikey çizgi
            thickness: 1,
            width: 2,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_selectedIndex == 0) ...[
                  Container(         // isteğimiz sayfayı veya widgetı çağırabiliriz
                    height: size.height * 0.8,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.blue
                      ),
                      child: Center(child: Text('Page Number: $_selectedIndex'))),
                ] else if (_selectedIndex == 1) ...[
                  Container(
                      height: size.height * 0.8,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.red
                      ),
                      child: Center(child: Text('Page Number: $_selectedIndex'))),
                ] else ...[
                  Container(
                      height: size.height * 0.8,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.grey
                      ),
                      child: Center(child: Text('Page Number: $_selectedIndex'))),
                ],
              ],
            ),
          )
        ],
      ),
    );
  }
}

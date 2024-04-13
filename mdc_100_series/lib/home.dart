import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/product.dart';
import 'model/products_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<bool> _selectedView = <bool>[false, true];
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        // TODO: Adjust card heights (103)
        child: Column(
          // TODO: Center items on the card (103)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  // TODO: Align labels to the bottom and center (103)
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // TODO: Change innermost Column (103)
                  children: <Widget>[
                    Row(
                      children: List.generate(
                        product.stars,
                        (index) => Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 10.0,
                        ),
                      ),
                    ),
                    Text(
                      product.name,
                      style: theme.textTheme.titleLarge,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.blue,
                          size: 20.0,
                        ),
                        Text(
                          product.address,
                          style: theme.textTheme.titleSmall,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    bool vertical = false;
    return Scaffold(
      appBar: AppBar(
        // IconButton(
        //   icon: const Icon(
        //     Icons.menu,
        //     semanticLabel: 'menu',
        //   ),
        //   onPressed: () {},
        // ),
        title: const Text('Main'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.language,
              semanticLabel: 'language',
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ToggleButtons(
                  direction: vertical ? Axis.vertical : Axis.horizontal,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < _selectedView.length; i++) {
                        _selectedView[i] = i == index;
                      }
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Colors.blue[700],
                  selectedColor: Colors.white,
                  fillColor: Colors.blue[200],
                  color: Colors.blue[400],
                  isSelected: _selectedView,
                  children: icons,
                ),
              ),
              // ),
            ],
          ),
          Expanded(
            child: OrientationBuilder(
              builder: (context, orientation) {
                return GridView.count(
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                  padding: const EdgeInsets.all(16.0),
                  childAspectRatio: 8.0 / 9.0,
                  children: _buildGridCards(context),
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Pages'),
            ),
            //home
            ListTile(
              leading: IconButton(
                icon: const Icon(
                  Icons.home,
                  semanticLabel: 'home',
                ),
                onPressed: () {},
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            //Search
            ListTile(
              leading: IconButton(
                icon: const Icon(
                  Icons.search,
                  semanticLabel: 'Search',
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/search');
                },
              ),
              title: const Text('Search'),
              onTap: () {
                Navigator.pushNamed(context, '/search');
              },
            ),
            //Favorite Hotel
            ListTile(
              leading: IconButton(
                icon: const Icon(
                  Icons.location_city,
                  semanticLabel: 'Favorite Hotel',
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/favorite');
                },
              ),
              title: const Text('Favorite Hotel'),
              onTap: () {
                Navigator.pushNamed(context, '/favorite');
              },
            ),
            //My Page
            ListTile(
              leading: IconButton(
                icon: const Icon(
                  Icons.person,
                  semanticLabel: 'My Page',
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/mypage');
                },
              ),
              title: const Text('My Page'),
              onTap: () {
                Navigator.pushNamed(context, '/mypage');
              },
            ),
            //Log out
            ListTile(
              leading: IconButton(
                icon: const Icon(
                  Icons.logout,
                  semanticLabel: 'log out',
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
              title: const Text('Log Out'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

const List<Widget> icons = <Widget>[
  Icon(Icons.list),
  Icon(Icons.grid_on),
];

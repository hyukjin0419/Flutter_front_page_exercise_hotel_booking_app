import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/product.dart';
import 'model/products_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

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
                    // TODO: Handle overflowing labels (103)
                    Text(
                      product.name,
                      style: theme.textTheme.titleLarge,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      formatter.format(product.price),
                      style: theme.textTheme.titleSmall,
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
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),
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

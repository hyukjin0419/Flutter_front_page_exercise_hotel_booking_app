import 'package:flutter/material.dart';
import 'model/product.dart';
import 'model/products_repository.dart';
import 'detail.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<bool> _selectedView = <bool>[false, true];

  //grid view card
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: 'product_${product.id}',
              child: AspectRatio(
                aspectRatio: 18 / 11,
                child: Image.asset(
                  product.assetName,
                  package: product.assetPackage,
                  fit: BoxFit.fitWidth,
                ),
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
                      style: theme.textTheme.titleMedium,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 10.0),
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
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(product: product),
                    ),
                  );
                },
                child: Text(
                  'More',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  //list view card
  List<Card> _buildListCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          leading: Hero(
            tag: 'product_${product.id}',
            child: AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          title: Row(
            children: List.generate(
              product.stars,
              (index) => Icon(
                Icons.star,
                color: Colors.yellow,
                size: 10.0,
              ),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                product.name,
                style: theme.textTheme.subtitle1,
                maxLines: 1,
              ),
              const SizedBox(height: 10.0),
              Text(
                product.address,
                style: theme.textTheme.subtitle2,
              )
            ],
          ),
          trailing: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(product: product),
                ),
              );
            },
            child: const Text(
              'More',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  final Uri _url = Uri.parse("https://www.handong.edu/");

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    bool vertical = false;
    return Scaffold(
      appBar: AppBar(
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
            onPressed: _launchUrl,
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
                padding: const EdgeInsets.all(10.0),
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
                return _selectedView[1]
                    ? GridView.count(
                        crossAxisCount:
                            orientation == Orientation.portrait ? 2 : 3,
                        padding: const EdgeInsets.all(16.0),
                        childAspectRatio: 8.0 / 9.0,
                        children: _buildGridCards(context),
                      )
                    : ListView(
                        padding: const EdgeInsets.all(16.0),
                        children: _buildListCards(context),
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

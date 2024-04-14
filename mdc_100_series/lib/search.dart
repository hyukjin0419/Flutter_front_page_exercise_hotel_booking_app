import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Item> list = [
    Item(header: "Filter", body: "select filters"),
    Item(header: "Date", body: "select date"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search Page'),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: _buildPanel(),
          ),
        ));
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          list[index].isExpanded = isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                list[0].header,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          },
          body: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Text("여기다가 checkbox 넣을 꺼엠"),
          ),
          isExpanded: list[0].isExpanded,
        ),
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                list[1].header,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          },
          body: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Text("여기다가 달력 넣을 꺼엠"),
          ),
          isExpanded: list[1].isExpanded,
        ),
      ],
    );
  }
}

class Item {
  Item({
    required this.header,
    this.body,
    this.subtitle,
    this.isExpanded = false,
  });
  String header;
  String? body;
  String? subtitle;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      header: 'Panel $index',
      body: 'This is item number $index',
    );
  });
}

List<Item> list = [
  Item(
    header: "Filter",
    subtitle: "select filters",
  ),
  Item(header: "Date", subtitle: "select date"),
];

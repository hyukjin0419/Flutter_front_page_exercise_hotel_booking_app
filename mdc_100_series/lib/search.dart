import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  bool noKidsZone = false;
  bool petFreindly = false;
  bool freeBreakfast = false;

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: _buildPanel(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text("Search"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
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
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.blue,
                      value: noKidsZone,
                      onChanged: (bool? value) {
                        setState(() {
                          noKidsZone = value!;
                        });
                      },
                    ),
                    const Text('No Kids Zone'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.blue,
                      value: petFreindly,
                      onChanged: (bool? value) {
                        setState(() {
                          petFreindly = value!;
                        });
                      },
                    ),
                    const Text('Pet-Friendly'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.blue,
                      value: freeBreakfast,
                      onChanged: (bool? value) {
                        setState(() {
                          freeBreakfast = value!;
                        });
                      },
                    ),
                    const Text('Free breakfast'),
                  ],
                ),
              ],
            ),
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
            child: Column(
              children: [
                OutlinedButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  child: const Text("select date"),
                ),
                Text(
                  "Selected Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}", // 선택한 날짜를 'yyyy-MM-dd' 형식의 문자열로 변환하여 출력
                ),
              ],
            ),
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

List<Item> list = [
  Item(
    header: "Filter",
    subtitle: "select filters",
  ),
  Item(header: "Date", subtitle: "select date"),
];

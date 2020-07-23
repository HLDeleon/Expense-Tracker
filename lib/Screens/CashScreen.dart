import 'package:expense_tracker/Models/Category.dart';
import 'package:expense_tracker/Models/Choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grouped_list/grouped_list.dart';

class CashScreen extends StatefulWidget {
  @override
  _CashScreenState createState() => _CashScreenState();
}

class _CashScreenState extends State<CashScreen> {
  String _dropdownSelection;

  @override
  void initState() {
    super.initState();
    _dropdownSelection = dropdownchoices.first;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(30)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Latest Transactions",
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                _dropDownButton()
              ],
            ),
          ),
          _groupListView(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "View All Transaction",
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dropDownButton() {
    return DropdownButton(
        value: _dropdownSelection,
        underline: SizedBox(),
        items: dropdownchoices.map((val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val),
          );
        }).toList(),
        onChanged: (val) {
          setState(() {
            _dropdownSelection = val;
          });
        });
  }

  Widget _groupListView() {
    return Flexible(
      child: GroupedListView<dynamic, String>(
        order: GroupedListOrder.DESC,
        groupBy: (element) => element["date"],
        elements: _elements,
        useStickyGroupSeparators: true,
        groupSeparatorBuilder: (String value) => Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            value,
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        itemBuilder: (context, dynamic element) {
          return _slidableListItem(element);
        },
      ),
    );
  }

  Widget _slidableListItem(dynamic element) {
    return Slidable(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CategoryIcon(
                    color: Colors.amber,
                    catNumber: element['category'],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        element['title'],
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        element['description'],
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              Center(
                child: Text(
                  element['amount'],
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      closeOnScroll: true,
      secondaryActions: [
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            setState(() {
              _elements.remove(element);
            });
          },
        ),
        IconSlideAction(
          caption: 'Update',
          color: Colors.green,
          icon: Icons.update,
          onTap: () {},
        ),
      ],
    );
  }
}

List _elements = [
  {
    'title': 'Shopee Order',
    'description': 'Clothing Items',
    'amount': '549.80',
    'category': 1,
    'date': '7-7-2020'
  },
  {
    'title': 'Shopee Order',
    'description': 'Make up',
    'amount': '299.75',
    'category': 1,
    'date': '7-7-2020'
  },
  {
    'title': 'Food Panda',
    'description': 'Jobee',
    'amount': '735.50',
    'category': 4,
    'date': '7-7-2020'
  },
  {
    'title': 'Shopee Order',
    'description': 'Clothing Items',
    'amount': '549.80',
    'category': 0,
    'date': '7-7-2020'
  },
  {
    'title': 'Shopee Order',
    'description': 'Clothing Items',
    'amount': '549.80',
    'category': 0,
    'date': '7-6-2020'
  },
  {
    'title': 'Shopee Order',
    'description': 'Clothing Items',
    'amount': '549.80',
    'category': 0,
    'date': '7-6-2020'
  },
  {
    'title': 'Shopee Order',
    'description': 'Clothing Items',
    'amount': '549.80',
    'category': 0,
    'date': '7-5-2020'
  },
  {
    'title': 'Shopee Order',
    'description': 'Clothing Items',
    'amount': '549.80',
    'category': 0,
    'date': '7-5-2020'
  },
];

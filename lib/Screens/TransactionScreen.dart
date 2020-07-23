import 'package:direct_select/direct_select.dart';
import 'package:expense_tracker/Classes/TextFormBorder.dart';
import 'package:expense_tracker/Models/Category.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  var _dropdownSelection = expenseCategories.first;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _appbar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _textForms(),
              SizedBox(
                height: 50,
              ),
              _categoryDropDown(),
              Text(_dropdownSelection.isExpense ? "Expense" : "Income"),
              DirectSelect(
                  itemExtent: 50.0,
                  selectedIndex: selectedIndex1,
                  backgroundColor: Colors.white,
                  child: MySelectionItem(
                    isForList: false,
                    title: expenseCategories[selectedIndex1].title,
                  ),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedIndex1 = index;
                      print(expenseCategories[index].title);
                    });
                  },
                  items: _buildItems1()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appbar() {
    return AppBar(
      leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () {
            Navigator.of(context).pop();
          }),
      title: const Text(
        'Add Transaction',
      ),
      iconTheme: new IconThemeData(color: Colors.white),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  Widget _textForms() {
    return Column(
      children: [
        TextFormField(
          textInputAction: TextInputAction.next,
          decoration: TextFormBorder(label: "Title"),
          validator: (val) {
            if (val.length == 0) {
              return "Title cannot be empty";
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.text,
          style: TextStyle(
            fontFamily: "Poppins",
          ),
          onFieldSubmitted: (val) {
            print(val);
            FocusScope.of(context).nextFocus();
          },
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          textInputAction: TextInputAction.next,
          decoration: TextFormBorder(label: "Description"),
          validator: (val) {
            if (val.length == 0) {
              return "Details cannot be empty";
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.text,
          style: TextStyle(
            fontFamily: "Poppins",
          ),
          onFieldSubmitted: (val) {
            print(val);
            FocusScope.of(context).nextFocus();
          },
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          textInputAction: TextInputAction.done,
          decoration: TextFormBorder(label: "Amount"),
          validator: (val) {
            if (isNumeric(val)) {}
            if (val.length == 0) {
              return "Amount cannot be empty";
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.number,
          style: TextStyle(
            fontFamily: "Poppins",
          ),
          onFieldSubmitted: (val) {
            print(val);
            FocusScope.of(context).unfocus();
          },
        )
      ],
    );
  }

  Widget _categoryDropDown() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(16.0),
      child: DropdownButton(
          isExpanded: true,
          value: _dropdownSelection,
          underline: SizedBox(),
          items: expenseCategories
              .asMap()
              .map((i, cat) => MapEntry(
                  i,
                  DropdownMenuItem<CategoryItem>(
                    value: cat,
                    child: Row(
                      children: [
                        CategoryIcon(
                          catNumber: i,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          cat.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: cat.isExpense ? Colors.red : Colors.green),
                        ),
                      ],
                    ),
                  )))
              .values
              .toList(),
          onChanged: (category) {
            setState(() {
              _dropdownSelection = category;
            });
          }),
    );
  }

  int selectedIndex1 = 0;

  List<Widget> _buildItems1() {
    return expenseCategories
        .map((val) => MySelectionItem(
              title: val.title,
            ))
        .toList();
  }
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

//You can use any Widget
class MySelectionItem extends StatelessWidget {
  final String title;
  final bool isForList;

  const MySelectionItem({Key key, this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: isForList
          ? Padding(
              child: _buildItem(context),
              padding: EdgeInsets.all(10.0),
            )
          : Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: <Widget>[
                  _buildItem(context),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down),
                  )
                ],
              ),
            ),
    );
  }

  _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(title),
    );
  }
}

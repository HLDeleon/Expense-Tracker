import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryItem {
  const CategoryItem(this.title, this.icon, this.isExpense);

  final String title;
  final Icon icon;
  final bool isExpense;
}

class CategoryIcon extends StatelessWidget {
  final int catNumber;
  final Color color;

  CategoryIcon({this.catNumber, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      child: Material(
          color: color,
          shape: CircleBorder(),
          child: expenseCategories[catNumber].icon),
    );
  }
}

const double iconsize = 20.0;
const List<CategoryItem> expenseCategories = [
  /// 0 - Transport
  const CategoryItem(
      'Transport',
      Icon(
        Icons.directions_car,
        color: Colors.white,
        size: iconsize,
      ),
      true),

  /// 1 - shopping
  const CategoryItem(
      'Shopping',
      Icon(
        Icons.shopping_basket,
        color: Colors.white,
        size: iconsize,
      ),
      true),

  /// 2 - Online Shopping
  const CategoryItem(
      'Online Shopping',
      Icon(
        Icons.add,
        color: Colors.white,
        size: iconsize,
      ),
      true),

  /// 3 - Travel
  const CategoryItem(
      'Travel',
      Icon(
        FontAwesomeIcons.plane,
        color: Colors.white,
        size: iconsize,
      ),
      true),

  /// 4 - Dine-out
  const CategoryItem(
      'Dine-out',
      Icon(
        Icons.fastfood,
        color: Colors.white,
        size: iconsize,
      ),
      true),

  /// 5 - Self-care
  const CategoryItem(
      'Self-care',
      Icon(
        Icons.add,
        color: Colors.white,
        size: iconsize,
      ),
      true),

  /// 6 -  Bills
  const CategoryItem(
      'Bills',
      Icon(
        FontAwesomeIcons.receipt,
        color: Colors.white,
        size: iconsize,
      ),
      true),

  /// 7 - To Lend
  const CategoryItem(
      'To lend',
      Icon(
        Icons.add,
        color: Colors.white,
        size: iconsize,
      ),
      true),

  /// 8 - Grocery
  const CategoryItem(
      'Grocery',
      Icon(
        Icons.local_grocery_store,
        color: Colors.white,
        size: iconsize,
      ),
      true),

  /// 9 - Savings
  const CategoryItem(
      'Savings',
      Icon(
        FontAwesomeIcons.piggyBank,
        color: Colors.white,
        size: iconsize,
      ),
      true),

  /// 10 - Emergency
  const CategoryItem(
      'Emergency Fund',
      Icon(
        Icons.add,
        color: Colors.white,
        size: iconsize,
      ),
      true),

  /// 11 - Gifts
  const CategoryItem(
      'Gifts',
      Icon(
        FontAwesomeIcons.gift,
        color: Colors.white,
        size: iconsize,
      ),
      true),

  /// 12 - Salary
  const CategoryItem(
      'Salary',
      Icon(
        Icons.attach_money,
        color: Colors.white,
        size: iconsize,
      ),
      false),

  /// 13 - Business
  const CategoryItem(
      'Business',
      Icon(
        FontAwesomeIcons.briefcase,
        color: Colors.white,
        size: iconsize,
      ),
      false),
];

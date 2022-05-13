import 'package:flutter/material.dart';
import 'package:moneymanager/Screens/Transactions/Methods/categorylistclass.dart';

final expCategoryList = [
  CategoryList(
      category: "Bills & Utilities",
      icons: const Icon(
        Icons.receipt_long,
      )),
  CategoryList(category: "Food & Drink", icons: const Icon(Icons.fastfood)),
  CategoryList(category: "Education", icons: const Icon(Icons.school)),
  CategoryList(category: "Entertainment", icons: const Icon(Icons.attractions)),
  CategoryList(category: "Events", icons: const Icon(Icons.festival)),
  CategoryList(
      category: "Family Care", icons: const Icon(Icons.family_restroom)),
  CategoryList(
      category: "Fees & Charges", icons: const Icon(Icons.point_of_sale)),
  CategoryList(category: "Grocery", icons: const Icon(Icons.shopping_bag)),
  CategoryList(category: "Gifts & Donations", icons: const Icon(Icons.redeem)),
  CategoryList(
      category: "Health & Fitness", icons: const Icon(Icons.fitness_center)),
  CategoryList(category: "House", icons: const Icon(Icons.night_shelter)),
  CategoryList(category: "Insurance", icons: const Icon(Icons.price_change)),
  CategoryList(
      category: "Investments", icons: const Icon(Icons.currency_bitcoin)),
  CategoryList(
      category: "Loan & Debts", icons: const Icon(Icons.real_estate_agent)),
  CategoryList(
      category: "Office Expenses", icons: const Icon(Icons.meeting_room)),
  CategoryList(category: "Personal Care", icons: const Icon(Icons.mood)),
  CategoryList(category: "Pet Care", icons: const Icon(Icons.pets)),
  CategoryList(category: "Shopping", icons: const Icon(Icons.shopping_cart)),
  CategoryList(category: "Taxes", icons: const Icon(Icons.currency_exchange)),
  CategoryList(category: "Transfer", icons: const Icon(Icons.toll)),
  CategoryList(category: "Transport", icons: const Icon(Icons.directions_bus)),
  CategoryList(category: "Travel & Vacation", icons: const Icon(Icons.flight)),
  CategoryList(category: "Other", icons: const Icon(Icons.currency_exchange))
];

import 'package:flutter/material.dart';
import 'package:moneymanager/Screens/Transactions/Methods/categorylistclass.dart';

final List<CategoryList> incCategoryList = [
  CategoryList(category: "Coupons", icons: const Icon(Icons.redeem)),
  CategoryList(category: "Interest", icons: const Icon(Icons.credit_score)),
  CategoryList(category: "Salary & Paycheck", icons: const Icon(Icons.payment)),
  CategoryList(category: "Lottery/Gambling", icons: const Icon(Icons.casino)),
  CategoryList(category: "Refund", icons: const Icon(Icons.money_off)),
  CategoryList(
      category: "ReImbursement", icons: const Icon(Icons.credit_card_off)),
  CategoryList(category: "Rental Income", icons: const Icon(Icons.price_check)),
  CategoryList(category: "Selling Income", icons: const Icon(Icons.sell)),
  CategoryList(category: "Transfer", icons: const Icon(Icons.contactless)),
  CategoryList(category: "Savings", icons: const Icon(Icons.savings)),
  CategoryList(category: "Other", icons: const Icon(Icons.currency_exchange)),
  CategoryList(category: "Loan", icons: const Icon(Icons.real_estate_agent))
];

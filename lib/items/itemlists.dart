import 'package:flutter/material.dart';

import 'item_card.dart';
import 'item_object.dart';
//  - assets/item_example/blanket.jpg
//  - assets/item_example/textbook.jpg

List<ItemCard> stationeryList = [
  ItemCard(ItemObject("assets/item_example/tsquare.jpg", "T-Square Ruler",
      "10:00 AM", "12:00 AM", "Patsornchai W.", "Engineering", 5)),
];

List<ItemCard> clothingList = [
  ItemCard(ItemObject("assets/item_example/jacket.jpg", "Jacket", "10:00 AM",
      "12:00 AM", "Patsornchai W.", "Engineering", 10)),
];

List<ItemCard> sportEquipmentList = [
  ItemCard(ItemObject("assets/item_example/racquet.jpg", "Tennis Racquet",
      "10:00 AM", "12:00 AM", "Patsornchai W.", "Engineering", 10)),
];

List<ItemCard> electronicsList = [
  ItemCard(ItemObject("assets/item_example/laptop.jpg", "Laptop", "10:00 AM",
      "12:00 AM", "Patsornchai W.", "Engineering", 20)),
  ItemCard(ItemObject("assets/item_example/ipad.jpg", "Ipad", "11:00 AM",
      "12:00 AM", "Pongpanod S.", "Engineering", 15))
];

List<ItemCard> booksList = [
  ItemCard(ItemObject("assets/item_example/textbook.jpg", "Software Engineering Textbook", "10:00 AM",
      "12:00 AM", "Patsornchai W.", "Engineering", 5)),
];

List<ItemCard> othersList = [
  ItemCard(ItemObject("assets/item_example/blanket.jpg", "Blanket", "10:00 AM",
      "12:00 AM", "Patsornchai W.", "Engineering", 5)),
];

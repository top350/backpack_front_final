import 'item_object.dart';
import 'item_method.dart';

DateTime sampledate = DateTime.now();

List<ItemObject> itemList = [ //Simulate Raw Data from server
  ItemObject(
      "T-Square Ruler",
      "Stationery",
      sampledate,
      sampledate,
      "Engineering",
      10,
      'For drawing class',
      "assets/item_example/tsquare.jpg",
      "Patsornchai W."),
  ItemObject("Jacket", "Clothing", sampledate, sampledate, "Engineering", 20,
      'Need Black Jacket', "assets/item_example/jacket.jpg", "Patsornchai W."),
  ItemObject(
      "Tennis Racquet",
      "Sport Equipment",
      sampledate,
      sampledate,
      "Engineering",
      20,
      'Wilson preferred',
      "assets/item_example/racquet.jpg",
      "Patsornchai W."),
  ItemObject("Laptop", "Electronics", sampledate, sampledate, "Engineering", 40,
      '', "assets/item_example/laptop.jpg", "Patsornchai W."),
  ItemObject("Ipad", "Electronics", sampledate, sampledate, "Engineering", 30,
      '', "assets/item_example/ipad.jpg", "Pongpanod S."),
  ItemObject(
      "Software Engineering Textbook",
      "Books",
      sampledate,
      sampledate,
      "Engineering",
      10,
      'Need for afternoon class',
      "assets/item_example/textbook.jpg",
      "Patsornchai W."),
  ItemObject("Blanket", "Others", sampledate, sampledate, "Engineering", 10,
      'Need a thick one', "assets/item_example/blanket.jpg", "Patsornchai W."),
];

List<ItemObject> stationeryList = sortCategory('Stationery',itemList);
List<ItemObject> clothingList = sortCategory('Clothing',itemList);
List<ItemObject> sportEquipmentList = sortCategory('Sport Equipment',itemList);
List<ItemObject> electronicsList = sortCategory('Electronics',itemList);
List<ItemObject> booksList = sortCategory('Books',itemList);
List<ItemObject> othersList = sortCategory('Others',itemList);

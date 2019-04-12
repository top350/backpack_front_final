import 'package:flutter/material.dart';

import 'item_card.dart';
import 'item_object.dart';

//need to make list to ItemObject not ItemCard

DateTime sampledate = DateTime.now();

List<ItemCard> stationeryList = [
  ItemCard(ItemObject(
      "T-Square Ruler",
      "Staionery",
      sampledate,
      sampledate,
      "Engineering",
      10,
      'For drawing class',
      "assets/item_example/tsquare.jpg",
      "Patsornchai W.")),
];

List<ItemCard> clothingList = [
  ItemCard(ItemObject(
      "Jacket",
      "Clothing",
      sampledate,
      sampledate,
      "Engineering",
      20,
      'Need Black Jacket',
      "assets/item_example/jacket.jpg",
      "Patsornchai W.")),
];

List<ItemCard> sportEquipmentList = [
  ItemCard(ItemObject(
      "Tennis Racquet",
      "Sport Equipment",
      sampledate,
      sampledate,
      "Engineering",
      20,
      'Wilson preferred',
      "assets/item_example/racquet.jpg",
      "Patsornchai W.")),
];

List<ItemCard> electronicsList = [
  ItemCard(ItemObject(
      "Laptop",
      "Electronics",
      sampledate,
      sampledate,
      "Engineering",
      40,
      '',
      "assets/item_example/laptop.jpg",
      "Patsornchai W.")),
      ItemCard(ItemObject(
      "Ipad",
      "Electronics",
      sampledate,
      sampledate,
      "Engineering",
      30,
      '',
      "assets/item_example/ipad.jpg",
      "Pongpanod S.")),
];

List<ItemCard> booksList = [
  ItemCard(ItemObject(
      "Software Engineering Textbook",
      "Books",
      sampledate,
      sampledate,
      "Engineering",
      10,
      'Need for afternoon class',
      "assets/item_example/textbook.jpg",
      "Patsornchai W.")),
];

List<ItemCard> othersList = [
  ItemCard(ItemObject(
      "Blanket",
      "Others",
      sampledate,
      sampledate,
      "Engineering",
      10,
      'Need a thick one',
      "assets/item_example/blanket.jpg",
      "Patsornchai W.")),
];

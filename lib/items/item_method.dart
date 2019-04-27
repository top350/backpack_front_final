import 'item_object.dart';
import 'item_card.dart';
import '../database/db_request.dart';

List<ItemObject> sortCategory(String category,List<ItemObject> item){ //sort Category
  List<ItemObject> sortedList = [];
  for(int i = 0 ;i<item.length;i++){
    if(item[i].category == category)
    sortedList.add(item[i]);
  }
  return sortedList;
}

List<ItemCard> convertToCard(List<ItemObject> item){ //covert ItemObject to ItemCard
  List<ItemCard> cardList = [];
    for(int i = 0 ;i<item.length;i++){
      cardList.add(ItemCard(item[i]));
  }
  return cardList;
}
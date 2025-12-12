class ShopItem{
  final int item_id;
  final int content_id;
  final int cost;
  final int is_purchased;
  final String name;
  final int item_category;

  const ShopItem({
    required this.item_id,
    required this.content_id,
    required this.cost,
    required this.is_purchased,
    required this.name,
    required this.item_category,
  });

  factory ShopItem.fromMap(Map<String, dynamic> map, int _item_category) {
    return ShopItem(
      item_id: map['id'] as int,
      content_id: map['content_id'] as int,
      cost: map['cost'] as int,
      is_purchased: map['is_purchased'] as int,
      name: map['name'] as String,
      item_category: _item_category,
    );
  }

  @override
  String toString() {
    return 'ShopItem(item_id: $item_id, content_id: $content_id name: $name, cost: $cost is_purchased: $is_purchased, item_categoty: $item_category)';
  }
}
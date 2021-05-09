class CartItem{
  int id;
  String mobile_name;
  int price ;
  String image;
  int quantity ;
  CartItem(
      {
        required this.id,
        required this.mobile_name ,
        required this.price,
        required this.image,
        this.quantity = 1,
      });
}
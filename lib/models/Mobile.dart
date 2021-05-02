class Mobile{
  int id;
  String name ;
  String brand ;
  String image ;
  double price ;
  bool isSelected ;
  String description ;
  Mobile(
      {
        required this.id,
        required this.name,
        required this.brand,
        required this.price,
        this.isSelected = false,
        required this.image,
        required this.description
      });
}
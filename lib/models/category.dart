class Category {
  int id;
  String name;
  String image;
  bool isSelected;
  Category(
      {this.id = 0,
      required this.name,
      this.isSelected = false,
      required this.image});
}

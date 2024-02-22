class Categories {
  String title;
  String img;

  Categories({
    required this.title,
    required this.img,
  });
}

class Products {
  String title;
  String img;
  //String description;
  int price;
  bool added;
  int count;

  Products({
    required this.title,
    required this.img,
    required this.price,
    this.added = false,
    //required this.description,
    this.count = 1,
  });
}

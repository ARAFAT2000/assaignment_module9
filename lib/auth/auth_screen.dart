class Product {
  String image;
  String name;
  int unitPrice;
  String color;
  String size;
  int quantity;

  Product(this.image, this.name, this.unitPrice, this.color, this.size, this.quantity);
}



List<Product> products = [
  Product('images/ppp.jpg', 'Pullover', 51, 'Black', 'L', 1),
  Product('images/sss.jpg', 'T-Shirt', 30, 'Gray', 'L', 1),
  Product('images/tshirt.jpg', 'Sport Dress', 43, 'Black', 'M', 1),
];
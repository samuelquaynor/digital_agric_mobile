class Category {
  Category({required this.icon, required this.title});
  final String icon, title;
}

List<Category> demo_categories = [
  Category(
    icon: 'assets/images/dress.svg',
    title: 'Dress',
  ),
  Category(
    icon: 'assets/images/shirt.svg',
    title: 'Shirt',
  ),
  Category(
    icon: 'assets/images/pants.svg',
    title: 'Pants',
  ),
  Category(
    icon: 'assets/images/Tshirt.svg',
    title: 'Tshirt',
  ),
];

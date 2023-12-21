export 'items.dart';

class ItemService {
  static List<Item> fetchData() {
    return [
      Item(
        imagePath: 'images/items/vacuum.jpeg',
        title: 'Vacuum Cleaner',
        imageUrl: 'images/man-bird.jpeg',
        name: 'David',
        rating: '5.0',
        distance: '5.1 mil',
        views: '13',
        time: 'Just added',
      ),
      Item(
        imagePath: 'images/items/sofa.jpeg',
        title: 'Sofa',
        imageUrl: 'images/man-bird.jpeg',
        name: 'Fred',
        rating: '4.0',
        distance: '0.1 mil',
        views: '3',
        time: '2hrs ago',
      ),
      Item(
        imagePath: 'images/items/table.jpeg',
        title: 'Table',
        imageUrl: 'images/man-bird.jpeg',
        name: 'John',
        rating: '4.2',
        distance: '1.1 mil',
        views: '1',
        time: '1 day ago',
      ),
      Item(
        imagePath: 'images/items/chair.jpeg',
        title: 'Chair',
        imageUrl: 'images/man-bird.jpeg',
        name: 'Mary',
        rating: '3.9',
        distance: '2.1 mil',
        views: '2',
        time: '2 days ago',
      ),
      Item(
        imagePath: 'images/items/lamp.jpeg',
        title: 'Lamp',
        imageUrl: 'images/man-bird.jpeg',
        name: 'Jane',
        rating: '4.1',
        distance: '3.1 mil',
        views: '3',
        time: '3 days ago',
      ),
    ];
  }
}

class Item {
  String imagePath;
  String title;
  String imageUrl;
  String name;
  String rating;
  String distance;
  String views;
  String time;

  Item({
    required this.imagePath,
    required this.title,
    required this.imageUrl,
    required this.name,
    required this.rating,
    required this.distance,
    required this.views,
    required this.time,
  });
}

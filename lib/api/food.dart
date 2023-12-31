export 'food.dart';

class MockFoodApiService {
  static List<MockFoodApi> fetchData() {
    return [
      MockFoodApi(
        imagePath: 'images/food/donut.jpeg',
        title: 'Donuts',
        imageUrl: 'images/man-bird.jpeg',
        name: 'David',
        rating: '5.0',
        distance: '5.1 mil',
        views: '13',
        time: 'Just added',
      ),
      MockFoodApi(
        imagePath: 'images/food/rice.jpeg',
        title: 'Rice',
        imageUrl: 'images/man-bird.jpeg',
        name: 'Fred',
        rating: '4.0',
        distance: '0.1 mil',
        views: '3',
        time: '2hrs ago',
      ),
      MockFoodApi(
        imagePath: 'images/food/bread.jpeg',
        title: 'Bread',
        imageUrl: 'images/man-bird.jpeg',
        name: 'John',
        rating: '4.2',
        distance: '1.1 mil',
        views: '1',
        time: '1 day ago',
      ),
      MockFoodApi(
        imagePath: 'images/food/pizza.jpeg',
        title: 'Pizza',
        imageUrl: 'images/man-bird.jpeg',
        name: 'Mary',
        rating: '3.9',
        distance: '2.1 mil',
        views: '2',
        time: '2 days ago',
      ),
      MockFoodApi(
        imagePath: 'images/food/burger.jpeg',
        title: 'Burger',
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

class MockFoodApi {
  String imagePath;
  String title;
  String imageUrl;
  String name;
  String rating;
  String distance;
  String views;
  String time;

  MockFoodApi({
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

class GridItem {
  final String imagePath;
  final String? description;
  final String title;
  final String? tag;
  final String? like;
   bool? liked;

  GridItem(
      {required this.imagePath,
      this.description,
      required this.title,
      this.tag,
      this.like,
      this.liked});

  static List<GridItem> profileList = [
    GridItem(
        imagePath: 'images/pig.png', description: 'Description 1', title: "a"),
    GridItem(
        imagePath: 'images/bean.jpg', description: 'Description 2', title: "a"),
    GridItem(
        imagePath: 'images/pi1.jpg', description: 'Description 2', title: "a"),
    GridItem(
        imagePath: 'images/pi2.jpg', description: 'Description 2', title: "a"),
    GridItem(
        imagePath: 'images/pig.png', description: 'Description 1', title: "a"),
    GridItem(
        imagePath: 'images/bean.jpg', description: 'Description 2', title: "a"),
    GridItem(
        imagePath: 'images/pi1.jpg', description: 'Description 2', title: "a"),
    GridItem(
        imagePath: 'images/pi2.jpg', description: 'Description 2', title: "a"),
    GridItem(
        imagePath: 'images/pig.png', description: 'Description 1', title: "a"),
    GridItem(
        imagePath: 'images/bean.jpg', description: 'Description 2', title: "a"),
    GridItem(
        imagePath: 'images/pi1.jpg', description: 'Description 2', title: "a"),
    GridItem(
        imagePath: 'images/pi2.jpg', description: 'Description 2', title: "a"),

    // ... 其他项目
  ];
  static List<GridItem> storyList = [
    GridItem(
        imagePath: 'images/pig.png',
        title: "Ep 2: The Cell The Secret Life of Prisons",
        tag: "Relationships",
        like: "23",
    liked: true),
    GridItem(
        imagePath: 'images/bean.jpg',
        title: "After Prison: Jarrad's Story CRC",
        tag: "Arrest",
        like: "23",
        liked: true
    ),
    GridItem(
        imagePath: 'images/pi1.jpg',
        title: "Ep 1: Making HERstory Bird's Eye View",
        tag: "Music",
        like: "23", liked: false),
    GridItem(
        imagePath: 'images/pi2.jpg',
        title: "Cellies Ear Hustle",
        tag: "Prison Life",
        like: "23", liked: false),
    GridItem(
        imagePath: 'images/pig.png',
        title: "adafafsdffsfafaafwadafafsdffsfafaafw",
        tag: "Survival",
        like: "23",liked: true),
    GridItem(
        imagePath: 'images/bean.jpg',
        title: "adafafsdffsfafaafwadafafsdffsfafaafw",
        tag: "Survival",
        like: "23",liked: true),
    GridItem(
        imagePath: 'images/pi1.jpg',
        title: "adafafsdffsfafaafwadafafsdffsfafaafw",
        tag: "Survival",
        like: "23",liked: true),
    GridItem(
        imagePath: 'images/pi2.jpg', title: "a", tag: "Survival", like: "23",liked: false),
    GridItem(
        imagePath: 'images/pig.png', title: "a", tag: "Survival", like: "23",liked: false),
    GridItem(
        imagePath: 'images/bean.jpg', title: "a", tag: "Survival", like: "23",liked: false),
    GridItem(
        imagePath: 'images/pi1.jpg', title: "a", tag: "Survival", like: "23",liked: true),
    GridItem(
        imagePath: 'images/pi2.jpg', title: "a", tag: "Survival", like: "23",liked: false),
  ];
}

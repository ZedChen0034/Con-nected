class GridItem {
  final String id;
  final String imagePath;
  final String? description;
  final String title;
  final String? tag;
  final String? like;
   bool? liked;

  GridItem(
      {required this.id,
        required this.imagePath,
      this.description,
      required this.title,
      this.tag,
      this.like,
      this.liked});

  static List<GridItem> profileList = [
    GridItem(
      id:"0",
        imagePath: 'images/pig.png', description: 'Description 1', title: "a"),
    GridItem(
        id:"1",
        imagePath: 'images/bean.jpg', description: 'Description 2', title: "a"),
    GridItem(
        id:"2",
        imagePath: 'images/pi1.jpg', description: 'Description 2', title: "a"),
    GridItem(
        id:"3",
        imagePath: 'images/pi2.jpg', description: 'Description 2', title: "a"),
    GridItem(
        id:"4",
        imagePath: 'images/pig.png', description: 'Description 1', title: "a"),
    GridItem(
        id:"5",
        imagePath: 'images/bean.jpg', description: 'Description 2', title: "a"),
    GridItem(
        id:"6",
        imagePath: 'images/pi1.jpg', description: 'Description 2', title: "a"),
    GridItem(
        id:"7",
        imagePath: 'images/pi2.jpg', description: 'Description 2', title: "a"),
    GridItem(
        id:"8",
        imagePath: 'images/pig.png', description: 'Description 1', title: "a"),
    GridItem(
        id:"9",
        imagePath: 'images/bean.jpg', description: 'Description 2', title: "a"),
    GridItem(
        id:"10",
        imagePath: 'images/pi1.jpg', description: 'Description 2', title: "a"),
    GridItem(
        id:"11",
        imagePath: 'images/pi2.jpg', description: 'Description 2', title: "a"),

    // ... 其他项目
  ];
  static List<GridItem> storyList = [
    GridItem(
        id:"0",
        imagePath: 'images/pig.png',
        title: "Ep 2: The Cell The Secret Life of Prisons",
        tag: "Relationships",
        like: "23",
    liked: true),
    GridItem(
        id:"1",
        imagePath: 'images/bean.jpg',
        title: "After Prison: Jarrad's Story CRC",
        tag: "Arrest",
        like: "23",
        liked: true
    ),
    GridItem(
        id:"2",
        imagePath: 'images/pi1.jpg',
        title: "Ep 1: Making HERstory Bird's Eye View",
        tag: "Music",
        like: "23", liked: false),
    GridItem(
        id:"3",
        imagePath: 'images/pi2.jpg',
        title: "Cellies Ear Hustle",
        tag: "Prison Life",
        like: "23", liked: false),
    GridItem(
        id:"4",
        imagePath: 'images/pig.png',
        title: "adafafsdffsfafaafwadafafsdffsfafaafw",
        tag: "Survival",
        like: "23",liked: true),
    GridItem(
        id:"5",
        imagePath: 'images/bean.jpg',
        title: "adafafsdffsfafaafwadafafsdffsfafaafw",
        tag: "Survival",
        like: "23",liked: true),
    GridItem(
        id:"6",
        imagePath: 'images/pi1.jpg',
        title: "adafafsdffsfafaafwadafafsdffsfafaafw",
        tag: "Survival",
        like: "23",liked: true),
    GridItem(
        id:"7",
        imagePath: 'images/pi2.jpg', title: "a", tag: "Survival", like: "23",liked: false),
    GridItem(
        id:"8",
        imagePath: 'images/pig.png', title: "a", tag: "Survival", like: "23",liked: false),
    GridItem(
        id:"9",
        imagePath: 'images/bean.jpg', title: "a", tag: "Survival", like: "23",liked: false),
    GridItem(
        id:"10",
        imagePath: 'images/pi1.jpg', title: "a", tag: "Survival", like: "23",liked: true),
    GridItem(
        id:"11",
        imagePath: 'images/pi2.jpg', title: "a", tag: "Survival", like: "23",liked: false),
  ];
  static List<GridItem> likedStories = storyList.where((item) => item.liked == true).toList();

  static List<GridItem> journalList = [
    GridItem(
        id:"0",
        imagePath: 'images/pig.png',
        title: "Ep 2: The Cell The Secret Life of Prisons",
        tag: "Relationships",
        like: "23",
        liked: true),
    GridItem(
        id:"1",
        imagePath: 'images/bean.jpg',
        title: "After Prison: Jarrad's Story CRC",
        tag: "Arrest",
        like: "23",
        liked: true
    ),
    GridItem(
        id:"2",
        imagePath: 'images/pi1.jpg',
        title: "Ep 1: Making HERstory Bird's Eye View",
        tag: "Music",
        like: "23", liked: false),
    GridItem(
        id:"3",
        imagePath: 'images/pi2.jpg',
        title: "Cellies Ear Hustle",
        tag: "Prison Life",
        like: "23", liked: false),
    GridItem(
        id:"4",
        imagePath: 'images/pig.png',
        title: "adafafsdffsfafaafwadafafsdffsfafaafw",
        tag: "Survival",
        like: "23",liked: true),
    GridItem(
        id:"5",
        imagePath: 'images/bean.jpg',
        title: "adafafsdffsfafaafwadafafsdffsfafaafw",
        tag: "Survival",
        like: "23",liked: true),
    GridItem(
        id:"6",
        imagePath: 'images/pi1.jpg',
        title: "adafafsdffsfafaafwadafafsdffsfafaafw",
        tag: "Survival",
        like: "23",liked: true),
    GridItem(
        id:"7",
        imagePath: 'images/pi2.jpg', title: "a", tag: "Survival", like: "23",liked: false),
    GridItem(
        id:"8",
        imagePath: 'images/pig.png', title: "a", tag: "Survival", like: "23",liked: false),
    GridItem(
        id:"9",
        imagePath: 'images/bean.jpg', title: "a", tag: "Survival", like: "23",liked: false),
    GridItem(
        id:"10",
        imagePath: 'images/pi1.jpg', title: "a", tag: "Survival", like: "23",liked: true),
    GridItem(
        id:"11",
        imagePath: 'images/pi2.jpg', title: "a", tag: "Survival", like: "23",liked: false),
  ];
  static List<GridItem> likedJournals = journalList.where((item) => item.liked == true).toList();

}

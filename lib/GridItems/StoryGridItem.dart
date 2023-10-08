class StoryGridItem {
  final String id;
  final String imagePath;
  final String content;
  final String title;
  final String tag;
  final String like;
  final String? videoPath;
  bool liked;

  StoryGridItem({required this.id, required this.imagePath, required this.content, required this.title, required this.tag, required this.like,  this.videoPath, required this.liked});

  static List<StoryGridItem> storyList = [
    StoryGridItem(
        id:"0",
        imagePath: 'images/pig.png',
        title: "Ep 2: The Cell The Secret Life of Prisons",
        tag: "Relationships",
        like: "23",
        liked: true, content: 'abcdefghijklmn'),
    StoryGridItem(
        id:"1",
        imagePath: 'images/bean.jpg',
        title: "After Prison: Jarrad's Story CRC",
        tag: "Arrest",
        like: "23",
        liked: true, content: 'abcdefghijklmn'
    ),
    StoryGridItem(
        id:"2",
        imagePath: 'images/pi1.jpg',
        title: "Ep 1: Making HERstory Bird's Eye View",
        tag: "Music",
        like: "23", liked: false, content: 'abcdefghijklmn'),
    StoryGridItem(
        id:"3",
        imagePath: 'images/pi2.jpg',
        title: "Cellies Ear Hustle",
        tag: "Prison Life",
        like: "23", liked: false, content: 'abcdefghijklmn'),
    StoryGridItem(
        id:"4",
        imagePath: 'images/pig.png',
        title: "adafafsdffsfafaafwadafafsdffsfafaafw",
        tag: "Survival",
        like: "23",liked: true, content: 'abcdefghijklmn'),
    StoryGridItem(
        id:"5",
        imagePath: 'images/bean.jpg',
        title: "adafafsdffsfafaafwadafafsdffsfafaafw",
        tag: "Survival",
        like: "23",liked: true, content: 'abcdefghijklmn'),
    StoryGridItem(
        id:"6",
        imagePath: 'images/pi1.jpg',
        title: "adafafsdffsfafaafwadafafsdffsfafaafw",
        tag: "Survival",
        like: "23",liked: true, content: 'abcdefghijklmn'),
    StoryGridItem(
        id:"7", content: 'abcdefghijklmn',
        imagePath: 'images/pi2.jpg', title: "a", tag: "Survival", like: "23",liked: false),
    StoryGridItem(
        id:"8", content: 'abcdefghijklmn',
        imagePath: 'images/pig.png', title: "a", tag: "Survival", like: "23",liked: false),
  ];
  static List<StoryGridItem> likedStories = storyList.where((item) => item.liked == true).toList();



}

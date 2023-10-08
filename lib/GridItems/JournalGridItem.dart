class JournalGridItem {
  final String id;
  final String title;
  final String like;
  final String theme;
  final String feeling;
  final String reflection;
  final String? videoPath;
  final String? imagePath;
  final String author;
  bool isPublic;
  bool liked;

  JournalGridItem(
      {required this.id,
      required this.title,
      required this.like,
      required this.theme,
      required this.feeling,
      required this.reflection,
      this.videoPath,
      this.imagePath,
      required this.author,
      required this.isPublic,
      required this.liked});

  static List<JournalGridItem> journalList = [
    JournalGridItem(
        id: "0",
        feeling: "Great",
        imagePath: 'images/pig.png',
        title: "Ep 2: The Cell The Secret Life of Prisons",
        theme: "Appointment",
        like: "23",
        liked: true,
        isPublic: true,
        author: "me",
        reflection: "i really enjoy the progress"),
    JournalGridItem(
        id: "1",
        feeling: "Great",
        isPublic: true,
        imagePath: 'images/bean.jpg',
        title: "After Prison: Jarrad's Story CRC",
        theme: "Court",
        like: "23",
        liked: true,
        author: "me",
        reflection: "i really enjoy the progress"),
    JournalGridItem(
        id: "2",
        feeling: "Average",
        isPublic: true,
        imagePath: 'images/pi1.jpg',
        title: "Ep 1: Making HERstory Bird's Eye View",
        theme: "Opportunity",
        like: "23",
        liked: false,
        author: "me",
        reflection: "i really enjoy the progress"),
    JournalGridItem(
        id: "3",
        feeling: "Average",
        isPublic: true,
        imagePath: 'images/pi2.jpg',
        title: "Cellies Ear Hustle",
        theme: "Cravings",
        like: "23",
        liked: false,
        author: "me",
        reflection: "i really enjoy the progress"),
    JournalGridItem(
        id: "4",
        feeling: "Average",
        isPublic: true,
        imagePath: 'images/pig.png',
        title: "adafafsdffsfafaafwadafafsdffsfafaafw",
        theme: "Pressure",
        like: "23",
        liked: true,
        author: "me",
        reflection: "i really enjoy the progress"),
    JournalGridItem(
        id: "5",
        feeling: "Average",
        isPublic: true,
        imagePath: 'images/bean.jpg',
        title: "adafafsdffsfafaafwadafafsdffsfafaafw",
        theme: "Pressure",
        like: "23",
        liked: true,
        author: "me",
        reflection: "i really enjoy the progress"),
    JournalGridItem(
        id: "6",
        feeling: "Average",
        isPublic: false,
        imagePath: 'images/pi1.jpg',
        title: "adafafsdffsfafaafwadafafsdffsfafaafw",
        theme: "Pressure",
        like: "23",
        liked: true,
        author: "me",
        reflection: "i really enjoy the progress"),
    JournalGridItem(
        id: "7",
        feeling: "Average",
        isPublic: false,
        imagePath: 'images/pi2.jpg',
        title: "a",
        theme: "Pressure",
        like: "23",
        liked: false,
        author: "me",
        reflection: "i really enjoy the progress"),
    JournalGridItem(
        id: "8",
        feeling: "Bad",
        isPublic: false,
        imagePath: 'images/pig.png',
        title: "a",
        theme: "Pressure",
        like: "23",
        liked: false,
        author: "me",
        reflection: "i really enjoy the progress"),
  ];
  static List<JournalGridItem> likedJournals =
      journalList.where((item) => item.liked == true).toList();
  static List<JournalGridItem> myJournals =
      journalList.where((item) => item.author == "me").toList();
}

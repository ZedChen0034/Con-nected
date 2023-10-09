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
        reflection: "In episode 2 of The Secret Life of Prisons, Phil and Paula hear what it's like to live in The Cell. Wrongly-imprisoned journalist Raphael Rowe and author and blogger David Breakspear share their stories of living in a cell. Carl Cattermole is an award-winning dramatist and author, he writes and delivers a powerful piece about living in prison. Dr Kimmett Edgar reflects on the true meaning behind prison related headlines and statistics. And poet, Mr Gee, delivers his poem at the end of the episode, written during the recording."),
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
        reflection: "In episode 2 of The Secret Life of Prisons, Phil and Paula hear what it's like to live in The Cell. Wrongly-imprisoned journalist Raphael Rowe and author and blogger David Breakspear share their stories of living in a cell. Carl Cattermole is an award-winning dramatist and author, he writes and delivers a powerful piece about living in prison. Dr Kimmett Edgar reflects on the true meaning behind prison related headlines and statistics. And poet, Mr Gee, delivers his poem at the end of the episode, written during the recording."),
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
        reflection: "In episode 2 of The Secret Life of Prisons, Phil and Paula hear what it's like to live in The Cell. Wrongly-imprisoned journalist Raphael Rowe and author and blogger David Breakspear share their stories of living in a cell. Carl Cattermole is an award-winning dramatist and author, he writes and delivers a powerful piece about living in prison. Dr Kimmett Edgar reflects on the true meaning behind prison related headlines and statistics. And poet, Mr Gee, delivers his poem at the end of the episode, written during the recording."),
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
        reflection: "In episode 2 of The Secret Life of Prisons, Phil and Paula hear what it's like to live in The Cell. Wrongly-imprisoned journalist Raphael Rowe and author and blogger David Breakspear share their stories of living in a cell. Carl Cattermole is an award-winning dramatist and author, he writes and delivers a powerful piece about living in prison. Dr Kimmett Edgar reflects on the true meaning behind prison related headlines and statistics. And poet, Mr Gee, delivers his poem at the end of the episode, written during the recording."),
    JournalGridItem(
        id: "4",
        feeling: "Average",
        isPublic: true,
        imagePath: 'images/pig.png',
        title: "adafafsdffsfafaafwadafafsdffsfafaafw",
        theme: "Pressure",
        like: "23",
        liked: true,
        author: "David",
        reflection: "In episode 2 of The Secret Life of Prisons, Phil and Paula hear what it's like to live in The Cell. Wrongly-imprisoned journalist Raphael Rowe and author and blogger David Breakspear share their stories of living in a cell. Carl Cattermole is an award-winning dramatist and author, he writes and delivers a powerful piece about living in prison. Dr Kimmett Edgar reflects on the true meaning behind prison related headlines and statistics. And poet, Mr Gee, delivers his poem at the end of the episode, written during the recording."),
    JournalGridItem(
        id: "5",
        feeling: "Average",
        isPublic: true,
        imagePath: 'images/bean.jpg',
        title: "adafafsdffsfafaafwadafafsdffsfafaafw",
        theme: "Pressure",
        like: "23",
        liked: true,
        author: "Felix",
        reflection: "In episode 2 of The Secret Life of Prisons, Phil and Paula hear what it's like to live in The Cell. Wrongly-imprisoned journalist Raphael Rowe and author and blogger David Breakspear share their stories of living in a cell. Carl Cattermole is an award-winning dramatist and author, he writes and delivers a powerful piece about living in prison. Dr Kimmett Edgar reflects on the true meaning behind prison related headlines and statistics. And poet, Mr Gee, delivers his poem at the end of the episode, written during the recording."),
    JournalGridItem(
        id: "6",
        feeling: "Average",
        isPublic: false,
        imagePath: 'images/pi1.jpg',
        title: "adafafsdffsfafaafwadafafsdffsfafaafw",
        theme: "Pressure",
        like: "23",
        liked: false,
        author: "Harry",
        reflection: "In episode 2 of The Secret Life of Prisons, Phil and Paula hear what it's like to live in The Cell. Wrongly-imprisoned journalist Raphael Rowe and author and blogger David Breakspear share their stories of living in a cell. Carl Cattermole is an award-winning dramatist and author, he writes and delivers a powerful piece about living in prison. Dr Kimmett Edgar reflects on the true meaning behind prison related headlines and statistics. And poet, Mr Gee, delivers his poem at the end of the episode, written during the recording."),
    JournalGridItem(
        id: "7",
        feeling: "Average",
        isPublic: false,
        imagePath: 'images/pi2.jpg',
        title: "a",
        theme: "Pressure",
        like: "23",
        liked: false,
        author: "Xavier",
        reflection: "In episode 2 of The Secret Life of Prisons, Phil and Paula hear what it's like to live in The Cell. Wrongly-imprisoned journalist Raphael Rowe and author and blogger David Breakspear share their stories of living in a cell. Carl Cattermole is an award-winning dramatist and author, he writes and delivers a powerful piece about living in prison. Dr Kimmett Edgar reflects on the true meaning behind prison related headlines and statistics. And poet, Mr Gee, delivers his poem at the end of the episode, written during the recording."),
    JournalGridItem(
        id: "8",
        feeling: "Bad",
        isPublic: false,
        imagePath: 'images/pig.png',
        title: "a",
        theme: "Pressure",
        like: "23",
        liked: false,
        author: "Zed",
        reflection: "In episode 2 of The Secret Life of Prisons, Phil and Paula hear what it's like to live in The Cell. Wrongly-imprisoned journalist Raphael Rowe and author and blogger David Breakspear share their stories of living in a cell. Carl Cattermole is an award-winning dramatist and author, he writes and delivers a powerful piece about living in prison. Dr Kimmett Edgar reflects on the true meaning behind prison related headlines and statistics. And poet, Mr Gee, delivers his poem at the end of the episode, written during the recording."),
  ];
  static List<JournalGridItem> likedJournals =
      journalList.where((item) => item.liked == true).toList();
  static List<JournalGridItem> myJournals =
      journalList.where((item) => item.author == "me").toList();
}

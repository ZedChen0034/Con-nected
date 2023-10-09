class EventDemo {
  String id;
  String name;
  String tag;
  DateTime datetime;
  String location;
  String contact;
  String notificationType;
  String description;
  bool editable;

  EventDemo(
      {required this.id,
      required this.name,
      required this.tag,
      required this.datetime,
      required this.location,
      required this.contact,
      required this.notificationType,
      required this.description,
      required this.editable});

  static List<EventDemo> SCRIPT = [
    EventDemo(
        id: "1",
        name: 'Music Festival',
        tag: 'Community Service',
        datetime: DateTime(2023, 10, 5, 20, 30),
        location: '480 Northbourne Avenue, Dickson ACT 2602',
        contact: '0493000000',
        notificationType: '5min before event',
        description: 'A music festival featuring popular bands and artists.',
        editable: false),
    EventDemo(
        id: "2",
        name: 'Tech Conference',
        tag: 'DATO courses',
        datetime: DateTime(2023, 11, 12, 9, 0),
        location: '4 Knowles Pl, Canberra ACT 2601',
        contact: '0987654321',
        notificationType: '30min before event',
        description: 'A conference discussing the latest in tech.',
        editable: true),
    EventDemo(
        id: "3",
        name: 'Farm Working',
        tag: 'DATO courses',
        datetime: DateTime(2023, 11, 12, 12, 30),
        location: 'Bunda St, Canberra ACT 2601',
        contact: '0444444444',
        notificationType: '5min before event',
        description: 'A conference discussing the latest in tech.',
        editable: false)
  ];

  EventDemo.empty()
      : id = '',
        name = '',
        tag = 'Community Service',
        datetime = DateTime.now(),
        location = '',
        contact = '',
        notificationType = 'None',
        description = '',
        editable = true;

  bool get isEmpty => id.isEmpty;
}

// 死数据

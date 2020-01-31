import 'dart:math';

import 'package:dev_hub/models/technology_model.dart';

List<String> images = [
  "assets/image_04.jpg",
  "assets/image_03.jpg",
  "assets/image_02.jpg",
  "assets/image_01.png",
];
List<Technology> technologyList = [
  Technology(1, "Java"),
  Technology(2, "Dart"),
  Technology(3, "Flutter"),
  Technology(4, "Kotlin"),
];

List applyEventQuestions = [
  {"type": "TEXT", "question": "Why are you applying?"},
  {"type": "TEXT", "question": "How much can you spend?"},
  {
    "type": "SINGLE_CHOICE",
    "question": "Choose 1",
    "answer": ["ANSWER1", "ANSWER2", "ANSWER3"],
    "choice": 0
  },
  {
    "type": "SINGLE_CHOICE",
    "question": "Choose 1",
    "answer": ["ANSWER1", "ANSWER2", "ANSWER3"],
    "choice": 0
  },
];

List applyJobQuestions = [
  {"type": "TEXT", "question": "Why are you applying?"},
  {"type": "TEXT", "question": "How much can you spend?"},
  {
    "type": "SINGLE_CHOICE",
    "question": "Choose 1",
    "answer": ["ANSWER1", "ANSWER2", "ANSWER3"],
    "choice": 0
  },
  {
    "type": "SINGLE_CHOICE",
    "question": "Choose 1",
    "answer": ["ANSWER1", "ANSWER2", "ANSWER3"],
    "choice": 0
  },
  {
    "type": "MULTIPLE_CHOICE",
    "question": "Choose 1",
    "answer": [
      {"name": "ANSWER1", "checked": false},
      {"name": "ANSWER1", "checked": false},
      {"name": "ANSWER1", "checked": false}
    ],
  },
];

Map contactInfo = {
  "name": "Mark",
  "job": [
    {"name": "Founder and CEO", "location": "Exselcior IT"},
    {"name": "Works", "location": "Exselcior IT"},
  ],
  "study": [
    {"name": "Bca", "location": "DAV College"},
    {"name": "Mca", "location": "DAV College"},
  ],
  "address": {"state_and_city": "Colombo", "location": "Sri Lanka"},
  "desc": "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      "\nLorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an"
      "\nunknown printer took a galley of type and scrambled it to make a type specimen book. It"
      "\nhas survived not only five centuries, but also the leap into electronic typesetting, remaining"
      "\nessentially unchanged. It was popularised"
};
List jobsDetails = [
  {
    "name": "Associate Software Engineer Java",
    "education": "Bca",
    "img": "assets/1.jpeg",
    "time": "1 day ago",
    "location": "Colombo, Sri Lanka",
    "companyname": "DynamicTech",
    "applied": random.nextBool(),
    "technologies": [
      "Java",
      "Android",
      "Kotlin",
      "MVVM",
      "Live Data",
      "Navigation Architecture",
      "Constraint Layout"
    ],
    "requirement": [
      "2-3 years of Experience.",
      "Fluent in English.",
      "Should know MVVM and Android architectural components.",
      "Night shift."
    ],
    "details": "Pellentesque in ipsum id orci porta dapibus. "
        "Nulla porttitor accumsan tincidunt. Donec rutrum "
        "congue leo eget malesuada. "
        "\n\nPraesent sapien massa, convallis a pellentesque "
        "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
        "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
        "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
        "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
        "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  },
  {
    "name": "Senior Software Engineer",
    "img": "assets/2.jpeg",
    "education": "Mca",
    "time": r"1 day ago",
    "technologies": [
      "Java",
      "Android",
      "Kotlin",
      "MVVM",
      "Live Data",
      "Navigation Architecture",
      "Constraint Layout"
    ],
    "location": "Colombo, Sri Lanka",
    "companyname": "DynamicTech",
    "requirement": [
      "2-3 years of Experience.",
      "Fluent in English.",
      "Should know MVVM and Android architectural components.",
      "Night shift."
    ],
    "details": "Pellentesque in ipsum id orci porta dapibus. "
        "Nulla porttitor accumsan tincidunt. Donec rutrum "
        "congue leo eget malesuada. "
        "\nPraesent sapien massa, convallis a pellentesque "
        "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
        "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
        "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
        "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
        "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  },
  {
    "name": "Tech Lead",
    "img": "assets/3.jpeg",
    "education": "PGDCA",
    "time": r"1 week ago",
    "location": "Paris, France",
    "technologies": [
      "Java",
      "Android",
      "Kotlin",
      "MVVM",
      "Live Data",
      "Navigation Architecture",
      "Constraint Layout"
    ],
    "companyname": "DynamicTech",
    "requirement": [
      "2-3 years of Experience.",
      "Fluent in English.",
      "Should know MVVM and Android architectural components.",
      "Night shift."
    ],
    "details": "Pellentesque in ipsum id orci porta dapibus. "
        "Nulla porttitor accumsan tincidunt. Donec rutrum "
        "congue leo eget malesuada. "
        "\n\nPraesent sapien massa, convallis a pellentesque "
        "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
        "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
        "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
        "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
        "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  },
  {
    "name": "UI/UX Engineer",
    "img": "assets/4.jpeg",
    "education": "Bca",
    "time": r"1 week ago",
    "location": "Colombo, Sri lanka",
    "companyname": "DynamicTech",
    "technologies": [
      "Java",
      "Android",
      "Kotlin",
      "MVVM",
      "Live Data",
      "Navigation Architecture",
      "Constraint Layout"
    ],
    "requirement": [
      "2-3 years of Experience.",
      "Fluent in English.",
      "Should know MVVM and Android architectural components.",
      "Night shift."
    ],
    "details": "Pellentesque in ipsum id orci porta dapibus. "
        "Nulla porttitor accumsan tincidunt. Donec rutrum "
        "congue leo eget malesuada. "
        "\nPraesent sapien massa, convallis a pellentesque "
        "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
        "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
        "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
        "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
        "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  },
  {
    "name": "Intern Quality Engineer",
    "img": "assets/5.jpeg",
    "time": "2 weeks ago",
    "education": "Bca",
    "location": "Colombo, Sri Lanka",
    "companyname": "DynamicTech",
    "technologies": [
      "Java",
      "Android",
      "Kotlin",
      "MVVM",
      "Live Data",
      "Navigation Architecture",
      "Constraint Layout"
    ],
    "requirement": [
      "2-3 years of Experience.",
      "Fluent in English.",
      "Should know MVVM and Android architectural components.",
      "Night shift."
    ],
    "details": "Pellentesque in ipsum id orci porta dapibus. "
        "Nulla porttitor accumsan tincidunt. Donec rutrum "
        "congue leo eget malesuada. "
        "\nPraesent sapien massa, convallis a pellentesque "
        "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
        "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
        "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
        "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
        "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  },
];

Random random = Random();
List names = [
  "Ling Waldner",
  "Gricelda Barrera",
  "Lenard Milton",
  "Bryant Marley",
  "Rosalva Sadberry",
  "Guadalupe Ratledge",
  "Brandy Gazda",
  "Kurt Toms",
  "Rosario Gathright",
  "Kim Delph",
  "Stacy Christensen",
];

List messages = [
  "Hey, how are you doing?",
  "Are you available tomorrow?",
  "It's late. Go to bed!",
  "This cracked me up 😂😂",
  "Flutter Rocks!!!",
  "The last rocket🚀",
  "Griezmann signed for Barca❤️❤️",
  "Will you be attending the meetup tomorrow?",
  "Are you angry at something?",
  "Let's make a UI serie.",
  "Can i hear your voice?",
];

List notifs = [
  "${names[random.nextInt(10)]} and ${random.nextInt(100)} others liked your post",
  "${names[random.nextInt(10)]} mentioned you in a comment",
  "${names[random.nextInt(10)]} shared your post",
  "${names[random.nextInt(10)]} commented on your post",
  "${names[random.nextInt(10)]} replied to your comment",
  "${names[random.nextInt(10)]} reacted to your comment",
  "${names[random.nextInt(10)]} asked you to join a Group️",
  "${names[random.nextInt(10)]} asked you to like a page",
  "You have memories with ${names[random.nextInt(10)]}",
  "${names[random.nextInt(10)]} Tagged you and ${random.nextInt(100)} others in a post",
  "${names[random.nextInt(10)]} Sent you a friend request",
];

List notifications = List.generate(
    13,
    (index) => {
          "name": names[random.nextInt(10)],
          "dp": "assets/cm${random.nextInt(10)}.jpeg",
          "time": "${random.nextInt(50)} min ago",
          "notif": notifs[random.nextInt(10)]
        });

List posts = List.generate(
    13,
    (index) => {
          "name": names[random.nextInt(10)],
          "dp": "assets/cm${random.nextInt(10)}.jpeg",
          "time": "${random.nextInt(50)} min ago",
          "img": "assets/cm${random.nextInt(10)}.jpeg"
        });

List chats = List.generate(
    13,
    (index) => {
          "name": names[random.nextInt(10)],
          "dp": "assets/cm${random.nextInt(10)}.jpeg",
          "msg": messages[random.nextInt(10)],
          "counter": random.nextInt(20),
          "time": "${random.nextInt(50)} min ago",
          "isOnline": random.nextBool(),
        });

List groups = List.generate(
    13,
    (index) => {
          "name": "Group ${random.nextInt(20)}",
          "dp": "assets/cm${random.nextInt(10)}.jpeg",
          "msg": messages[random.nextInt(10)],
          "counter": random.nextInt(20),
          "time": "${random.nextInt(50)} min ago",
          "isOnline": random.nextBool(),
        });

List types = ["text", "image"];
List conversation = List.generate(
    10,
    (index) => {
          "username": "Group ${random.nextInt(20)}",
          "time": "${random.nextInt(50)} min ago",
          "type": types[random.nextInt(2)],
          "replyText": messages[random.nextInt(10)],
          "image": "assets/cm${random.nextInt(10)}.jpeg",
          "text": messages[random.nextInt(10)],
          "isMe": random.nextBool(),
          "isGroup": false,
          "isReply": random.nextBool(),
        });

List friends = List.generate(
    13,
    (index) => {
          "name": names[random.nextInt(10)],
          "dp": "assets/cm${random.nextInt(10)}.jpeg",
          "status": "Senior Software engineer at Excelsior IT",
          "isAccept": random.nextBool(),
        });

List imgList = [
  'https://www.event.lk/assets/img/events/1589266246139534899428279060_2459022624323813_9179775742259753306_n.jpg',
  'https://www.event.lk/assets/img/events/59179583460553550153567244_432284307511323_7405760946842370048_n.jpg',
  'https://blogs.utas.edu.au/international/files/2016/02/Sri-Lanka-events-Feb-2019.jpg',
  'https://img.freepik.com/free-vector/technology-conference-poster-template_1361-1211.jpg?size=626&ext=jpg',
  'https://womenintechsummit.pl/images/headers/header_home_2019_poster.jpg'
];

List events = [
  {
    "name": "Google I/O 2019",
    "img": "assets/ggl.jpg",
    "time": "From 03:30 p.m to 5:30 p.m",
    "date": "23 December 2019",
    "schedule_time": "4:00PM - 5:00PM",
    "activity_name": "Registration",
    "applied": random.nextBool(),
    "approved": random.nextBool(),
    "location": "SLIIT Colombo, Sri Lanka",
    "details": "Pellentesque in ipsum id orci porta dapibus. "
        "Nulla porttitor accumsan tincidunt. Donec rutrum "
        "congue leo eget malesuada. "
        "\n\nPraesent sapien massa, convallis a pellentesque "
        "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
        "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
        "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
        "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
        "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  },
  {
    "name": "Angular 2 Event",
    "img": "assets/anglr2.png",
    "time": "From 03:30 p.m to 5:30 p.m",
    "schedule_time": "5:10PM - 6:00PM",
    "activity_name": "Welcome Address",
    "date": "23 October 2019",
    "location": "Shangri La Colombo, Sri Lanka",
    "details": "Pellentesque in ipsum id orci porta dapibus."
        "Nulla porttitor accumsan tincidunt. Donec rutrum "
        "congue leo eget malesuada. "
        "\n\nPraesent sapien massa, convallis a pellentesque "
        "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
        "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
        "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
        "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
        "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  },
  {
    "name": "Flutter Sri Lanka 2019",
    "img": "assets/Fluttercmb.png",
    "time": "From 03:30 p.m to 5:30 p.m",
    "schedule_time": "6:00PM - 6:15PM",
    "activity_name": "Presentation on IO",
    "date": "3 November 2019",
    "location": "Hilton Ballroom Colombo, Sri Lanka",
    "details": "Pellentesque in ipsum id orci porta dapibus. "
        "Nulla porttitor accumsan tincidunt. Donec rutrum "
        "congue leo eget malesuada. "
        "\n\nPraesent sapien massa, convallis a pellentesque "
        "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
        "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
        "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
        "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
        "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  },
  {
    "name": "AWS Sri Lanka 2019",
    "img": "assets/aws.jpg",
    "time": "From 03:30 p.m to 5:30 p.m",
    "date": "30 October 2019",
    "schedule_time": "7:00PM - 7:15PM",
    "activity_name": "Gala Dinner",
    "location": "BMICH Colombo, Sri Lanka",
    "details": "Pellentesque in ipsum id orci porta dapibus. "
        "Nulla porttitor accumsan tincidunt. Donec rutrum "
        "congue leo eget malesuada. "
        "\n\nPraesent sapien massa, convallis a pellentesque "
        "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
        "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
        "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
        "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
        "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  },
  {
    "name": "Google I/O 2019",
    "img": "assets/ggl.jpg",
    "time": "From 03:30 p.m to 5:30 p.m",
    "date": "23 December 2019",
    "schedule_time": "4:00PM - 5:00PM",
    "activity_name": "Registration",
    "applied": random.nextBool(),
    "approved": random.nextBool(),
    "location": "SLIIT Colombo, Sri Lanka",
    "details": "Pellentesque in ipsum id orci porta dapibus. "
        "Nulla porttitor accumsan tincidunt. Donec rutrum "
        "congue leo eget malesuada. "
        "\n\nPraesent sapien massa, convallis a pellentesque "
        "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
        "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
        "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
        "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
        "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  }
];

List communities = [
  {
    "name": "Flutter Dev",
    "img_logo": "assets/images/flutter_logo.png",
    "img_cover": "assets/images/flutter_logo.png",
    "joining_status": true,
    "follower_count": "18K",
    "details": "Pellentesque in ipsum id orci porta dapibus. "
        "Nulla porttitor accumsan tincidunt. Donec rutrum "
        "congue leo eget malesuada. "
        "\n\nPraesent sapien massa, convallis a pellentesque "
        "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
        "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
        "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
        "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
        "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  },
  {
    "name": "StackOverflow",
    "img_logo": "assets/images/stack.png",
    "img_cover": "assets/images/stack.png",
    "joining_status": true,
    "follower_count": "18.6K",
    "details": "Pellentesque in ipsum id orci porta dapibus. "
        "Nulla porttitor accumsan tincidunt. Donec rutrum "
        "congue leo eget malesuada. "
        "\n\nPraesent sapien massa, convallis a pellentesque "
        "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
        "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
        "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
        "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
        "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  },
  {
    "name": "Swift Dev",
    "img_logo": "assets/images/swift.png",
    "img_cover": "assets/images/swift.png",
    "joining_status": true,
    "follower_count": "12K",
    "details": "Pellentesque in ipsum id orci porta dapibus. "
        "Nulla porttitor accumsan tincidunt. Donec rutrum "
        "congue leo eget malesuada. "
        "\n\nPraesent sapien massa, convallis a pellentesque "
        "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
        "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
        "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
        "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
        "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  },
];

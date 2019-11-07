import 'dart:math';

List<String> images = [
  "assets/image_04.jpg",
  "assets/image_03.jpg",
  "assets/image_02.jpg",
  "assets/image_01.png",
];

List jobsDetails = [
  {
    "name": "Associate Software Engineer Java",
    "img": "assets/1.jpeg",
    "time": "1 day ago",
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
    "time": r"2 weeks ago",
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
    "time": "From 03:30p.p.m to 5:30 p.m",
    "date": "23 December 2019",
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
    "time": "From 03:30p.p.m to 5:30 p.m",
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
    "time": "From 03:30p.p.m to 5:30 p.m",
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
    "time": "From 03:30p.p.m to 5:30 p.m",
    "date": "30 October 2019",
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
];

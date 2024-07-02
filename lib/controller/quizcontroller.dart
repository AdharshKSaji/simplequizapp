
import 'package:simplequizapp/model/categorymodel.dart';
import 'package:simplequizapp/model/questionmodel.dart';



class QuizController {
  static const List<CategoryModel> quizCategoryList = [
    CategoryModel(
      title: 'Flutter',
      imageUrl:
          'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAflBMVEX///9fyfhax/gxufYHW50EWZwDWJxPxfjz+/4IXJ5hhrSi3ftVxvjd5e4AVJrX8P3n9v5HvveG0/nN7P0AT5jf8/140PkATJcARpTS7v245fvE6Py2xtro9v4tqucMs/UARJNOrOAIO4uW2fotu/au3/oGOYnC4PNSfK7v8/fVukePAAADUklEQVR4nO3c21LbMBSFYSuxJVJSUVqDTaEmoS1t3/8F6wNxEluytzvTyd6b9Q+XXPibJaIhHJIEIYQQQgghhBBCCCGEEEIIIYQQQggp6eZ6Qd+vLv24y3twW2rOuZtLP+7yHpwJtQqmCBgWagIGhaqAIaFE4E0UGBAqA46F2oAjoTrgUKgPaOQD46+iAaFGoFEPNOqBRj3QqAca9UCjHmgAZBsRaNQDjXqgUQ806oEGQI4BCCDzvgAIIO8ABJB5AALIPADfE9C4u0s/7vKWAdUvqB6II8ovLAgg8wAEkHkAAsg8AAFkHoAAMg9AAJkHIIDMAxDAuqtFCQTeO3q395yBnyLA7egv8aK5zwAC+L+AK4nAO+3AJPlK/7V0mUA6USyQShQMpBFFAylE4cB5onjgHFEBcJqoAjhFVAKME9UAY8SV+xb+dHnAMDG64K2L/BMoxsAQMQ5cr7dUIh/gmBg9ojWQTOQEHBKnFiQTeQHPiXNAEpEb8JQ4fUSJRH7AI3F+wZYoD3gg0oAzRJ7Ajkg5ol1OHrAhUhecJPIFNkQ6MErkDEySyA9OgsAIkTcwUgQYJOoCBojagCOiPuCAKBK4mgaeEUUC72cmPCXKBG7nhQeiUKAhCDuiUOBqRRE2RLFAmnDtRAJN+w0STbiWCEweHV1Y+Y+Xftx/qSWShFWW5WKJFGGVpRu5RIKwsulmI5c4L+yAcok/qECxxJ/PM0CfHYRSideTxMrb7EBMU6uP2ADfiGmTOmKVe9sSsw6YpsoOag30B2KqkVgV3rdEq5RYlXneEX1r7ImFEmIDjBBlrji8F6uyyHui9z2vfUWVueI5sdoVnbA1nvnqr0mhxMfj+4Zm/1IUb0Rv03QArIkyD2pPrIFl0Zb7/iY88Ylf0exfy7KoP4a8I1A2sVmw5uXZZug7AUo+qO2CuR3zznySV9y/BnkjoFjir5c0xBv75BKfdjSg4HvxqSQNKHrFctYn/V48J0YHVEKc2E8FMbSaknvxqczmzqcCImXABmh1EUNAscQdYcAOKJY4v6LtU0q0VjyxP6gTB9R2b6hKJZY25hsABRMjvhEwy7xQ4s6Ty3cyiR8W9PvPpR8XIYQQQgghhBBCCCGEEEIIIYQQQui99xd9MndVczNj5wAAAABJRU5ErkJggg==',
      questionsList: flutterDartQuestions,
    ),
    CategoryModel(
      title: 'Sports',
      imageUrl:
          'data:image/jpeg;base64,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',
      questionsList: sportsQuestions,
    ),
    CategoryModel(
      title: 'Chemistry',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHkg4_O-btZOjyPPbgeVHhGIzgPnu0S3Ha4QSRefwrg6vhIr3C1yzgX46sp4s8-SiTFGk&usqp=CAU',
      questionsList: chemistryQuestions,
    ),
    CategoryModel(
      title: 'Maths',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaTjU7XzPs_XjcbHta4X1ITgJ6ufsmPYqTq8qri2jKdROIk2UvNQxWM2lgHMH4iB6oHl0&usqp=CAU',
      questionsList: mathQuestions,
    ),
  ];

  static const List<QuestionModel> flutterDartQuestions = [
    QuestionModel(
      question: 'What is Flutter?',
      options: [
        'A programming language',
        'A UI toolkit/framework',
        'A database management system',
        'A cloud computing service'
      ],
      correctAnswerIndex: 1,
    ),
    QuestionModel(
      question:
          'Which programming language is used for Flutter app development?',
      options: ['Java', 'Dart', 'Python', 'Swift'],
      correctAnswerIndex: 1,
    ),
    QuestionModel(
      question: 'What is the entry point of a Flutter app?',
      options: ['main()', 'start()', 'run()'],
      correctAnswerIndex: 0,
    ),
    QuestionModel(
      question: 'What is the main advantage of Flutter?',
      options: [
        'Native performance',
        'Platform-specific code',
        'Limited customization options',
        'Requires separate development for each platform'
      ],
      correctAnswerIndex: 0,
    ),
    QuestionModel(
      question: 'Which IDE is commonly used for Flutter development?',
      options: ['Eclipse', 'Visual Studio Code', 'NetBeans', 'Xcode'],
      correctAnswerIndex: 1,
    ),
    QuestionModel(
      question: 'What does the "hot reload" feature in Flutter do?',
      options: [
        'Restart the app completely',
        'Compile the app from scratch',
        'Reloads the app without losing its current state',
        'Updates the app\'s UI only'
      ],
      correctAnswerIndex: 2,
    ),
    QuestionModel(
      question:
          'Which widget is used for building the main structure of a Flutter app?',
      options: ['Container', 'Column', 'Row', 'Scaffold'],
      correctAnswerIndex: 3,
    ),
    QuestionModel(
      question:
          'What is the purpose of the initState() method in a Flutter StatefulWidget?',
      options: [
        'To initialize the state of the widget',
        'To build the UI of the widget',
        'To update the UI of the widget',
        'To dispose of resources used by the widget'
      ],
      correctAnswerIndex: 0,
    ),
    QuestionModel(
      question: 'What is the purpose of the setState() method in Flutter?',
      options: [
        'To update the UI of the widget',
        'To initialize the state of the widget',
        'To dispose of resources used by the widget',
        'To build the UI of the widget'
      ],
      correctAnswerIndex: 0,
    ),
    QuestionModel(
      question: 'Which package is commonly used for HTTP requests in Flutter?',
      options: ['http', 'dart:io', 'network', 'flutter_http'],
      correctAnswerIndex: 0,
    ),
  ];

  // Sport Questions
  static const List<QuestionModel> sportsQuestions = [
    QuestionModel(
      question: "Which country won the FIFA World Cup in 2018?",
      options: ["France", "Brazil", "Germany"],
      correctAnswerIndex: 0,
    ),
    QuestionModel(
      question: "Who holds the record for the most Grand Slam tennis titles?",
      options: [
        "Serena Williams",
        "Roger Federer",
        "Rafael Nadal",
        "Novak Djokovic"
      ],
      correctAnswerIndex: 1,
    ),
    QuestionModel(
      question: "In which sport is the Ryder Cup contested?",
      options: ["Golf", "Tennis"],
      correctAnswerIndex: 0,
    ),
    QuestionModel(
      question: "Which team has won the most NBA championships?",
      options: ["Los Angeles Lakers", "Chicago Bulls"],
      correctAnswerIndex: 0,
    ),
    QuestionModel(
      question: "Who won the 2019 Formula 1 World Championship?",
      options: ["Lewis Hamilton", "Sebastian Vettel", "Max Verstappen"],
      correctAnswerIndex: 0,
    ),
    QuestionModel(
      question: "What is the national sport of Japan?",
      options: ["Sumo Wrestling", "Karate", "Judo", "Baseball"],
      correctAnswerIndex: 3,
    ),
    QuestionModel(
      question:
          "Which country has won the most Olympic gold medals in athletics?",
      options: ["USA", "China", "Jamaica", "Russia", "Kenya"],
      correctAnswerIndex: 0,
    ),
    QuestionModel(
      question: "Who won the FIFA Women's World Cup in 2019?",
      options: ["USA", "Germany", "Sweden"],
      correctAnswerIndex: 0,
    ),
    QuestionModel(
      question: "In what year did cricket's Indian Premier League (IPL) begin?",
      options: ["2008", "2010", "2012", "2014"],
      correctAnswerIndex: 0,
    ),
    QuestionModel(
      question: "Which city hosted the 2016 Summer Olympics?",
      options: ["Rio de Janeiro", "London", "Beijing", "Tokyo"],
      correctAnswerIndex: 0,
    ),
  ];

  static const List<QuestionModel> chemistryQuestions = [
    QuestionModel(
      question: "What is the chemical symbol for gold?",
      options: ["Au", "Ag", "Fe", "Cu"],
      correctAnswerIndex: 0,
    ),
    QuestionModel(
      question: "What is the lightest element?",
      options: ["Oxygen", "Hydrogen"],
      correctAnswerIndex: 1,
    ),
    QuestionModel(
      question: "Which gas is produced during photosynthesis?",
      options: ["Nitrogen", "Oxygen", "Carbon Dioxide"],
      correctAnswerIndex: 1,
    ),
    QuestionModel(
      question: "What is the pH of pure water at room temperature?",
      options: ["5", "7", "10"],
      correctAnswerIndex: 1,
    ),
    QuestionModel(
      question: "What is the chemical formula for water?",
      options: ["CO2", "NaCl", "O2", "H2O"],
      correctAnswerIndex: 3,
    ),
    QuestionModel(
      question: "Which element has the atomic number 6?",
      options: ["Carbon", "Oxygen", "Nitrogen", "Hydrogen"],
      correctAnswerIndex: 0,
    ),
    QuestionModel(
      question:
          "What is the process of converting a solid directly into a gas called?",
      options: ["Evaporation", "Condensation", "Sublimation"],
      correctAnswerIndex: 2,
    ),
    QuestionModel(
      question: "What is the main component of natural gas?",
      options: ["Ethane", "Propane", "Butane", "Methane"],
      correctAnswerIndex: 3,
    ),
    QuestionModel(
      question: "Which gas makes up the majority of Earth's atmosphere?",
      options: ["Oxygen", "Carbon Dioxide", "Helium", "Nitrogen"],
      correctAnswerIndex: 3,
    ),
    QuestionModel(
      question: "What is the chemical symbol for sodium?",
      options: ["Mg", "Na", "K", "Ca"],
      correctAnswerIndex: 1,
    ),
  ];

  static const List<QuestionModel> mathQuestions = [
    QuestionModel(
      question: "What is the result of 2 + 2 * 3?",
      options: ["6", "8", "10"],
      correctAnswerIndex: 1,
    ),
    QuestionModel(
      question: "What is the square root of 25?",
      options: ["5", "10", "15"],
      correctAnswerIndex: 0,
    ),
    QuestionModel(
      question: "What is the value of pi (π) correct to two decimal places?",
      options: ["3.14", "3.141", "3.142"],
      correctAnswerIndex: 0,
    ),
    QuestionModel(
      question: "What is the sum of the angles in a triangle?",
      options: ["90 degrees", "180 degrees", "360 degrees"],
      correctAnswerIndex: 1,
    ),
    QuestionModel(
      question: "What is the value of log₁₀100?",
      options: ["1", "2", "3"],
      correctAnswerIndex: 2,
    ),
    QuestionModel(
      question:
          "What is the next number in the Fibonacci sequence: 1, 1, 2, 3, 5, ...?",
      options: ["6", "7", "8"],
      correctAnswerIndex: 2,
    ),
    QuestionModel(
      question: "What is the circumference of a circle with diameter 10?",
      options: ["10π", "5π", "20π"],
      correctAnswerIndex: 2,
    ),
    QuestionModel(
      question: "What is the value of 3²?",
      options: ["6", "9", "12"],
      correctAnswerIndex: 1,
    ),
    QuestionModel(
      question: "What is the sum of the first 10 positive integers?",
      options: ["45", "55", "65"],
      correctAnswerIndex: 1,
    ),
    QuestionModel(
      question: "What is the result of 10 ÷ 0?",
      options: ["0", "10", "Undefined"],
      correctAnswerIndex: 2,
    ),
  ];
}
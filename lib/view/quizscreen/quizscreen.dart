
import 'package:flutter/material.dart';
import 'package:simplequizapp/common/widget/button.dart';
import 'package:simplequizapp/model/categorymodel.dart';
import 'package:simplequizapp/model/questionmodel.dart';
import 'package:simplequizapp/view/quizscreen/category/widgets/option.dart';
import 'package:simplequizapp/view/result/result.dart';


class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  List<QuestionModel> get questionsList => widget.categoryModel.questionsList;

  int correctAnswers = 0;
  int wrongAnswers = 0;
  int? selectedAnswerIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(
            child: Text(
              '${currentQuestionIndex + 1}/${questionsList.length}',
              style: const TextStyle(color: Colors.blue),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                questionsList[currentQuestionIndex].question,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 40),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => OptionsCard(
                isSelected: selectedAnswerIndex == index,
                borderColor: buildColor(index),
                onTap: selectedAnswerIndex != null
                    ? null
                    : () {
                        setState(() {
                          selectedAnswerIndex = index;
                          if (selectedAnswerIndex ==
                              questionsList[currentQuestionIndex]
                                  .correctAnswerIndex) {
                            correctAnswers++;
                          } else {
                            wrongAnswers++;
                          }
                        });
                      },
                optionLabel: questionsList[currentQuestionIndex].options[index],
                icon: buildIcon(index),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: questionsList[currentQuestionIndex].options.length,
            ),
            const SizedBox(height: 30),
            CustomButton(
              isSkip: currentQuestionIndex != questionsList.length - 1 &&
                  selectedAnswerIndex == null,
              label: currentQuestionIndex == questionsList.length - 1
                  ? 'Finish'
                  : selectedAnswerIndex == null
                      ? 'Skip'
                      : 'Next',
              onTap: () async {
                if (currentQuestionIndex < questionsList.length - 1) {
                  setState(() {
                    selectedAnswerIndex = null;
                    currentQuestionIndex++;
                  });
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsScreen(
                        categoryModel: widget.categoryModel,
                        correctAnswerCount: correctAnswers,
                        wrongAnswersCount: wrongAnswers,
                        totalQuestionCount: questionsList.length,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Color buildColor(int index) {
    if ((selectedAnswerIndex != null &&
        index == questionsList[currentQuestionIndex].correctAnswerIndex)) {
      return Colors.green;
    } else if (selectedAnswerIndex != index) {
      return Colors.white70;
    } else {
      return Colors.red;
    }

   
  }

  IconData? buildIcon(int index) {
    if ((selectedAnswerIndex != null &&
        index == questionsList[currentQuestionIndex].correctAnswerIndex)) {
      return Icons.done_rounded;
    } else if (selectedAnswerIndex == index) {
      return Icons.close_rounded;
    }
    return null;
  }
}

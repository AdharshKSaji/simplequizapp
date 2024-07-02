import 'package:flutter/material.dart';

import 'package:simplequizapp/model/categorymodel.dart';
import 'package:simplequizapp/view/core/constants/colorconstants.dart';
import 'package:simplequizapp/view/quizscreen/quizscreen.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.correctAnswerCount,
    required this.totalQuestionCount,
    required this.wrongAnswersCount,
    required this.categoryModel,
  });

  final int correctAnswerCount;
  final int wrongAnswersCount;
  final int totalQuestionCount;
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    final marksPercentage = correctAnswerCount / totalQuestionCount * 100;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getMessage(marksPercentage),
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              '${marksPercentage.round()}% Score',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Colors.green,
                  ),
            ),
            const SizedBox(height: 20),
            Text(
              'Correct Answers: $correctAnswerCount',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Wrong Answers: $wrongAnswersCount',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Skipped Questions: ${totalQuestionCount - correctAnswerCount - wrongAnswersCount}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        QuizScreen(categoryModel: categoryModel),
                  ),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                decoration: BoxDecoration(
                  color: ColorConstants.primaryAmber,
                  border: Border.all(color: ColorConstants.primaryWhite),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Restart',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go to Home'))
          ],
        ),
      ),
    );
  }

  String getMessage(double marksPercentage) {
    if (marksPercentage == 100) {
      return 'Outstanding!';
    } else if (marksPercentage >= 90) {
      return 'Congrats!';
    } else if (marksPercentage >= 40) {
      return 'Good!';
    } else if (marksPercentage == 0) {
      return 'Oops!';
    }
    return 'Low Score';
  }
}

import 'package:simplequizapp/model/questionmodel.dart';

class CategoryModel {
  final String title;
  final String imageUrl;
  final List<QuestionModel> questionsList;

  const CategoryModel({
    required this.title,
    required this.imageUrl,
    required this.questionsList,
  });
}
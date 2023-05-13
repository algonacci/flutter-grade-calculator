import 'package:flutter/material.dart';
import 'package:flutter_grade_calculator/constants.dart';
import 'package:flutter_grade_calculator/data.dart';
import 'package:flutter_grade_calculator/model/lesson.dart';

class LessonList extends StatelessWidget {
  final Function onDismiss;
  const LessonList({required this.onDismiss, super.key});

  @override
  Widget build(BuildContext context) {
    List<Lesson> allLessons = DataHelper.allAddedLessons;
    return allLessons.isNotEmpty
        ? ListView.builder(
            itemCount: allLessons.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (value) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Constants.mainColor,
                        child: Text(
                          DataHelper.calculateAverage().toStringAsFixed(2),
                        ),
                      ),
                      title: Text(
                        allLessons[index].name,
                      ),
                      subtitle: Text(
                        '${allLessons[index].letterGrade} Grade Value, ${allLessons[index].credit} Credit Value',
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Center(
            child: Text(
              'Please enter a lesson',
              style: Constants.textStyle,
            ),
          );
  }
}

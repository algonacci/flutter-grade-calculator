import 'package:flutter/material.dart';
import 'package:flutter_grade_calculator/constants.dart';
import 'package:flutter_grade_calculator/data.dart';
import 'package:flutter_grade_calculator/lesson_list.dart';
import 'package:flutter_grade_calculator/model/lesson.dart';
import 'package:flutter_grade_calculator/show_average.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var formKey = GlobalKey<FormState>();
  double? selectedValue;
  double? selectedCredit;
  String? incomingLessonName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          Constants.title,
          style: Constants.textStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  // color: Colors.pink.shade300,
                  child: createForm(),
                ),
              ),
              Expanded(
                flex: 1,
                child: ShowAverage(
                  average: DataHelper.calculateAverage(),
                  numberOfLesson: DataHelper.allAddedLessons.length,
                ),
              ),
            ],
          ),
          Expanded(
            child: LessonList(
              onDismiss: (index) {
                DataHelper.allAddedLessons.removeAt(index);
                setState(() {});
                print('Deleted element is $index');
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget createForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: createTextFormField(),
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: createLetterGrade(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: createCredits(),
                ),
              ),
              IconButton(
                onPressed: addLessonAndCalculate(),
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Constants.mainColor,
                  size: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget createTextFormField() {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          incomingLessonName = value!;
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter a Lesson';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: 'Lesson',
        filled: true,
        fillColor: Constants.mainColor.shade100,
      ),
    );
  }

  Widget createLetterGrade() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Constants.mainColor.shade100.withOpacity(0.5),
        borderRadius: Constants.radius,
      ),
      child: DropdownButton<double>(
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value!;
          });
        },
        items: DataHelper.allLessonsLetter(),
      ),
    );
  }

  Widget createCredits() {
    return Container(
      decoration: BoxDecoration(
        color: Constants.mainColor.shade100.withOpacity(0.5),
        borderRadius: Constants.radius,
      ),
      child: DropdownButton<double>(
        value: selectedCredit,
        onChanged: (value) {
          setState(() {
            selectedCredit = value!;
          });
        },
        items: DataHelper.allCreditsList(),
      ),
    );
  }

  addLessonAndCalculate() {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (selectedValue != null &&
          selectedCredit != null &&
          incomingLessonName != null) {
        var addLesson = Lesson(
          name: incomingLessonName!,
          letterGrade: selectedValue!,
          credit: selectedCredit!,
        );
        DataHelper.addLesson(addLesson);
        DataHelper.calculateAverage();
      }
    }
  }
}

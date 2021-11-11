import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/data/model/test_request_model.dart';
import 'package:persona_application/data/services/my_firebase_store.dart';
import 'package:survey_kit/survey_kit.dart';

ValueNotifier<int> valueTest = ValueNotifier<int>(-1);

class Tests extends StatelessWidget {
  const Tests({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Align(
          alignment: Alignment.center,
          child: FutureBuilder<Task>(
            future: getSampleTask(),
            builder: (context, snapshot) {
              //async(snapshot)
              //async(snapshot)
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData &&
                  snapshot.data != null) {
                final task = snapshot.data!;
                return SurveyKit(
                  //Survey Widget
                  onResult: (SurveyResult result) async {
                    TestRequestModel requestModel =
                        TestRequestModel(mentalDisorders: []);
                    //old
                    requestModel.old =
                        result.results[1].results.first.result as int;
                    //medication
                    requestModel.medication = (result.results[2].results.first
                            .result as BooleanResult) ==
                        BooleanResult.POSITIVE;
                    //about
                    requestModel.about =
                        result.results[3].results.first.result as String;
                    //happinessLevel
                    requestModel.happinessLevel =
                        result.results[4].results.first.result as double;
                    //mentalDisorders
                    if ((result.results[5].results.first.result as List)
                        .isEmpty) {
                      requestModel.mentalDisorders = [];
                    } else {
                      (result.results[5].results.first.result as List)
                          .forEach((element) {
                        requestModel.mentalDisorders!
                            .add((element as TextChoice).value);
                      });
                    }
                    //tellAbout
                    requestModel.tellAbout = (result.results[6].results.first
                            .result as BooleanResult) ==
                        BooleanResult.POSITIVE;
                    //sadTime
                    requestModel.sadTime =
                        "${(result.results[7].results.first.result as TimeOfDay).hour}:${(result.results[7].results.first.result as TimeOfDay).minute}";

                    ;
                    //lastHoliday
                    requestModel.lastHoliday =
                        result.results[8].results.first.result as DateTime;

                    bool response =
                        await MyFireBaseStore().addStore(requestModel);
                    valueTest.value = response ? 0 : 1;
                  },

                  task: task,

                  themeData: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.fromSwatch(
                      primarySwatch: Colors.cyan,
                    ).copyWith(
                      onPrimary: Colors.white,
                    ),
                    primaryColor: Colors.cyan,
                    backgroundColor: Colors.white,
                    appBarTheme: const AppBarTheme(
                      color: Colors.white,
                      iconTheme: IconThemeData(
                        color: Colors.cyan,
                      ),
                    ),
                    iconTheme: const IconThemeData(
                      color: Colors.cyan,
                    ),
                    outlinedButtonTheme: OutlinedButtonThemeData(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          const Size(150.0, 60.0),
                        ),
                        side: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> state) {
                            if (state.contains(MaterialState.disabled)) {
                              return const BorderSide(
                                color: Colors.grey,
                              );
                            }
                            return const BorderSide(
                              color: Colors.cyan,
                            );
                          },
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        textStyle: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> state) {
                            if (state.contains(MaterialState.disabled)) {
                              return Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(
                                    color: Colors.grey,
                                  );
                            }
                            return Theme.of(context).textTheme.button?.copyWith(
                                  color: Colors.cyan,
                                );
                          },
                        ),
                      ),
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                          Theme.of(context).textTheme.button?.copyWith(
                                color: Colors.cyan,
                              ),
                        ),
                      ),
                    ),
                  ),
                );
              }
              //Navigator.of(context).maybePop();
              return const CircularProgressIndicator.adaptive();
            },
          ),
        ),
      ),
    );
  }

  Future<Task> getSampleTask() {
    var task = OrderedTask(
      id: TaskIdentifier(),
      steps: [
        InstructionStep(
          title: 'Welcome to the Persona Personality Survey',
          text: 'Get ready for the questions!',
          buttonText: 'Let\'s go!',
        ),
        QuestionStep(
          title: 'How old are you?',
          answerFormat: IntegerAnswerFormat(
            defaultValue: 25,
            hint: 'Please enter your age',
          ),
          isOptional: true,
        ),
        QuestionStep(
          title: 'Medication?',
          text: 'Are you using any medication',
          answerFormat: BooleanAnswerFormat(
            positiveAnswer: 'Yes',
            negativeAnswer: 'No',
            result: BooleanResult.POSITIVE,
          ),
        ),
        QuestionStep(
          title: 'Tell us about you',
          text:
              'Tell us about yourself and why you want to know your personality.',
          answerFormat: TextAnswerFormat(
            maxLines: 5,
            validationRegEx: "^(?!\s*\$).+",
          ),
        ),
        QuestionStep(
          title: 'Select your average happiness level in the last month.',
          answerFormat: ScaleAnswerFormat(
            step: 1,
            minimumValue: 1,
            maximumValue: 5,
            defaultValue: 3,
            minimumValueDescription: '1',
            maximumValueDescription: '5',
          ),
        ),
        QuestionStep(
          title: 'Known mental disorders',
          text: 'Do you have any mental disorders that we should be aware of?',
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Anxiety', value: 'Anxiety'),
              TextChoice(text: 'Depression', value: 'Depression'),
              TextChoice(text: 'Autism', value: 'Autism'),
              TextChoice(text: 'Schizophrenia', value: 'Schizophrenia'),
            ],
          ),
        ),
        QuestionStep(
          title: 'Done?',
          text: 'We are done, do you mind to tell us more about yourself?',
          answerFormat: BooleanAnswerFormat(
            positiveAnswer: 'Yes',
            negativeAnswer: 'No',
            result: BooleanResult.POSITIVE,
          ),
        ),
        QuestionStep(
          title: 'When did you feel sad the last time?',
          answerFormat: TimeAnswerFormat(
            defaultValue: TimeOfDay(
              hour: 12,
              minute: 0,
            ),
          ),
        ),
        QuestionStep(
          title: 'When was your last holiday?',
          answerFormat: DateAnswerFormat(
            minDate: DateTime.utc(1970),
            defaultDate: DateTime.now(),
            maxDate: DateTime.now(),
          ),
        ),
        CompletionStep(
          stepIdentifier: StepIdentifier(id: '321'),
          text: 'Thanks for taking the survey!',
          title: 'Done!',
          buttonText: 'Submit survey',
        ),
      ],
    );
    return Future.value(task);
  }
}

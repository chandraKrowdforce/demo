import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 4, text: 'Test text');

  test(
    'should be a subclass of NumberTrivia entity',
    () async {
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );
  group(
    'fromJson',
    () {
      test(
        'should return a valid model when the JSON number is an integer',
        () async {
          // arrange
          final Map<dynamic, dynamic> jsonMap =
              json.decode(fixture('trivia.json'));
          // act
          final result = NumberTriviaModel.fromJson(jsonMap);
          print(result.number);
          // assert
          expect(result, tNumberTriviaModel);
        },
      );

      test(
        'should return a valid model when the JSON number is regarded as a double',
        () async {
          // arrange
          final Map<dynamic, dynamic> jsonMap =
              json.decode(fixture('trivia_double.json'));
          // act
          final result = NumberTriviaModel.fromJson(jsonMap);
          // assert
          expect(result, tNumberTriviaModel);
        },
      );

      group(
        'toJson',
        () {
          test(
            'should return a JSON map containing the proper data',
            () async {
              // act
              final result = tNumberTriviaModel.toJson();
              // assert
              final expectedJsonMap = {
                "text": "Test text",
                "number": 4,
              };
              expect(result, expectedJsonMap);
            },
          );
        },
      );
    },
  );
}

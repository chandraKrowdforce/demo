import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repositories.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

class MockNumberTriviaRepositories extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia useCase;
  MockNumberTriviaRepositories mockNumberTriviaRepositories;

  setUp(() {
    mockNumberTriviaRepositories = MockNumberTriviaRepositories();
    useCase = GetConcreteNumberTrivia(mockNumberTriviaRepositories);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test('should get trivia for the number from the repository', () async {
    when(mockNumberTriviaRepositories.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => Right(tNumberTrivia));

    final result = await useCase(Params(number: tNumber));
    // UseCase should simply return whatever was returned from the Repository
    expect(result, Right(tNumberTrivia));

    // Verify that the method has been called on the Repository
    verify(mockNumberTriviaRepositories.getConcreteNumberTrivia(tNumber));

    // Only the above method should be called and nothing more.
    verifyNoMoreInteractions(mockNumberTriviaRepositories);
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:challenge/home/presenter/home_cubit.dart';
import 'package:challenge/home/presenter/home_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

void main() {
  group('HomeCubit', () {
    late MockHomeCubit mockHomeCubit;

    setUp(() {
      mockHomeCubit = MockHomeCubit();
    });

    test('fetchToDosList is called', () {
      when(() => mockHomeCubit.fetchToDosList()).thenAnswer((_) async => []);

      mockHomeCubit.fetchToDosList();

      verify(() => mockHomeCubit.fetchToDosList()).called(1);
    });
  });
}

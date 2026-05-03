import 'package:equatable/equatable.dart';
import 'package:minesweeper/domain/entity/game_field.dart';

class GameAreaState extends Equatable {
  final bool isLoading;
  final bool hasError;
  final String? errorMessage;
  final GameField field;
  final bool isFirstTap;

  const GameAreaState({
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage,
    required this.field,
    this.isFirstTap = true,
  });

  // Factory для начального состояния
  factory GameAreaState.initial() {
    return GameAreaState(isLoading: true, hasError: false, errorMessage: null, field: GameField.empty());
  }

  // Метод для копирования состояния с изменениями
  GameAreaState copyWith({bool? isLoading, bool? hasError, String? errorMessage, GameField? field}) {
    return GameAreaState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      field: field ?? this.field,
    );
  }

  @override
  List<Object?> get props => [isLoading, hasError, errorMessage, field];
}

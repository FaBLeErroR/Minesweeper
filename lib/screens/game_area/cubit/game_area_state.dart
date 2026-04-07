import 'package:equatable/equatable.dart';

class GameAreaState extends Equatable {
  final bool isLoading;
  final bool hasError;
  final String? errorMessage;

  const GameAreaState({this.isLoading = false, this.hasError = false, this.errorMessage});

  // Factory для начального состояния
  factory GameAreaState.initial() {
    return const GameAreaState(isLoading: false, hasError: false, errorMessage: null);
  }

  // Метод для копирования состояния с изменениями
  GameAreaState copyWith({bool? isLoading, bool? hasError, String? errorMessage}) {
    return GameAreaState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, hasError, errorMessage];
}

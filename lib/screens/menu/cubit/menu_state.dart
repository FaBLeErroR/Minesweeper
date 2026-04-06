import 'package:equatable/equatable.dart';

class MenuState extends Equatable {
  final bool isLoading;
  final bool hasError;
  final String? errorMessage;

  const MenuState({this.isLoading = false, this.hasError = false, this.errorMessage});

  // Factory для начального состояния
  factory MenuState.initial() {
    return const MenuState(isLoading: false, hasError: false, errorMessage: null);
  }

  // Метод для копирования состояния с изменениями
  MenuState copyWith({bool? isLoading, bool? hasError, String? errorMessage}) {
    return MenuState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, hasError, errorMessage];
}

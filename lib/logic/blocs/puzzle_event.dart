part of 'puzzle_bloc.dart';

sealed class PuzzleEvent{
  const PuzzleEvent();

}

class TileTapped extends PuzzleEvent {
  final int tileIndex;

  const TileTapped(this.tileIndex);
}

class RestartEvent extends PuzzleEvent{}

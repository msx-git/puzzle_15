part of 'puzzle_bloc.dart';

sealed class PuzzleState {
  final Puzzle puzzle;

  const PuzzleState(this.puzzle);
}

class PuzzleInitial extends PuzzleState {
  const PuzzleInitial(super.puzzle);
}

class PuzzleUpdated extends PuzzleState {
  const PuzzleUpdated(super.puzzle);
}

class PuzzleSolved extends PuzzleState {
  const PuzzleSolved(super.puzzle);
}

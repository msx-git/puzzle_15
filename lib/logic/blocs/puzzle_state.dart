part of 'puzzle_bloc.dart';

sealed class PuzzleState {
  final Puzzle puzzle;
  int moves;
   PuzzleState(this.puzzle, this.moves);
}

class PuzzleInitial extends PuzzleState {
   PuzzleInitial(super.puzzle, super.moves);
}

class PuzzleUpdated extends PuzzleState {
   PuzzleUpdated(super.puzzle, super.moves);
}

class PuzzleSolved extends PuzzleState {
   PuzzleSolved(super.puzzle, super.moves);
}

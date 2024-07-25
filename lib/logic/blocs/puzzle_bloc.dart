import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/puzzle.dart';

part 'puzzle_event.dart';

part 'puzzle_state.dart';

class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
  PuzzleBloc() : super(PuzzleInitial(Puzzle(), 0)) {
    on<TileTapped>(_onTileTapped);
    on<RestartEvent>(_onRestart);
  }

  void _onRestart(event, emit) {
    emit(PuzzleInitial(state.puzzle, state.moves));
    state.puzzle.tiles!.shuffle();
    state.moves = 0;
    emit(PuzzleUpdated(state.puzzle, state.moves));
  }

  void _onTileTapped(TileTapped event, Emitter<PuzzleState> emit) {
    final puzzle = state.puzzle;
    puzzle.moveTile(event.tileIndex);
    state.moves++;
    print("MOVES: ${state.moves}");
    print(state.puzzle.isSolved());
    if (puzzle.isSolved()) {
      emit(PuzzleSolved(puzzle, state.moves));
    } else {
      emit(PuzzleUpdated(
        Puzzle()..tiles = List.from(puzzle.tiles as Iterable),
        state.moves,
      ));
    }
  }
}

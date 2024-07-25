import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/puzzle.dart';

part 'puzzle_event.dart';

part 'puzzle_state.dart';

class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
  PuzzleBloc() : super(PuzzleInitial(Puzzle())) {
    on<TileTapped>(_onTileTapped);
    on<RestartEvent>(_onRestart);
  }

  void _onRestart(event, emit){
    emit(PuzzleInitial(state.puzzle));
    state.puzzle.tiles!.shuffle();
    emit(PuzzleUpdated(state.puzzle));
  }

  void _onTileTapped(TileTapped event, Emitter<PuzzleState> emit) {
    final puzzle = state.puzzle;
    puzzle.moveTile(event.tileIndex);
    print(state.puzzle.isSolved());
    if (puzzle.isSolved()) {
      emit(PuzzleSolved(puzzle));
    } else {
      emit(
          PuzzleUpdated(Puzzle()..tiles = List.from(puzzle.tiles as Iterable)));
    }
  }
}

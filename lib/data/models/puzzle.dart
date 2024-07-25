class Puzzle {
  List<int>? tiles;

  Puzzle() {
    tiles = List.generate(16, (index) => index);
  }

  List<int> get tilesInOrder => List.generate(16, (index) => index);

  bool isSolved() {
    print("tilesO: $tilesInOrder");
    print("tilesU: $tiles");
    for(int i =0; i<tiles!.length; i++){
      if(tiles![i] != tilesInOrder[i]){
        return false;
      }
    }
    return true;
  }

  void moveTile(int tileIndex) {
    final emptyIndex = tiles!.indexOf(15);
    final validMoves = [
      emptyIndex - 4, // move up
      emptyIndex + 4, // move down
      if (emptyIndex % 4 != 0) emptyIndex - 1, // move left
      if (emptyIndex % 4 != 3) emptyIndex + 1, // move right
    ];
    if (validMoves.contains(tileIndex)) {
      tiles![emptyIndex] = tiles![tileIndex];
      tiles![tileIndex] = 15;
    }
  }
}

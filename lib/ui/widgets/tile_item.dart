import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../logic/blocs/puzzle_bloc.dart';

class TileItem extends StatelessWidget {
  const TileItem({super.key, required this.tile, required this.index});

  final int tile;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PuzzleBloc>().add(TileTapped(index));
      },
      child: tile == 16
          ? const SizedBox()
          : Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset('assets/images/tile.svg'),
                Text(
                  "$tile",
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
    );
  }
}

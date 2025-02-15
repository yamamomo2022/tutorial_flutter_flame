import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';

void main() {
  final game = MyGame();
  runApp(GameWidget(game: game));
}

class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    final square = RectangleComponent(
      position: Vector2(100, 100),
      size: Vector2(50, 50),
      paint: Paint()..color = Colors.blue,
    );
    add(square);
  }
}

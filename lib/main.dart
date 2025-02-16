import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'dart:math';

void main() {
  final game = MyGame();
  runApp(GameWidget(game: game));
}

class MyGame extends FlameGame with TapDetector {
  late Player player;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(Background()); // Add background
    player = Player()
      ..position = Vector2(size.x / 2, size.y - 50)
      ..size = Vector2(50, 50);
    add(player);
  }

  @override
  void onTap() {
    final bullet = Bullet()
      ..position = player.position.clone()
      ..size = Vector2(5, 10);
    add(bullet);
  }
}

class Player extends PositionComponent {
  @override
  Future<void> onLoad() async {
    super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()..color = Colors.blue;
    canvas.drawRect(size.toRect(), paint);
  }
}

class Bullet extends PositionComponent with HasGameRef<MyGame> {
  double time = 0;

  @override
  Future<void> onLoad() async {
    super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()..color = Colors.red;
    canvas.drawRect(size.toRect(), paint);
  }

  @override
  void update(double dt) {
    super.update(dt);
    time += dt;
    position.y -= 300 * dt;
    position.x += 50 *
        sin(time *
            5); // Adjust the multiplier to control the frequency and amplitude
    if (position.y < 0) {
      removeFromParent();
    }
  }
}

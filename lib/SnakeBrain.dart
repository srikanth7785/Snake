enum Direction{UP,DOWN,LEFT,RIGHT}

class SnakeBrain{

  List<Cell> _body = [ //Initial body
    Cell(0,5),
    Cell(1,5),
    Cell(2,5),
    Cell(3,5),
    Cell(4,5),
    Cell(5,5),
  ];

  final _len = 11;
  bool? _moving;
  Direction _currentDirection = Direction.RIGHT;
  int _headX = 5;
  int _headY = 5;

  SnakeBrain(){
    _moving = false;
  }

  getBody(){
    return _body;
  }

  getCurrentDirection(){
    return _currentDirection;
  }

  getOppositeDirection(Direction direction){
    Direction oppositeDirection;
    switch (direction) {
      case Direction.UP:
        oppositeDirection = Direction.DOWN;
        break;
      case Direction.DOWN:
        oppositeDirection = Direction.UP;
        break;
      case Direction.LEFT:
        oppositeDirection = Direction.RIGHT;
        break;
      case Direction.RIGHT:
        oppositeDirection = Direction.LEFT;
        break;
      default:
        //doesn't matter whatever direction is assigned here, as `default` will never encounter.
        oppositeDirection = Direction.LEFT; 
    }
    return oppositeDirection;
  }

  setCurrentDirection(Direction direction){
    _currentDirection = direction;
  }

  start(){
    _moving = true;
  }

  stop(){
    _moving = false;
  }

  ismoving(){
    return _moving;
  }

  _addHeadRemoveTail(){
    _body.removeAt(0);
    _body.add(Cell(_headX,_headY));
  }

  up(){
    _headY= (_headY-1)%_len;
    _addHeadRemoveTail();
  }

  down(){
    _headY = (_headY+1)%_len;
    _addHeadRemoveTail();
  }

  left(){
    _headX = _headX == 0 ? 10 : _headX-1;
    _addHeadRemoveTail();
  }

  right(){
    _headX = _headX == 10 ? 0 : _headX+1;
    _addHeadRemoveTail();
  }

}





class Cell{
  final int x,y;
  Cell(this.x,this.y);

  int get hashCode => x.hashCode ^ y.hashCode;

  bool operator ==(other) => other is Cell && other.x == this.x && other.y == this.y;
}
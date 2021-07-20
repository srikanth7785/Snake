enum Direction{UP,DOWN,LEFT,RIGHT}

class SnakeBrain{
  final _len = 11;
  bool? _moving;
  Direction _currentDirection = Direction.RIGHT;
  int _x = 5;
  int _y = 5;

  List<List<bool>> _bools = List<List<bool>>.generate(11, (i) => List<bool>.generate(11, (j) => false));

  SnakeBrain(){
    _bools[5][5] = true;
    _moving = false;
  }

  getX(){
    return _x;
  }

  getY(){
    return _y;
  }

  getCurrentDirection(){
    return _currentDirection;
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

  up(){
    _bools[_x][_y] = false;
    _y= (_y-1)%_len;
    _bools[_x][_y] = true;
  }

  down(){
    _bools[_x][_y] = false;
    _y = (_y+1)%_len;
    _bools[_x][_y] = true;
  }

  left(){
    _bools[_x][_y] = false;
    _x = _x == 0 ? 10 : _x-1;
    _bools[_x][_y] = true;
  }

  right(){
    _bools[_x][_y] = false;
    _x = _x == 10 ? 0 : _x+1;
    _bools[_x][_y] = true;
  }


  bool checkState(int i){
    return _bools[i~/_len][i%_len];
  }

  toggleState(int i){
    _bools[i~/_len][i%_len] = !_bools[i~/_len][i%_len];
  }
}
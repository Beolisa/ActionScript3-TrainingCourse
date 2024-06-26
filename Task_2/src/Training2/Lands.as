package Training2 {
    public class Lands extends LandPlot {
        private var _lands:Array;

        public function Lands() {
            _lands = [];
        }

        public function get lands():Array
        {
            return _lands;
        }

        public function addLand(land:LandPlot):void {
            _lands.push(land);
        }

        public function changeSideAtIndex(index:int, value:Array):void {
            if (index >= 0 && index < this._lands.length) 
            {
                _lands[index].sides = value;

                // Notify the land owner and neighbors
                _lands[index].changeSides(_lands[index].sides, LandOwner.TYPE_ME, _lands[index].landOwner.name);
            } 
            else 
            {
                trace("Index out of bounds");
            }

            for (var i:int = 0; i < _lands.length; i++) 
            {
                if (i != index)
                {
                    //Case 1: 1 mảnh đất liền kề
                    if (index == 0 || index == _lands.length - 1)
                    {
                        _lands[i + 1].changeSides(_lands[index].sides, LandOwner.TYPE_NEBOR, _lands[index].landOwner.name);
                        break;
                    }
                    //Case 2: 2 mảnh đất 2 bên
                    else
                    {
                        _lands[i + 1].changeSides(_lands[index].sides, LandOwner.TYPE_NEBOR, _lands[index].landOwner.name);
                        _lands[i - 1].changeSides(_lands[index].sides, LandOwner.TYPE_NEBOR, _lands[index].landOwner.name);
                        break;
                        
                    }
                }
            }
        }
    }
}

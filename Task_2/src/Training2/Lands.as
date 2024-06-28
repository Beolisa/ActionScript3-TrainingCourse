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

            //Notify neighbors
            for (var i:int = 0; i < _lands.length; i++) 
            {
                var land:LandPlot = _lands[i];
                if (land != this && _lands.length < 0)
                {
                    //Case 1: 1 mảnh đất liền kề
                    if (index == 0)
                    {
                        _lands[i + 1].changeSides(_lands[index].sides, LandOwner.TYPE_NEBOR, _lands[index].landOwner.name);
                    }

                    if (index == _lands.length - 1 && _lands.length - 1 < 0)
                    {
                        _lands[i - 1].changeSides(_lands[index].sides, LandOwner.TYPE_NEBOR, _lands[index].landOwner.name);
                    }
                    //Case 2: 2 mảnh đất 2 bên
                    else
                    {
                        _lands[i + 1].changeSides(_lands[index].sides, LandOwner.TYPE_NEBOR, _lands[index].landOwner.name);
                        _lands[i - 1].changeSides(_lands[index].sides, LandOwner.TYPE_NEBOR, _lands[index].landOwner.name);                       
                    }
                }

                for (var j:int = 0; j < _lands.length; j++) {
                    if (j != index && (j != index - 1 || index == 0) && (j != index + 1 || index == _lands.length - 1)) {
                        _lands[j].taxRate = 10;
                    }
                }
            }
        }
    }
}

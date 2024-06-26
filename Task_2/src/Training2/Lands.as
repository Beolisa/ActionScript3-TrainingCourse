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

                trace(_lands[index].sides);
                // Notify the land owner and neighbors
                _lands[index].changeSides(_lands[index].sides);
            } 
            else 
            {
                trace("Index out of bounds");
            }

            notifyNeighbors(index);
        }

        private function notifyNeighbors(index:int):void 
        {
            for (var i:int = 0; i < _lands.length; i++) {
                if (i != index)
                {
                    trace("Land plot " + _lands[i].plotID + " has been notify that land with index " + index + " has been changed to " + _lands[index].sides);
                }
            }
        }
    }
}

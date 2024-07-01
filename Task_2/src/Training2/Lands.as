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

            notifyNeighbor(index);

            //Update taxRate for the following lands
            // var nRate:int = LandTax.getInstance().getChangeCount;
            // trace("nRate: " + nRate);

            if (index == 0)
            {
                _lands[index + 1].updateTaxRate();
            }
            else if (index == _lands.length - 1 && _lands.length > 1)
            {
                _lands[index - 1].updateTaxRate();
            }
            //Case 2: 2 mảnh đất 2 bên
            else 
            {
                _lands[index + 1].updateTaxRate();
                _lands[index - 1].updateTaxRate();
            }
            
        }

        public function notifyNeighbor(index:int):void
        {
            //Case 1: 1 mảnh đất liền kề
            if (index == 0)
            {
                _lands[index + 1].landOwner.onLandSizeChanged(_lands[index].sides, _lands[index].plotID, LandOwner.TYPE_NEBOR, _lands[index].landOwner.name)
            }
            else if (index == _lands.length - 1 && _lands.length > 1)
            {
                _lands[index - 1].landOwner.onLandSizeChanged(_lands[index].sides, _lands[index].plotID, LandOwner.TYPE_NEBOR, _lands[index].landOwner.name)
            }
            //Case 2: 2 mảnh đất 2 bên
            else 
            {
                _lands[index + 1].landOwner.onLandSizeChanged(_lands[index].sides, _lands[index].plotID, LandOwner.TYPE_NEBOR, _lands[index].landOwner.name)
                _lands[index - 1].landOwner.onLandSizeChanged(_lands[index].sides, _lands[index].plotID, LandOwner.TYPE_NEBOR, _lands[index].landOwner.name)
            }
        }

    }
}

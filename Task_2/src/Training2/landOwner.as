package Training2
{
    public class LandOwner implements LandChangeListener {
        private var _name:String;
        private var _lands:Array;

        //Constructor
        public function LandOwner() {
            _lands = new Array();
        }

        public function get name():String {
            return _name;
        }

        public function set name(ownerName:String):void 
        {
            _name = ownerName;
        }

        public function get lands():Array {
            return this._lands;
        }

        public function addLand(land:LandPlot):void {
            _lands.push(land);
            land.idx = this._lands.length;
        }
        
        public function onLandSizeChanged(values:Array, plotID:String):void {
            trace("Landowner " + _name + " has been notified of a land size change to " + values[0] + "x" + values[1]);
        }

        // public function onLandOwnerChanged(ownerName:String):void {
        //     trace("The new owner is " + ownerName);
        // }

        public function getNum():int { //Trả về số lượng mảnh đất mà 1 người chủ có thể sở hữu
            return _lands.length;
        }

        public function notifyTaxChange():void 
        {
            for each (var land:LandPlot in _lands) {
                land.updateTax();
            }
        }

        public function calTotalTax():Number 
        {
            var totalTax:Number = 0;
            for each (var land:LandPlot in _lands)
            {
                totalTax += land.calTax();
            }

            return totalTax
        }
    }
}
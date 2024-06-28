package Training2
{
    public class LandOwner implements LandChangeListener {
        public static var TYPE_ME:int = 1;
        public static var TYPE_NEBOR:int = 2;

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
        
        public function onLandSizeChanged(values:Array, plotID:String, typeNotify:int, ownerName:String):void {
            if(typeNotify == LandOwner.TYPE_ME)
            {
                trace("Landowner " + _name + " has been notified of a land size change to " + values[0] + "x" + values[1]);
                
            } else
            {
                trace("Neighbor " + _name + " has been notified that owner " + ownerName + "'s land " + values[0] + "x" + values[1]);
            }
        }

        // public function onLandOwnerChanged(ownerName:String):void {
        //     trace("The new owner is " + ownerName);
        // }

        public function onPurchaseRequest(buyer:LandOwner, land:LandPlot):void
        {
            if (this.name == null)
            {
                land.transferLand(buyer);
                trace("Land " + land.plotID + " has been sold to " + buyer.name);
                return;
            }

            trace(this.name + " received a purchase request from " + buyer.name + " for land plot " + land.plotID);

            if (Math.random() > 0.5)
            {
                trace(this.name + " agress to sell land plot " + land.plotID + " to " + buyer.name);
                land.transferLand(buyer);
            }
            else
            {
                trace(this.name + " refuse to sell land plot " + land.plotID);
            }
        }

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

        public function removeLand(land:LandPlot):void
        {
            var index:int = _lands.indexOf(land);
            if (index != -1)
            {
                _lands.splice(index, 1);
            }   
        }
    }
}

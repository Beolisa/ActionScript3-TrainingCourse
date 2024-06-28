package Training2
{
    public class LandPlot extends Shape 
    {
        private var _owner:LandOwner;
        public var idx:int = 0;
        private var taxRate:Number;
        private var _plotId:String;

        //Constructor
        public function LandPlot()
        {
            taxRate = LandTax.getInstance().currentTaxRate;
        }

        public function get getCurrentTaxRate():Number
        {
            return taxRate = LandTax.getInstance().currentTaxRate;
        }

        public function getName():String 
        {
            return _owner.name;
        }

        public function get landOwner():LandOwner
        {
            return _owner;
        }

        public function set landOwner(owner:LandOwner):void
        {
            _owner = owner;
            owner.addLand(this);
        }

        public function get plotID():String
        {
            return _plotId;
        }

        public function set plotID(plotID:String):void
        {
            _plotId = plotID;
        }

        public function changeSides(values:Array, type:int, ownerName:String):void 
        {
            this._sides = values;
            var rate:int = LandTax.getInstance().recordChange();
            _owner.onLandSizeChanged(_sides, _plotId, type, ownerName);
        }

        // public function changeOwnerNames(ownerName:String):void 
        // {
        //     _owner.name = ownerName;
        //     _owner.onLandOwnerChanged(ownerName);
        // }

        public function updateTax():void
        {
            var area:Number = _sides[0] * _sides[1];
            trace("Tax for land " + idx + ": " + calTax() + " per m2.");
        }

        private function updateTaxRate():void
        {
            taxRate = LandTax.getInstance().currentTaxRate;
        }

        public function calTax():Number 
        {
            var area:Number = _sides[0] * _sides[1];

            return area * taxRate;
        }

        public function transferLand(newOwner:LandOwner):void 
        {
            if (_owner)
            {
                _owner.removeLand(this);
            }

            newOwner.addLand(this);
        }

        public function requestPurchase(buyer:LandOwner):void
        {
            if (_owner) 
            {
                _owner.onPurchaseRequest(buyer, this);
            } else
            {
                trace("Invalid input.");
            }
        }
    }
}
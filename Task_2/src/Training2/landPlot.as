package Training2
{
    public class LandPlot extends Shape 
    {
        private var _owner:LandOwner;
        public var idx:int = 0;
        private var taxRate:Number;

        //Constructor
        public function LandPlot()
        {
            taxRate = LandTax.getInstance().currentTaxRate;
        }

        public function getName():String 
        {
            return _owner.name;
        }

        public function set landOwner(owner:LandOwner):void
        {
            _owner = owner;
            owner.addLand(this);
        }

        public function changeSides(values:Array):void 
        {
            this._sides = values;
            LandTax.getInstance().recordChange();
            _owner.onLandSizeChanged(_sides, this.idx);
            updateTax();
        }

        public function changeOwnerNames(ownerName:String):void 
        {
            _owner.name = ownerName;
            _owner.onLandOwnerChanged(ownerName);
        }

        public function updateTax():void
        {
            var area:Number = _sides[0] * _sides[1];
            var tax:Number = area * taxRate;
            trace("Tax for land " + idx + ": " + tax + " per m2.");
        }
    }
}
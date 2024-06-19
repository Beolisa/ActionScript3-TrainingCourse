package Training2
{
    public class LandPlot extends Shape {
        private var _owner:LandOwner;
        public var idx:int = 0;

        //Constructor
        public function LandPlot()
        {}

        public function getName():String 
        {
            return _owner.name;
        }

        public function set landOwner(owner:LandOwner):void
        {
            _owner = owner;
        }

        public function changeSides(values:Array):void 
        {
            this._sides = values;
            _owner.onLandSizeChanged(_sides);
        }

        public function changeOwnerNames(ownerName:String):void 
        {
            _owner.name = ownerName;
            _owner.onLandOwnerChanged(ownerName);
        }
    }
}
package Training2
{
    public class landPlot extends Shape {
        private var _owner:landOwner;

        //Constructor
        public function landPlot(values:Array, owner:landOwner)
        {   
            this._sides = values;
            _owner = owner;
        }

        override public function set sides(value:Array):void {
            super.sides = value;

            this.notifyOwner();
        }

        public function notifyOwner():void {
            if (_owner) {
                _owner.onLandSizeChanged(_sides);
            }
        }    
    }
}
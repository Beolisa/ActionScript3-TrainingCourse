package Training2
{
    public class LandPlot extends Shape
    {
        private var _owner:LandOwner;

        private var landArr:Array;

        // Constructor
        public function LandPlot()
        {
            landArr = new Array();
        }

        override public function set sides(value:Array):void
        {
            super.sides = value;

            this.notifyOwner();
        }

        public function addLand(land:Shape):void
        {
            // var arr1:Array = _sides;
            landArr.push(land);
            for (var i:int = 0; i < 4; i++)
            {
                var arr1:Array = landArr[i].arr;
            }

        }

        public function notifyOwner():void
        {
            _owner.onLandSizeChanged(_sides);
        }
    }
}
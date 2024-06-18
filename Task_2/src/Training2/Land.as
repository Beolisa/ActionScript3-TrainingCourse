package Training2
{
    public class Land extends Shape implements LandInterface
    {
        private var landArr:Array;

        // Constructor
        public function Land()
        {
            landArr = new Array();
        }

        override public function set sides(value:Array):void
        {
            super.sides = value;

            // this.notifyOwner();
        }

        public function addLand(land:Shape):void
        {
            // var arr1:Array = _sides;
            landArr.push(land);

        }

        public function on_size_change(arr:Array, slot:int):void
        {
            if (landArr.length >= slot)
            {
                var witdth:Number = landArr[slot].arr[0] ? landArr[slot].arr[0] : null;
                var height:Number = landArr[slot].arr[1] ? landArr[slot].arr[1] : null;
                if ((witdth && witdth != arr[0]) || (height && height != arr[1]))
                {
                    LandOwner.nhanThongBaoThayDoi(this);
                }
            }
        }

        // public function notifyOwner():void
        // {
        // _owner.onLandSizeChanged(_sides);
        // }
    }
}
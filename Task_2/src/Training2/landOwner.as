package Training2
{
    public class landOwner
    {
        private var _name:String;
        private var _lands:Array;

        // Constructor
        public function landOwner(name:String)
        {
            _name = name;
            _lands = [];
        }

        public function get lands():Array
        {
            return this._lands;
        }

        public function addLand(land:landPlot):void
        {
            _lands.push(land);
        }

        public function onLandSizeChanged(values:Array):void
        {
            trace("Landowner " + _name + " has been notified of a land size change to " + values[0] + "x" + values[1]);
        }

        public function get name():String
        {
            return _name;
        }

        public function getNum():int
        {
            // Trả về số lượng mảnh đất mà 1 người chủ có thể sở hữu
            return _lands.length;
        }

        public static function nhanThongBaoThayDoi(landPiece:Land):void
        {
            trace("Mảnh đất thay đổi kích thước...");
        }
    }
}
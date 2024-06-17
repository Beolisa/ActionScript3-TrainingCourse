package Training1 {
    public class Shape {
        protected var _sides:Array;
        protected var nArea:int;
        protected var nPeri:int;

        public function Shape() {}

        protected function checkLength(value: Array): void
        {
            if (value.length <= 2) 
                throw new Error("Invalid shape.");
        }

        protected function checkData(value: Array): void
        {
            for (var i:int; i < value.length; i++) {
                if (value[i] < 0) {
                    throw new Error("Values must be positive numbers.");
                }
            }
        }

        public function set sides(value:Array):void {
           this.checkData(value);
           this.checkLength(value);

            _sides = new Array();
            for (var i: int = 0; i < value.length; i++) {
                _sides.push(value[i]);
            }
            nPeri = 0;
            nArea = 0;
        }

        public function CalArea():int {
            if (nArea != 0) {
                nArea = 0;
            }
            
            var leng:int = _sides.length;
            var s:int = 0;
                        
            switch (leng) {
                case 3: // A triangle
                    s = (_sides[0] + _sides[1] + _sides[2]) / 2;
                    nArea = Math.sqrt(s * (s - _sides[0]) * (s - _sides[1]) * (s - _sides[2]));
                    break;

                case 4: // Any 4 - sided shapes
                    var a:int = _sides[0];
                    var b:int = _sides[1];
                    var c:int = _sides[2];
                    var d:int = _sides[3];
                    var angleAC:int;

                    s = (a + b + c + d) / 2; // Semiperimeter
                    
                    var angleACRad:int = angleAC * (Math.PI / 180); // Convert angle to radians
                    
                    nArea = Math.sqrt(
                        (s - a) * (s - b) * (s - c) * (s - d) - 
                        a * b * c * d * Math.cos(angleACRad / 2) * Math.cos(angleACRad / 2));

                    break;

                case 5: // A pentagon (using a simplified formula)
                    nArea = Math.floor(1.72 * Math.pow(_sides[0], 2));
                    break;

                default:    
                    throw new Error("Input an invalid shape.");
            }

            return nArea;
        }

        public function CalPerimeter():int {
            if (nPeri != 0) {
                nPeri = 0;
            }

            for each (var side:int in _sides) {
                nPeri += side;
            }

            return nPeri;
        }

        public function toString():String {
            return "Shape with " + _sides.length + " sides " + _sides;
        }

        public function getLength():int {
            return this._sides.length;
        }
    }
}
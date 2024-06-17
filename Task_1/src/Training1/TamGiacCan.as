package Training1
{
    public class TamGiacCan extends Shape {
        public function TamGiacCan() {
            super();
        }

        override protected function checkLength(value: Array):void //Only pass 2 sides 
        {
            if (value.length != 2) throw new Error("Invalid shape.");
        }

        override public function set sides(data:Array):void { //Only pass 2 values
            super.sides = data;

            _sides.push(data[0]);        
        }

        public function tinhCanhDay(sides:Array):int {
            return Math.sqrt(sides[0] * sides[0] - (sides[1] / 2) * (sides[1] / 2)) * 2;
        }

        override public function CalArea():int {
            if (nArea != 0) {
                nArea = 0;
            }

            var p:Number = (_sides[0] + _sides[1] + _sides[2]) / 2;
            nArea = Math.sqrt(p * (p - _sides[0]) * (p - _sides[1]) * (p - _sides[2]));
            return nArea;
        }

        override public function toString():String {
            return "Tam giac can - Sides: " + _sides;
        }
    }
}
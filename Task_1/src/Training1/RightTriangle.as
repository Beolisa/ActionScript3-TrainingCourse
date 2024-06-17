package Training1 
{ //Tam giác vuông
    public class RightTriangle extends Shape {             
        public function RightTriangle() {
            super();
        }

        override protected function checkLength(value: Array): void //Only pass 2 sides 
        {
            if (value.length != 2) throw new Error("Invalid shape.");
        }

        override public function set sides(data:Array):void { //Only pass 2 sides 
            super.sides = data;

            _sides.push(Math.sqrt(data[0] * data[0] + data[1] * data[1]))
        }

        override public function CalArea():int {
            nArea = 0;
            nArea = (_sides[0] * _sides[1]) / 2;
            return nArea;
        }

        override public function toString():String {
            return "RightTriangle - Side 1: " + _sides[0] + ", Side 2: " + _sides[1] + ", Side 3: " + _sides[2]; 
        }
    }
}
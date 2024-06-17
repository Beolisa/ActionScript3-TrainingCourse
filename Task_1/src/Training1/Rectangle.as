package Training1 {
    public class Rectangle extends Shape {
        public function Rectangle() {
            super();
        }

        override protected function checkLength(value: Array): void //Only pass 2 sides 
        {
            if (value.length != 2) throw new Error("Invalid shape.");
        }

        override public function CalArea():int {
            if (nArea != 0) {
                nArea = 0;
            }
            
            nArea = _sides[0] * _sides[1];
            return nArea;
        }

        override public function CalPerimeter():int {
            if (nPeri != 0) {
                nPeri = 0;
            }

            nPeri = (_sides[0] + _sides[1]) * 2
            return nPeri;
        }

        override public function toString():String {
            return "Rectangle - Width: " + _sides[0] + ", Height: " + _sides[1] + ", ";
        }
    }
}
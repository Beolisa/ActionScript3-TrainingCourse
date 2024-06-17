package Training1 {
    public class Square extends Shape {

        public function Square() {
            super();
        }

        override protected function checkLength(value: Array): void //Only pass 1 side
        {
            if (value.length != 1) throw new Error("Invalid shape.");
        }

        override public function CalArea():int {
            if (nArea != 0) {
                nArea = 0;
            }
            
            nArea = Math.pow(2, 4);
            return nArea;
        }

        override public function CalPerimeter():int {
            if (nPeri != 0) {
                nPeri = 0;
            }

            nPeri = _sides[0] * 4;

            return nPeri;
        }

        override public function toString():String {
            return "Square - Width: " + _sides;
        }
    }
}
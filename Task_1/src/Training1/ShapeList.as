package Training1 {
    import Training1.Shape;

    public class ShapeList {
        private var _shapes:Array;

        public function ShapeList() {
            _shapes = new Array();
        }

        public function get shapes():Array {
            return this._shapes;
        }

        public function addShape(shape:Shape):void {
            shapes.push(shape);
        }

        public function sortByArea():void {
            shapes.sort(areaComparison);
        }

        public function sortByPerimeter():void {
            shapes.sort(perimeterComparison);
        }

        private function areaComparison(a:Shape, b:Shape):Number {
            if (a.CalArea() < b.CalArea()) return -1;
            if (a.CalArea() > b.CalArea()) return 1;
            return 0;
        }

        private function perimeterComparison(a:Shape, b:Shape):Number {
            if (a.CalPerimeter() > b.CalPerimeter()) return -1;
            if (a.CalPerimeter() < b.CalPerimeter()) return 1;
            return 0;
        }

        public function printShapes():void {
            for (var i:int = 0; i < shapes.length; i++) {
                trace(i + 1 + "/ " + shapes[i].toString() + ", Area: " + shapes[i].CalArea() + ", Perimeter: " + shapes[i].CalPerimeter());
            }
        }

        public function getMax():Array {
            var res:Array = new Array(1); //Pos 0 is a max area, pos 1 is a max perimeter
            res[0] = Number.MIN_VALUE;
            res[1] = Number.MIN_VALUE;
            
            var displayArea:Array = new Array();
            var displayPerimeter:Array = new Array();
            var i:int = 0;

            for each (var shape:Shape in shapes) {
                var maxArea:int = shape.CalArea();
                var maxPeri:int = shape.CalPerimeter();

                displayArea[i] = maxArea;
                displayPerimeter[i] = maxPeri;
                i++;

                if (maxArea > res[0]) { //Fetch the max area
                    res[0] = maxArea;
                }

                if (maxPeri > res[1]) { //Fetch the max peri
                    res[1] = maxPeri;
                }
            }

            // trace(displayArea);
            // trace(displayPerimeter);
            return res;
        }

        public function getMin():Array {
            var res:Array = new Array(1); //Pos 0 is a min area, pos 1 is a min perimeter
            res[0] = Number.MAX_VALUE;
            res[1] = Number.MAX_VALUE;

            var displayArea:Array = new Array();
            var displayPerimeter:Array = new Array();
            var i:int = 0;

            for each (var shape:Shape in shapes) {
                var minArea:int = shape.CalArea();
                var minPeri:int = shape.CalPerimeter();

                displayArea[i] = minArea;
                displayPerimeter[i] = minPeri;
                i++;

                if (minArea < res[0]) { //Fetch the min area
                    res[0] = minArea;
                }

                if (minPeri < res[1]) { //Fetch the min peri
                    res[1] = minPeri;
                }
            }
            // trace(displayArea);
            // trace(displayPerimeter);

            return res;
        }
    }
}
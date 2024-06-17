package
{
    import flash.display.Sprite;
    import mx.utils.StringUtil;
    import Training1.Bai1;
    import Training1.Bai2;
    import Training1.Bai3;
    import Training1.Shape;
    import Training1.Rectangle;
    import Training1.RightTriangle;
    import Training1.TamGiacCan;
    import Training1.ShapeList;
    import Training1.Square;

    public class Main extends Sprite
    {
        public function Main()
        {
            //Bài 1: Sắp xếp mảng tăng dần
            // var sorting:Bai1 = new Bai1();

            // trace("\n");

            // //Bài 2: Đếm số lượng từ trong chuỗi
            // var count:Bai2 = new Bai2();

            // trace("\n");

            // //Bài 3: Tìm min max
            // var getMinMax:Bai3 = new Bai3();

            trace("\n");

            //Bài 4: Kế thừa OOP
            //Yêu cầu 3: *Tạo 1 class chứa các các hình
            var shapeList:ShapeList = new ShapeList();

            var recArr:Array = genRandArr(2);
            var rec:Rectangle = new Rectangle();

            var tamGiacCanArr:Array = genRandArr(2);
            var TGC:TamGiacCan = new TamGiacCan();  

            var sqrtArr:Array = [2];
            var sqrt:Square = new Square();

            rec.sides = recArr;
            TGC.sides = tamGiacCanArr;
            sqrt.sides = sqrtArr;

            shapeList.addShape(rec);
            shapeList.addShape(TGC);
            shapeList.addShape(sqrt);

            //Sort by areas in ascending order
            shapeList.sortByArea();
            trace("Results sorted by area: ");
            shapeList.printShapes();

            trace("\n");

            //Sort by perimeters in descending order
            shapeList.sortByPerimeter();
            trace("Results sorted by perimeter: ");
            shapeList.printShapes();

            trace("\n");

            // /////////////////////////////////////////////////////
            //Yêu cầu 4
            //getMax and getMin of shapes
            // var sList:ShapeList = new ShapeList();

            // for (var i:int; i < 10; i++) {
            //     var randShapes:Shape = genRandShape();
            //     sList.addShape(randShapes);
            // }
            

            // //The max area and max perimeter
            // var res:Array = sList.getMax();
            // var mainStr:String = "The max area is {0} and the max perimeter is {1}";
            // var subStr:String = StringUtil.substitute(mainStr, res[0], res[1]);
            // trace(subStr);

            // //The min area and min perimeter
            // var res2:Array = sList.getMin();
            // var mainStr2:String = "The min area is {0} and the min perimeter is {1}";
            // var subStr2:String = StringUtil.substitute(mainStr2, res2[0], res2[1]);
            // trace(subStr2);

            // //Tổng số lượng và số lượng của mỗi loại hình
            // var soLuong:int = sList.shapes.length;
            // trace("Tổng số lượng của các hình: " + soLuong);

            // var shapeCount:Object = getOccurrence(sList.shapes, soLuong)
            // for (var shapeType:String in shapeCount) {
            //     trace(shapeType + ": " + shapeCount[shapeType]);
            // }

            var tamGiacCan:TamGiacCan = new TamGiacCan();
            var testArr:Array = [1, 2];

            tamGiacCan.sides = testArr;
            trace(tamGiacCan.CalPerimeter())
            trace(tamGiacCan.CalPerimeter())

        }

        public function genRandArr(randEle:int):Array {
            var randArr:Array = new Array();

            for (var i:int = 0; i < randEle; i++) {
                randArr.push(Math.floor(Math.random() * 10));
            }

            return randArr;
        }

        public function genRandShape():Shape { //Generate random shapes
            var shapeType:int = Math.random() * 3;
            var rec:Rectangle;
            var recArr:Array
            var dt:Number = 0;
            var chuVi:Number = 0;

            switch (shapeType) {
                case 0:
                    recArr = genRandArr(2);
                    rec = new Rectangle();
                    rec.sides = recArr;

                    return rec;

                case 1:
                    var sqrtArr:Array = [shapeType];
                    var sqrt:Square = new Square();
                    sqrt.sides = sqrtArr;

                    return sqrt;

                case 2:
                    var tritArr:Array = genRandArr(2);
                    var tri:TamGiacCan = new TamGiacCan();
                    tri.sides = tritArr;                    

                    return tri;

                default:
                    recArr = genRandArr(2);
                    rec = new Rectangle();
                    rec.sides = recArr;

                    return rec;
            }            
        }

        public function getOccurrence(arr:Array, leng:int):Object {
            var counts:Object = {
                "Hình chữ nhật": 0,
                "Hình vuông": 0,
                "Hình tam giác": 0
            };

            for (var i:int = 0; i < leng; i++) {
                var shape:Shape = arr[i];
                
                if (shape is Rectangle) {
                    counts["Hình chữ nhật"]++;
                } else if (shape is Square) {
                    counts["Hình vuông"]++;
                } else if (shape is TamGiacCan) {
                    counts["Hình tam giác"]++;
                } else {
                    trace("Unknown shape type");
                }
            }

            return counts;
        }
    }
}

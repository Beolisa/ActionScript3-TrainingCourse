package
{
    import flash.display.Sprite;
    import Training2.Shape;
    // import Training2.LandPlot;
    import Training2.Land;

    public class Main extends Sprite
    {
        // public function Main()
        // {
        // var onwerName:landOwner = new landOwner("Haha");

        // var arr:Array = [100, 200];
        // var land1:landPlot = new landPlot(arr, onwerName);

        // onwerName.addLand(land1);

        // land1.sides = [300, 200];

        // trace(onwerName.getNum());
        // }

        public function Main()
        {
            var listLand:Land = new Land();

            for (var i:int = 0; i < 4; i++)
            {
                var ranLand:Shape = randomShapeLand();
                listLand.addLand(ranLand);
            }

            listLand.on_size_change([89, 90], 1);

        }

        public function random(num:int):Array
        {
            var arr:Array = new Array();

            for (var index:int = 0; index < num; index++)
            {
                arr.push(Math.floor(Math.random() * 99) + 1);
            }

            return arr;
        }

        public function randomShapeLand():Shape
        {
            var type:int = Math.random() * 2;
            var sideArr:Array;
            switch (type)
            {
                case 0:
                    sideArr = random(2);
                    var rec:Shape = new Shape();
                    rec.status = false;
                    rec.sides = sideArr;

                    return rec;
                case 1:
                    sideArr = random(1);
                    var square:Shape = new Shape();
                    square.status = false;
                    square.sides = sideArr;
                    return square;

                default:
                    sideArr = random(2);
                    var rec1:Shape = new Shape();
                    rec1.status = false;
                    rec1.sides = sideArr;
                    return rec1;
            }
        }
    }
}
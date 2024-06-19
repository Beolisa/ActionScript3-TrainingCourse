package
{
    import flash.display.Sprite;
    import Training2.LandOwner;
    import Training2.LandPlot;
    import Training2.OwnerProperties;

    public class Main extends Sprite
    {
        public function Main()
        {
            //Bài 1:
            ////////////////////////////////////////
            var owner1:LandOwner = new LandOwner();
            owner1.name = "Lisa";

            var land1:LandPlot = new LandPlot();
            land1.sides = [100, 200];
            land1.landOwner = owner1;

            land1.changeSides([200,300]);
            land1.changeOwnerNames("LaLisa");

            ////////////////////////////////////////

            //Bài 2:
            ////////////////////////////////////////
            //Trường hợp 1 mảnh đất liền kề
            var land2:LandPlot = new LandPlot();
            land2.sides = [300,400];

            owner1.addLand(land1);
            owner1.addLand(land2);

            //trace(land1.idx);


        }

        public function getIdx(arr:Array, land:LandPlot):int {
            for (var i:int = 0; i < arr.length; i++)
            {
                if (arr[i] == land)
                {
                    return i;
                }
            }

            return -1;
        }
    }
}
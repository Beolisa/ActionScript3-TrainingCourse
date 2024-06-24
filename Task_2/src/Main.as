package
{
    import flash.display.Sprite;
    import Training2.LandOwner;
    import Training2.LandPlot;
    import Training2.LandTax;
    import Training2.OwnerProperties;

    public class Main extends Sprite
    {
        public function Main()
        {
            var taxManager:LandTax = LandTax.getInstance();

            //Bài 1:
            ////////////////////////////////////////
            var owner1:LandOwner = new LandOwner();
            owner1.name = "Lisa";

            var land1:LandPlot = new LandPlot();
            land1.sides = [100, 200];
            land1.landOwner = owner1;

            ////////////////////////////////////////

            //Bài 2:
            ////////////////////////////////////////
            //Trường hợp 1 chủ có nhiều mảnh đất
            var land2:LandPlot = new LandPlot();
            land2.sides = [300,400];
            land2.landOwner = owner1;
            trace("--------------------------------");
        }
    }
}
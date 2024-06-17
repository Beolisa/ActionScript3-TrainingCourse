package
{
    import flash.display.Sprite;
    import Training2.landOwner;
    import Training2.landPlot;

    public class Main extends Sprite
    {
        public function Main()
        {
            var onwerName:landOwner = new landOwner("Haha");

            var arr:Array = [100, 200];
            var land1:landPlot = new landPlot(arr, onwerName);

            onwerName.addLand(land1);
            
            land1.sides = [300, 200];
            trace(land1.CalArea());

            //trace(onwerName.getNum());
        }
    }
}
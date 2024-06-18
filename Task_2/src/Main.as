package
{
    import flash.display.Sprite;
    import Training2.landOwner;
    import Training2.landPlot;
    import Training2.ownerProperties;

    public class Main extends Sprite
    {
        public function Main()
        {
            var onwerName1:landOwner = new landOwner("Haha");
            var onwerName2:landOwner = new landOwner("Hehe");

            var arr1:Array = [100, 200];
            var land1:landPlot = new landPlot(arr1, onwerName1);
            onwerName1.addLand(land1);


            var arr2:Array = [200, 300];
            var land2:landPlot = new landPlot(arr2, onwerName2);
            onwerName2.addLand(land2);
            onwerName1.addLand(land2);


            var propList:ownerProperties = new ownerProperties();

            propList.addOwnerProps(onwerName1);
            propList.addOwnerProps(onwerName2);

            var owners:Array = propList.owners;

            for (var i:int = 0; i < owners.length; i++) {
                trace("Mảnh đất số " + (i + 1));
                var owner:landOwner = owners[i];
                var lands:Array = owner.lands;

                for (var j:int = 0; j < 2; j++) {
                    var land:landPlot = lands[j];
                    trace("Kích thước " + land.sides);
                }
            }
        }
    }
}
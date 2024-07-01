package {
    import flash.display.Sprite;
    import Training2.LandOwner;
    import Training2.LandPlot;
    import Training2.OwnerProperties;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import Training2.Lands;

    public class Main extends Sprite {
        private var timer:Timer;
        private var propList:OwnerProperties;

        public function Main() {
            propList = new OwnerProperties();

            // Create owners
            var owner1:LandOwner = new LandOwner();
            owner1.name = "Lisa";

            var owner2:LandOwner = new LandOwner();
            owner2.name = "John";

            // Create lands
            var land1:LandPlot = new LandPlot();
            land1.plotID = "001";
            land1.sides = [100, 200];
            land1.landOwner = owner1;
            landList.addLand(land1);

            var land2:LandPlot = new LandPlot();
            land2.plotID = "002";
            land2.sides = [200, 300];
            land2.landOwner = owner2;
            landList.addLand(land2);

            var land3:LandPlot = new LandPlot();
            land3.plotID = "003";
            land3.sides = [300, 400];
            land3.landOwner = owner2;
            landList.addLand(land3);

            var landList:Lands = new Lands();

            for (var i:int = 0; i < 10; i++)
            {
                trace("Loop no." + (i + 1));
                landList.changeSideAtIndex(2, [222,333]);
            }

            trace("Tax rate land1 " + land1.getCurrentTaxRate);
            trace("Tax rate land2 " + land2.getCurrentTaxRate);
            trace("Tax rate land3 " + land3.getCurrentTaxRate);

            // land1.transferLand(owner2);
            // trace(land1.landOwner.name);
            // trace(owner1.lands.length);

            // propList.addOwnerProps(owner1);
            // propList.addOwnerProps(owner2);

            //land1.requestPurchase(owner2); //John mua đất của Lisa
            // ownner.requestPurchase()



            // Setup timer to calculate and print taxes every 10 seconds
            timer = new Timer(5000);
            timer.addEventListener(TimerEvent.TIMER, calandPrintTaxes);
            timer.start();
        }

        private function calandPrintTaxes(event:TimerEvent):void {
            var owners:Vector.<LandOwner> = propList.owners;

            for each (var owner:LandOwner in owners) {
                var totalTax:Number = owner.calTotalTax();
                trace("Owner: " + owner.name);

                for each (var land:LandPlot in owner.lands) {
                    trace("Land ID: " + land.plotID + ", Sides: " + land.sides + ", Tax: " + land.calTax());
                }

                trace("Total tax for " + owner.name + ": " + totalTax);
            }
        }
    }
}

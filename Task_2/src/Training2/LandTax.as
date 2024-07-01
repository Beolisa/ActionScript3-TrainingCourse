package Training2
{
    public class LandTax {
        private var taxRate:Number;
        private var changeCount:int;
        private static var instance:LandTax;

        public function LandTax() {
            if (instance) 
            {
                throw new Error("Singleton class. Use getInstance() to get the single instance of this class.");
            }

            taxRate = 10;
            changeCount = 0;
        }

        public static function getInstance():LandTax 
        {
            if (!instance) 
            {
                instance = new LandTax();
            }
            return instance;
        }

        public function get currentTaxRate():Number 
        {
            return taxRate;
        }

        // public function set currentTaxRate(value:int):void
        // {
        //     taxRate = value;
        // }

        public function get getChangeCount():int
        {
            return changeCount;
        }

        public function recordChange():void
        {
            changeCount++;

            if (changeCount >= 10)
            {
                taxRate *= 1.01; //Increase by 1%
                changeCount = 0;
            }
        }
    }
}
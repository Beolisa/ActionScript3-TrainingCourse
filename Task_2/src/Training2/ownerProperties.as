package Training2
{
    public class ownerProperties {
        private var ownerList:Array;

        public function get owners():Array 
        {
            return ownerList;
        }

        public function ownerProperties()
        {
            ownerList = [];
        }

        public function addOwnerProps(owners:landOwner):void
        {
            ownerList.push(owners);
        }
    }
}
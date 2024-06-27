package Training2
{
    public class OwnerProperties {
        private var ownerList:Array;

        public function OwnerProperties() //Constructor
        {
            ownerList = new Array();
        }

        public function get owners():Array 
        {
            return ownerList;
        }

        public function addOwnerProps(owners:LandOwner):void
        {
            ownerList.push(owners);
        }
    }
}

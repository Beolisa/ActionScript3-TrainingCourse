package Training2
{
    public class OwnerProperties {
        private var ownerList:Vector.<LandOwner>;

        public function OwnerProperties() //Constructor
        {
            ownerList = new Vector.<LandOwner>;
        }

        public function get owners():Vector.<LandOwner>
        {
            return ownerList;
        }

        public function addOwnerProps(owners:LandOwner):void
        {
            ownerList.push(owners);
        }
    }
}

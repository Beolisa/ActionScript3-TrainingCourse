package Training2
{
    public interface LandChangeListener {
        function onLandSizeChanged(values:Array, idx:int):void;
        function onLandOwnerChanged(ownerName:String):void;
    }
}
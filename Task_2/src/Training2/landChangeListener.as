package Training2
{
    public interface LandChangeListener {
        function onLandSizeChanged(values:Array):void;
        function onLandOwnerChanged(ownerName:String):void;
    }
}
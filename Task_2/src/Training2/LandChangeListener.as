package Training2
{
    public interface LandChangeListener {
        function onLandSizeChanged(values:Array, plotID:String, type:int, ownerName:String):void;
        // function onLandOwnerChanged(ownerName:String):void;
        function onPurchaseRequest(buyer:LandOwner, land:LandPlot):void;
    }
}
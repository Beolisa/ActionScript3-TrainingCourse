package Training1
{
    import mx.utils.StringUtil;

    public class Bai3
    {
        public function Bai3()
        {
            var myArr:Array = new Array();

            for (var i:int = 0; i < 10; i++) 
            {
                myArr[i] = Math.floor(Math.random() * 20);
            }

            trace(myArr);

            var myMax:int = Math.max.apply(null, myArr);
            var myMin:int = Math.min.apply(null, myArr);

            var mainStr:String = "The min is {0} and the max is {1}";
            var concatStr:String = StringUtil.substitute(mainStr, myMin, myMax);
            trace(concatStr);
        }
    }
}

package Training1
{
    public class Bai1
    {
        public function Bai1()
        {
            var myArr:Array = new Array();

            for (var i:int = 0; i < 10; i++) {
                myArr[i] = Math.floor(Math.random() * 20);
            }
            myArr.sort(cmpNums);

            trace("MyArr in ascending order: ");
            trace(myArr);
        }

        public function cmpNums(a:int, b:int):int {
            if (a < b) {
                return -1;
            } else if (a > b) {
                return 1;
            } else {
                return 0;
            }
        }
    }
}
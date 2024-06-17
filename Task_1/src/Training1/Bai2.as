package Training1
{
    import mx.utils.StringUtil;

    public class Bai2
    {
        public function Bai2()
        {
            var mainStr:String = "          AAA B B    C C      ";
            var formatStr:String = "The number of characters in the main string '{0}' is {1} and the number of words is {2}";

            // Remove leading and trailing spaces and multiple spaces between words
            var trimmedStr:String = StringUtil.trim(mainStr);
            var cleanedStr:String = removeExtraSpaces(trimmedStr);

            // Count characters and words
            var charCount:int = countCharacters(cleanedStr);
            var wordCount:int = countWords(cleanedStr);

            // Format the output string
            var newStr:String = StringUtil.substitute(formatStr, mainStr, charCount, wordCount);
            
            trace(newStr);
        }

        public function removeExtraSpaces(input:String):String {
            // Replace multiple spaces with a single space
            return input.replace(/\s+/g, " ");
        }

        public function countCharacters(input:String):int {
            // Count characters excluding spaces
            var noSpaces:String = input.replace(/\s+/g, "");
            return noSpaces.length;
        }

        public function countWords(input:String):int {
            // Split the string into words and count them
            if (input == "") {
                return 0;
            }
            var words:Array = input.split(" ");
            return words.length;
        }
    }
}
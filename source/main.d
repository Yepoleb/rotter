import std.stdio, std.math;

static immutable size_t alphabetLenght = 26; //Incase you make your own alphabet
immutable static string[2] alphabet = ["abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ"]; // Qucik method for me to have both big and small letters.

// PART YOU EDIT ///////////////////////////////////////

string input2 = "This is a test phrase to see if the program axtually works. If vladde forgets to delete this line you will have to do it yer self";
string input3 = "abcdefghijklmnopqrstuvwxyz";

string input = "This is a ROT. Guvf vf n EBG"; // String to rotate.
size_t amountOfRotation = 13; // How far you want to rotate the above string.

////////////////////////////////////////////////////////

static this(){
	
	assert(alphabet[0].length == alphabet[1].length); //Make sure both the uppercase and lowercase alphabets are the same lenght. Just to make sure :)
	assert(input.length); //Make sure the string isn't empty
	
	//	foreach(x; 0 .. alphabet.length) assert(alphabet[0].length == alphabet[x].length); //Foreach function to alphabet all "versions" of the alphabets are the same length. I loop through them all incase you'd want more "version" of an alphabeth.
}

class letterCount{
	int letterPlacement;
	int[26] counts;
	
	void addLetter(char ltr){
		letterPlacement = getLetterPlacementInAlphabet(ltr);
		
		if(letterPlacement != alphabetLenght + 1)
			counts[letterPlacement]++;
	}
	
	int[] getLetterCounts(){
		return counts;
	}
}

string ROTate(string str, int amountToRotate) {
	char[] mutableString = str.dup; // Create a mutable version of the string.
	foreach(n; 0 .. mutableString.length){ // For each character in that mutable char array...
		mutableString[n] = rotateCharUniversal(mutableString[n], amountToRotate); // Do the rotation magic.
	}
	return mutableString.idup; // Return as an immutable string.
}

/**
 * Rotates a chacter a specific amount forward
 */
char rotateCharUniversal(char charToRotate, int amount) {
	foreach(n; 0 .. alphabet.length) // For every thing in alphabet[]...
		// And for whatever is in that string array, loop through the string inside.
		foreach(a; 0 .. alphabetLenght) /* This loop should be "alphabet[n].length" instead of 26, but everything in there should be 26 characters anyways */ 
			if(charToRotate == alphabet[n][a]) // Finds the location of the character entered.
				return alphabet[n][(a + amount) % alphabet[n].length]; // Then at last return the character at the correct offset (rotated forward).
	return charToRotate; // If the character isn't found (any character that isn't in the alphabeth, such as a space), return the original character.
}

//////////////////////////////////////////////

/**
 * Returns a letters placement in the alphabet minus 1.
 */
int getLetterPlacementInAlphabet(char letter){
	foreach(n; 0 .. alphabet.length)
		foreach(a; 0 .. alphabetLenght)
			if(letter == alphabet[n][a])
				return a;
	return alphabetLenght + 1; //I don't reall know what to do if you enter an "invalid" letter, such as an space.
}

/**
 * Takes a chacter and turns it to a small letter
 */
char toSmallCharacter(char c){
	return alphabet[0][getLetterPlacementInAlphabet(c)];
}

void guessROT(string str){

	auto lc = new letterCount;
	foreach(a; 0 .. str.length)
		lc.addLetter(str[a]);
	auto storeLetterCounts = lc.getLetterCounts;

	/**
	 * Guess the letter 'e'
	 */
	//Get which letters are used the most.
	const int E_LETTER_PLACEMENT = 5 - 1; //Minus one is since the alphabet starts counting at 0.

	int largestAmount;
	foreach(a; 0 .. storeLetterCounts.length){
		if(largestAmount < storeLetterCounts[a])
			largestAmount = storeLetterCounts[a];
	}

	int[26] blazeit = storeLetterCounts;
	int yolo = largestAmount, difference;

	writeln("\nThe string to be be guessed: ", str, "\n\n");
	while(yolo >= 0){
		for(int i = 0; i < blazeit.length; i++){
			if(blazeit[i] == yolo){

				difference = E_LETTER_PLACEMENT - i; //Problems may lie in here :(

				writeln("Rotate amount = ", difference, ":\n", ROTate(str, difference), "\n");  // TODO: Bug, the program gets the negative amount, but rotates in the wrong way, for instance a rotation of 8. Modulus 26 doesn't work on negative numbers?
				//TODO: Rotation of 24 gives -2 as answer (which is correct, 26-2 is 24)
				blazeit[i] = -1;

				writeln(" Does this sentence make any sense? If not, press enter to continue.");
				readln();

				i = -1; //Resets the loop;
			}

		}
		yolo--;
	}

	writeln("\nThe loop for the most common letters has finished. Press enter to print out every other possible combination.");
	readln();

	foreach(amount; 0 .. alphabetLenght)
		writeln(amount, ": ", ROTate(str, amount));
}

void main() {
	writeln(ROTate(input3, amountOfRotation));

	//Buggy tests
	//+
	//writeln(ROTate(input3, 1));		//TODO: These give very alike results, but a few letters differ from the other. 'w' is 'a' on the secone line. Prolly modulus 26 not working on negative numbers.
	//writeln(ROTate(input3, -21));

	guessROT(ROTate(input2, 24)); //The program gives '-1' as an answer, and 'rotation: 1' is rotated the "wrong" way, aka. the opposite
	//+/
}

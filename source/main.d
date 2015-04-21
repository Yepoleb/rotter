import std.stdio;

size_t alphabetLenght; //Incase you make your own alphabet
immutable static string[2] check = ["abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ"]; // Qucik method for me to have both big and small letters.

static this(){

	assert(check[0].length == check[1].length); //Make sure both alphabets are the same lenght. Just to make sure :)

//	foreach(x; 0 .. check.length) //Foreach function to check all "versions" of the alphabets are the same length. I loop through them all incase you'd want more "version" of an alphabeth.
//		assert(check[0].length == check[x].length);

	alphabetLenght = check[0].length; //Sets the lenght to the alphabets lenghts.
}

// PART YOU EDIT ///////////////////////////////////////

string input = "This is a ROT. Guvf vf n EBG"; // String to rotate.
size_t amountOfRotation = 13; // How far you want to rotate the above string.

////////////////////////////////////////////////////////

string ROTate(string str, int amountToRotate) {
	char[] mutableString = str.dup; // Create a mutable version of the string.
	foreach(n; 0 .. mutableString.length){ // For each character in that mutable char array...
		mutableString[n] = rotateCharUniversal(mutableString[n], amountToRotate); // Do the rotation magic.
	}
	return mutableString.idup; // Return as an immutable string.
}

char rotateCharUniversal(char charToRotate, int amount) {
	foreach(n; 0 .. check.length) // For every thing in check[]...
		// And for whatever is in that string array, loop through the string inside.
		foreach(a; 0 .. alphabetLenght) /* This loop should be "check[n].length" instead of 26, but everything in there should be 26 characters anyways */ 
			if(charToRotate == check[n][a]) // Finds the location of the character entered.
				return check[n][(a + amount) % check[n].length]; // Then at last return the character at the correct offset (rotated forward).
	return charToRotate; // If the character isn't found (any character that isn't in the alphabeth, such as a space), return the original character.
}

void main() {
	writeln(ROTate(input, amountOfRotation));
}

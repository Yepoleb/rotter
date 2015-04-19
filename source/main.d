import std.stdio;

// PART YOU EDIT ///////////////////////////////////////

char[] input = "This is a ROT. Guvf vf n EBG".dup;
size_t amountOfRotation = 13;

////////////////////////////////////////////////////////

immutable static string[2] check = ["abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ"];

void main() {
	ROTate(input, amountOfRotation);
}


void ROTate(char[] s, int amountToRotate) {
	foreach(n; 0 .. s.length){
		s[n] = rotateCharUniversal(s[n], amountToRotate);
	}

	writeln(input);
}

char rotateCharUniversal(char charToRotate, int amount) {
	foreach(n; 0 .. check.length)
		foreach(a; 0 .. check[n].length){
			if(charToRotate == check[n][a]){
				return check[n][(a + amount) % check[n].length];
			}
		}

	return charToRotate;
}
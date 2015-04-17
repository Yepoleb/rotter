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
	foreach(a; 0 .. check[0].length){
		if(charToRotate == check[0][a]){
			return check[0][(a + amount) % check[0].length];
		}
		if(charToRotate == check[1][a]){
			return check[1][(a + amount) % check[1].length];
		}
	}

	return charToRotate;
}
# rotter
Can cipher letters

## How do I use it?
1. You need a D compiler
2. It's not user-friendly
3. Follow the next step
5. What happened to 4?

## Get it running!
You need a D compiler, and then in the code you need to edit some preferences.

```char[] input = "This is a ROT. Guvf vf n EBG".dup;
size_t amountOfRotation = 13;

void main() {
	ROTate(input, amountOfRotation);
}
```

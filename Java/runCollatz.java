import java.math.BigInteger;
import java.util.Vector;

public class runCollatz{

	public static void main(String[] args){

		// The height of the sequence start values
		BigInteger end = 10000;
		System.out.println("Finding 10 longest sequences between 1 and " + end);

		// Holds all Collatz Objects found between 2 and the end
		Vector all = new Vector(0, 1);		
		// Holds the elements of the current collatz sequence
		Vector sequence = new Vector(0,1);

		// Holds the size of the current collatz sequnce
		int size;

		for( BigInteger i = 2; i < end; i++ ){

			sequence = collatz(i);
			size = sequence.size()-1;

			all.addElement(new Collatz(i, size));
		
			sequence.clear();		
		}

		
	}
}

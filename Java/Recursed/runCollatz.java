// Hannah Gulle
// Computes the top 10 collatz start values for a given range using 
// recursive methods.
// Required classes: collatz.java, sortByLength.java, sortByStart.java
import java.math.*;
import java.util.*;
import java.lang.Object;

public class runCollatz{

	public static void main(String[] args){

		// Range upper bound retrieved from the user keyboard
		System.out.println("Input Highest Starting Integer");
		Scanner in = new Scanner(System.in);
		long end = in.nextLong();

		// Holds all Collatz Objects found between 2 and the end
		ArrayList<collatz> all = new ArrayList<collatz>();		
		// Holds the elements of the current collatz sequence
		ArrayList<Long> sequence = new ArrayList<Long>();

		// Holds the size of the current collatz sequnce
		int size;
		for( long i = 2; i < end ; i++ ){

			sequence.add(i);
			sequence = Collatz(sequence, i);
			size = sequence.size()-1;

			all.add(new collatz(i, size));
		
			sequence.clear();		
		}

		System.out.println("Top 10 Starting Values After Sorting by Length");

		// Sort in ascending order by sequence length
		Collections.sort(all, new sortByLength());	

		// holds top ten collatz objects
		ArrayList<collatz> topTen = new ArrayList<collatz>();
		int top = 1;
		
		// output the top 10 after sorting by length
		for( int j = all.size()-1; j > 1; j-- ){

			if( all.get(j).getLength() > all.get(j-1).getLength() ){
				topTen.add( all.get(j) );
				System.out.println( all.get(j).getStart() + " " + all.get(j).getLength() );
				top++;
			}
			if( top > 10 ){
				break;
			}
		}
		
		System.out.println("\nTop 10 Starting Values After Sorting By Start");

		// Sort top 10 by sequence start
		Collections.sort( topTen, new sortByStart() );

		// output top 10 after sorting by start
		for(int i = 9; i > -1; i--){
			System.out.println( topTen.get(i).getStart() + " " + topTen.get(i).getLength() );
		}	
	}

	// recursively computes the collatz sequence for a starting integer
	public static ArrayList<Long> Collatz( ArrayList<Long> sequence, long start ){

		if( start == 1 ){
			return sequence;
		}
		else if( start%2 == 0 ){
			start = start / 2;
			sequence.add( start );
			return Collatz( sequence, start );
		}
		else{
			start = (3*start)+1;
			sequence.add( start );
			return Collatz( sequence, start );
		}
	}

}

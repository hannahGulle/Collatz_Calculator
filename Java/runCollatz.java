// Hannah Gulle
// Computes the top 10 collatz sequence lengths for a given range.
// Requires Classes: collatz.java, sortByLength.java, sortByStart.java

import java.math.*;
import java.util.*;
import java.lang.Object;

// Main Program
public class runCollatz{

	public static void main(String[] args){

		// The height of the sequence start values
		System.out.println("Input the Highest Starting Value");
		Scanner in = new Scanner(System.in);
		long end = in.nextLong();

		// Holds all Collatz Objects found between 2 and the end
		ArrayList<collatz> all = new ArrayList<collatz>();		
		// Holds the elements of the current collatz sequence
		ArrayList<Long> sequence = new ArrayList<Long>();

		// Holds the size of the current collatz sequnce
		long size;
		for( long i = 2; i < end ; i++ ){

			sequence = Collatz(i);
			size = sequence.size()-1;

			all.add(new collatz(i, size));
		
			sequence.clear();		
		}

		System.out.println("Top 10 Starting Values After Sorting by Length");

		// Sort in ascending order by sequence length
		Collections.sort(all, new sortByLength());	

		// Holds top 10 values
		ArrayList<collatz> topTen = new ArrayList<collatz>();
		int top = 1;
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
		
		System.out.println("\nTop 10 Starting Values After Sorting by Start");

		// Sort top 10 values by starting value
		Collections.sort( topTen, new sortByStart());
		
		// outputs the top 10 after sorting by starting value
		for( int i = 9; i > -1; i-- ){
			System.out.println( topTen.get(i).getStart() + " " + topTen.get(i).getLength() );
		}
	}

	// Calculates the collatz sequence for a given starting value
	public static ArrayList<Long> Collatz( long start ){
		
		ArrayList<Long> sequence = new ArrayList<Long>();
		sequence.add( start );

		while( start != 1 ){
			if( start % 2 == 0 ){
				start = start / 2;
			}
			else{
				start = (start * 3)+1;
			}
			sequence.add( start );
		}
		return sequence;
	}

}

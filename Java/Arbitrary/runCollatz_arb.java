// Hannah Gulle
// Computes the top 10 collatz sequences by start and length for a 
// given range using arbitrary precision.
// Required classes: collatz_arb.java, sortByLength_arb.java, sortByStart_arb.java

import java.math.*;
import java.util.*;
import java.lang.Object;

// Main Program
public class runCollatz_arb{

	public static void main(String[] args){

		// The height of the sequence start values
		System.out.println("Input the Highest Starting Value");
		Scanner in = new Scanner(System.in);
		BigInteger end = in.nextBigInteger();

		// Holds all Collatz Objects found between 2 and the end
		ArrayList<collatz_arb> all = new ArrayList<collatz_arb>();		
		// Holds the elements of the current collatz sequence
		ArrayList<BigInteger> sequence = new ArrayList<BigInteger>();

		// Holds the size of the current collatz sequnce
		int size;
		BigInteger temp;
		for( int i = 2; i < end.intValue() ; i++ ){

			temp = BigInteger.valueOf(i);
		
			sequence = Collatz(temp);
			size = sequence.size()-1;

			all.add(new collatz_arb(temp, size));
		
			sequence.clear();		
		}

		System.out.println("Top 10 Starting Values After Sorting By Length");

		// Sort in ascending order by sequence length
		Collections.sort(all, new sortByLength_arb());	

		// Array List holds top 10 collatz objects
		ArrayList<collatz_arb> topTen = new ArrayList<collatz_arb>();
		int top = 1;
		for( int j = all.size()-1; j > 1; j-- ){

			if( all.get(j).getLength() > all.get(j-1).getLength() ){
				topTen.add( all.get(j) );
				System.out.println( (all.get(j).getStart()).toString() + " " + all.get(j).getLength() );
				top++;
			}
			if( top > 10 ){
				break;
			}
		}
		
		System.out.println("\nTop 10 Starting Values After Sorting by Start");		

		// Sort top 10 by starting value
		Collections.sort( topTen, new sortByStart_arb());

		// output top 10 after sorting by start
		for( int i = 9; i > -1; i-- ){
			System.out.println( topTen.get(i).getStart() + " " + topTen.get(i).getLength() );
		}
	}

	// Computes the collatz sequence for a given starting integer
	public static ArrayList<BigInteger> Collatz( BigInteger start ){
		
		ArrayList<BigInteger> sequence = new ArrayList<BigInteger>();
		sequence.add( start );

		BigInteger zero, one, two, three;
		one = BigInteger.valueOf(1); two = BigInteger.valueOf(2);
		three = BigInteger.valueOf(3); zero = BigInteger.valueOf(0);

		while( !start.equals( one ) ){

			if( start.mod( two ) == zero ){
				start = start.divide( two );
			}
			else{
				start = (start.multiply( three )).add( one );
			}
			sequence.add( start );
		}
		return sequence;
	}

}

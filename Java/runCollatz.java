import java.math.*;
import java.util.*;
import java.lang.Object;

public class runCollatz{

	public static void main(String[] args){

		// The height of the sequence start values
		BigInteger end = new BigInteger("10000");
		System.out.println("Finding 10 longest sequences between 1 and " + end);

		// Holds all Collatz Objects found between 2 and the end
		ArrayList<collatz> all = new ArrayList<collatz>();		
		// Holds the elements of the current collatz sequence
		ArrayList<BigInteger> sequence = new ArrayList<BigInteger>();

		// Holds the size of the current collatz sequnce
		int size;
		BigInteger temp;
		for( int i = 2; i < end.intValue() ; i++ ){

			temp = BigInteger.valueOf(i);
		
			sequence = Collatz(temp);
			size = sequence.size()-1;

			all.add(new collatz(temp, size));
		
			sequence.clear();		
		}

		// Sort in ascending order by sequence length
		Collections.sort(all, new sortByLength());	

		int top = 1;
		for( int j = all.size()-1; j > 1; j-- ){

			if( all.get(j).getLength() > all.get(j-1).getLength() ){
				System.out.println( (all.get(j).getStart()).toString() + " " + all.get(j).getLength() );
				top++;
			}
			if( top > 10 ){
				break;
			}
		}
	}

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

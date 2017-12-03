import java.math.*;
import java.util.*;
import java.lang.Object;

public class runCollatz{

	public static void main(String[] args){

		// The height of the sequence start values
		long end = 10000;	
		System.out.println("Finding 10 longest sequences between 1 and " + end);

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

		// Sort in ascending order by sequence length
		Collections.sort(all, new sortByLength());	

		int top = 1;
		for( int j = all.size()-1; j > 1; j-- ){

			if( all.get(j).getLength() > all.get(j-1).getLength() ){
				System.out.println( all.get(j).getStart() + " " + all.get(j).getLength() );
				top++;
			}
			if( top > 10 ){
				break;
			}
		}
	}

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

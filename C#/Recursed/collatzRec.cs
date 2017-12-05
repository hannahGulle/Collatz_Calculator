// Hannah Gulle
// Computes the top 10 collatz sequence lengths from 2 to a
// given starting integer maximum value recursively.

using System;
using System.Collections.Generic;

namespace CollatzSequence{

	class collatz{
		
		private ulong start; // Start of Collatz Sequence
		private int length; // Length of Collatz Sequence

		// Empty Constructor
		public collatz(){
			this.start = 0;
			this.length = 0;
		}

		// Constructor
		public collatz( ulong start, int length ){
			this.start = start;
			this.length = length;
		}

		// Sets the starting value of the given sequence
		public void setStart( ulong start ){
			this.start = start;
		}

		// Sets the length of a given sequence
		public void setLength( int length ){
			this.length = length;
		}

		// Retrieves the starting value of a given sequence
		public ulong getStart(){
			return this.start;
		}

		// Retrieves the length of a given sequence
		public int getLength(){
			return this.length;
		}
	}

	// Main Program
	class runCollatz{

		static void Main(){

			// TODO User input

			ulong end = 10000;

			// List of all collatz objects from a given start and with a
			// computed sequence length
			List<collatz> all = new List<collatz>();
			// List of all values in a given collatz sequence given a starting
			// value
			List<ulong> sequence = new List<ulong>();

			// Retrieves the collatz object for each starting value
			int size;
			for(ulong i = 2; i < end; i++){

				sequence.Add(i);
				sequence = Collatz(sequence, i);
				size = sequence.Count - 1;

				all.Add( new collatz( i, size ));

				sequence.Clear();
			}	
		
			Console.WriteLine("Top 10 Starting Values After Sorting By Length");
			
			// Sorts collatz object list by sequence length
			all.Sort(delegate( collatz c1, collatz c2 ){
				return c1.getLength().CompareTo( c2.getLength() );
			});

			// outputs the top 10 collatz starting values after sorting by length
			int top = 1;
			List<collatz> topTen = new List<collatz>();
			for( int i = all.Count-1; i > 1; i--){

				if( all[i].getLength() > all[i-1].getLength() ){
					topTen.Add( all[i] );
					Console.WriteLine( "{0} {1}", all[i].getStart(), all[i].getLength());
					top++;
				}
				if( top > 10 ){
					break;
				}
			}

			// sorts the top 10 collatz object list by sequence start value
			Console.WriteLine("\nTop 10 Starting Values After Sorting by Start");
			topTen.Sort(delegate( collatz c1, collatz c2 ){
				return c1.getStart().CompareTo( c2.getStart() );
			});		

			// outputs the top 10 collatz starting values after sorting by start
			for( int i = 9; i > 0; i-- ){
				Console.WriteLine("{0} {1}", topTen[i].getStart(), topTen[i].getLength());
			}
		}
	
		public static List<ulong> Collatz( List<ulong> sequence, ulong start ){

			if( start == 1 ){
				return sequence;
			}
			else if( start % 2 == 0 ){
				sequence.Add( start/2 );
				return Collatz( sequence, start/2 );
			}
			else{
				sequence.Add( (3*start)+1 );
				return Collatz( sequence, (3*start)+1 );
			}
		}	
	}
}

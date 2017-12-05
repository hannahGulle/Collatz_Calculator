// Hannah Gulle
// Computes the top 10 collatz sequences from 2 to a given
// starting integer using arbitrary precision

using System;
using System.Collections.Generic;
using System.Numerics;

namespace CollatzSequence{

	class collatz{

		// Arbitrary Precision Valued Start and Length of the 
		// Given Collatz Sequence and Collatz Object
		private BigInteger start;
		private BigInteger length;

		// Empty Constructor
		public collatz(){
			this.start = BigInteger.Zero;
			this.length = BigInteger.Zero;
		}

		// Constructor
		public collatz( BigInteger start, BigInteger length ){
			this.start = start;
			this.length = length;
		}

		// Sets the Arbitrary Precision Start Value
		public void setStart( BigInteger start ){
			this.start = start;
		}

		// Sets the Arbitrary Precision Length Value
		public void setLength( BigInteger length ){
			this.length = length;
		}

		// Retrieves the Arbitrary Precision Start Value
		public BigInteger getStart(){
			return this.start;
		}

		// Retrieves the Arbitrary Precision Length Value
		public BigInteger getLength(){
			return this.length;
		}
	}

	// The Main Program
	class runCollatz{

		static void Main(){

			// Retrieve the highest starting integer from the user	
			Console.WriteLine("Input the Highest Starting Integer");
			string value = Console.ReadLine();
			BigInteger end = BigInteger.Parse(value);

			// List of All collatz Objects for the given Starting Value
			// Range
			List<collatz> all = new List<collatz>();
			// List of all sequence values for a given starting value
			List<BigInteger> sequence = new List<BigInteger>();

			// Retrieves and Constructs a collatz object for each starting
			// value from 2 to the highest starting value and inputs the 
			// sequence size into the object
			BigInteger size;
			for(BigInteger i = 2; i < end; i++){

				sequence = Collatz(i);
				size = sequence.Count - 1;

				all.Add( new collatz( i, size ));
				sequence.Clear();
			}	
			
			Console.WriteLine("Top 10 Starting Values After Sorting by Length");
			
			// Sorts Collatz Object list by Length
			all.Sort(delegate( collatz c1, collatz c2 ){
				return c1.getLength().CompareTo( c2.getLength() );
			});

			// List of top ten collatz objects by length
			List<collatz> topTen = new List<collatz>();

			// Determines the top 10 values of the list of all collatz objects
			int top = 1;
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
		
			Console.WriteLine("\n Top 10 Starting Values After Sorting by Start");
	
			// Sorts collatz object list by start
			topTen.Sort(delegate( collatz c1, collatz c2 ){
				return c1.getStart().CompareTo( c2.getStart() );
			});

			// Outputs the top 10 starting values after sorting by start
			for( int i = 9; i > -1; i-- ){
				Console.WriteLine("{0} {1}", topTen[i].getStart(), topTen[i].getLength() );
			}
		}
	
		// Computes the colltz sequence for a given starting position
		public static List<BigInteger> Collatz( BigInteger start ){

			List<BigInteger> sequence = new List<BigInteger>();
			sequence.Add( start );

			while( !start.IsOne ){
				if( start.IsEven ){
					start = BigInteger.Divide(start, 2);
				}
				else{
					start = BigInteger.Add(BigInteger.Multiply(3, start), 1);
				}
				sequence.Add( start );
			}
			return sequence;
		}	
	}
}

// Hannah Gulle
// Computes the top 10 longest collatz sequences from
// 2 to the highest integer inputted by the user
// 11/12 2017

using System;
using System.Collections.Generic;

namespace CollatzSequence{

	class collatz{

		private ulong start;	// Starting Integer of the Given Collatz Sequence
		private int length;	// Length of the Given Collatz Sequence

		// Empty Constructor for a Collatz Object
		public collatz(){
			this.start = 0;
			this.length = 0;
		}

		// Constructor for a Collatz Object 
		public collatz( ulong start, int length ){
			this.start = start;
			this.length = length;
		}

		// Set the Start of a Collatz Object
		public void setStart( ulong start ){
			this.start = start;
		}

		// Set the Length of a Collatz Object for a Given Starting Integer
		public void setLength( int length ){
			this.length = length;
		}

		// Retrieve the Starting Integer for a Given Collatz Object
		public ulong getStart(){
			return this.start;
		}

		// Retrieve the Length of a the Collatz Sequence for a Given
		// Collatz Object
		public int getLength(){
			return this.length;
		}
	}

	// Main Program that Calculates the Sequence Length for each Starting Integer
	class runCollatz{

		static void Main(){

			// Retrieve the Highest Starting Integer from the User
			Console.WriteLine("Input the Highest Starting Integer");
			string value = Console.ReadLine();
			ulong end = UInt64.Parse(value);

		
			// List Holds all Collatz Objects from 2 to the Highest Starting Integer
			List<collatz> all = new List<collatz>();
			// List Holds all sequence values for a given starting integer
			List<ulong> sequence = new List<ulong>();

			int size;
			// Retrieve the collatz sequence for a given starting integer
			for(ulong i = 2; i < end; i++){

				sequence = Collatz(i);
				size = sequence.Count - 1;

				// Add this collatz object with start and length to the list of 
				// collatz objects
				all.Add( new collatz( i, size ));

				sequence.Clear();
			}	
		
			Console.WriteLine("The Top 10 Starting Integers After Sorting by Length");

			// Sort collatz object list by length
			all.Sort(delegate( collatz c1, collatz c2 ){
				return c1.getLength().CompareTo( c2.getLength() );
			});

			// Determine the top 10 starting integers from the list after
			// sorting by start value
			int top = 1;
			List<collatz> topTen = new List<collatz>();
			for( int i = all.Count-1; i > 1; i--){

				if( all[i].getLength() > all[i-1].getLength() ){
					topTen.Add(all[i]);
					Console.WriteLine( "{0} {1}", all[i].getStart(), all[i].getLength());
					top++;
				}
				if( top > 10 ){
					break;
				}
			}
			
			Console.WriteLine("\n The Top 10 Starting Integers After Sorting By Start");

			// Sort Collatz object list by start
			topTen.Sort(delegate( collatz c1, collatz c2 ){
				return c1.getStart().CompareTo( c2.getStart() );
			});

			// Output the top 10 starting integers from the list after
			// sorting by length value
			for( int i = 9; i > -1; i-- ){
				Console.WriteLine(" {0} {1}", topTen[i].getStart(), topTen[i].getLength());
			}	
		}
	
		// Calculates the sequence of collatz integers from a given starting integer
		public static List<ulong> Collatz( ulong start ){

			List<ulong> sequence = new List<ulong>();
			sequence.Add( start );

			while( start != 1 ){
				if( start % 2 == 0 ){
					start = start / 2;
				}
				else{
					start = (3 * start) + 1;
				}
				sequence.Add( start );
			}
			return sequence;
		}	
	}
}

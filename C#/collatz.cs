using System;
using System.Collections.Generic;

namespace CollatzSequence{

	class collatz{

		private ulong start;
		private int length;

		public collatz(){
			this.start = 0;
			this.length = 0;
		}

		public collatz( ulong start, int length ){
			this.start = start;
			this.length = length;
		}

		public void setStart( ulong start ){
			this.start = start;
		}

		public void setLength( int length ){
			this.length = length;
		}

		public ulong getStart(){
			return this.start;
		}

		public int getLength(){
			return this.length;
		}
	}

	class runCollatz{

		static void Main(){

			ulong end = 10000;

			List<collatz> all = new List<collatz>();
			List<ulong> sequence = new List<ulong>();

			int size;
			for(ulong i = 2; i < end; i++){

				sequence = Collatz(i);
				size = sequence.Count - 1;

				all.Add( new collatz( i, size ));

				sequence.Clear();
			}	
		
			all.Sort(delegate( collatz c1, collatz c2 ){
				return c1.getLength().CompareTo( c2.getLength() );
			});

			int top = 1;
			for( int i = all.Count-1; i > 1; i--){

				if( all[i].getLength() > all[i-1].getLength() ){
					Console.WriteLine( "{0} {1}", all[i].getStart(), all[i].getLength());
					top++;
				}
				if( top > 10 ){
					break;
				}
			}
		}
	
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

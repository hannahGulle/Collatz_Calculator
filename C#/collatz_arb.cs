

using System;
using System.Collections.Generic;
using System.Numerics;

namespace CollatzSequence{

	class collatz{

		private BigInteger start;
		private BigInteger length;

		public collatz(){
			this.start = BigInteger.Zero;
			this.length = BigInteger.Zero;
		}

		public collatz( BigInteger start, BigInteger length ){
			this.start = start;
			this.length = length;
		}

		public void setStart( BigInteger start ){
			this.start = start;
		}

		public void setLength( BigInteger length ){
			this.length = length;
		}

		public BigInteger getStart(){
			return this.start;
		}

		public BigInteger getLength(){
			return this.length;
		}
	}

	class runCollatz{

		static void Main(){

			BigInteger end = 10000;

			List<collatz> all = new List<collatz>();
			List<BigInteger> sequence = new List<BigInteger>();

			BigInteger size;
			for(BigInteger i = 2; i < end; i++){

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

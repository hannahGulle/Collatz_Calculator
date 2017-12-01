import java.math.BigInteger;
import java.util;

public class collatz implements Comparator<collatz> {

	private BigInteger start;
	private BigInteger length;

	public collatz(){
		this.start = BigInteger.ZERO;
		this.length = BigInteger.ZERO;
	}

	public collatz(BigInteger start, BigInteger length){
		this.start = start;
		this.length = length;
	}

	public void setStart(BigInteger start){
		this.start = start;
	}

	public void setLength(BigInteger length){
		this.length = length;
	} 

	public BigInteger getStart(){
		return this.start;
	}

	public BigInteger getLength(){
		return this.length;
	}

	public int compareStart(collatz a, collatz b){
		if( a < b ){
			return -1;
		}
		else if( a == b ){
			return 0;
		}
		else{
			return 1;
		}
	}
}

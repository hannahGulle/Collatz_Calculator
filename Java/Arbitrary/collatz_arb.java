import java.math.BigInteger;

public class collatz_arb {

	private BigInteger start;
	private int length;

	public collatz_arb(){
		this.start = BigInteger.ZERO;
		this.length = 0;
	}

	public collatz_arb(BigInteger start, int length){
		this.start = start;
		this.length = length;
	}

	public void setStart(BigInteger start){
		this.start = start;
	}

	public void setLength(int length){
		this.length = length;
	} 

	public BigInteger getStart(){
		return this.start;
	}

	public int getLength(){
		return this.length;
	}
}

// Hannah Gulle

public class collatz {

	private long start;// sequence starting value
	private long length;// collatz sequence length

	// Empty Constructor
	public collatz(){
		this.start = 0;
		this.length = 0;
	}

	// Constructor
	public collatz(long start, long length){
		this.start = start;
		this.length = length;
	}

	// Set starting value
	public void setStart(long start){
		this.start = start;
	}

	// set sequence length 
	public void setLength(long length){
		this.length = length;
	} 

	// retrive starting value
	public long getStart(){
		return this.start;
	}

	// retrieve collatz sequence length
	public long getLength(){
		return this.length;
	}
}

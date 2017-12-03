public class collatz {

	private long start;
	private long length;

	public collatz(){
		this.start = 0;
		this.length = 0;
	}

	public collatz(long start, long length){
		this.start = start;
		this.length = length;
	}

	public void setStart(long start){
		this.start = start;
	}

	public void setLength(long length){
		this.length = length;
	} 

	public long getStart(){
		return this.start;
	}

	public long getLength(){
		return this.length;
	}
}

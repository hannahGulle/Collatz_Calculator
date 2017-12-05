import java.util.*;

public class sortByStart_arb implements Comparator<collatz_arb>{

	public int compare( collatz_arb a, collatz_arb b ){

		return (a.getStart()).compareTo(b.getStart());
	/*	if( a.getStart() > b.getStart() ){
			return 1;
		}
		else if( a.getStart() < b.getStart() ){
			return -1;
		}
		else{
			return 0;
		}
	*/
	}

}

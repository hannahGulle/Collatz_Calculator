// Hannah Gulle
import java.util.*;

public class sortByLength implements Comparator<collatz>{

	public int compare( collatz a, collatz b ){
		if( a.getLength() > b.getLength() ){
			return 1;
		}
		else if( a.getLength() < b.getLength() ){
			return -1;
		}
		else{
			return 0;
		}
	}

}

import java.lang.Long;
import java.util.*;

public class sortByLength implements Comparator<collatz>{

	public int compare( collatz a, collatz b ){

		if( (a.getLength()) == (b.getLength())){
			return 0;
		}
		else if( (a.getLength()) > (b.getLength())){
			return 1;
		}
		else{
			return -1;
		}
	}

}

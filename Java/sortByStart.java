import java.lang.Long;
import java.util.*;

public class sortByStart implements Comparator<collatz>{

	public int compare( collatz a, collatz b ){

		if( (a.getStart()) == (b.getStart())){
			return 0;
		}
		else if( (a.getStart()) > (b.getStart())){
			return 1;
		}
		else{
			return -1;
		}
	}

}

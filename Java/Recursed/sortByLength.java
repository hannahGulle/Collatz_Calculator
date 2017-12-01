import java.util.*;

public class sortByLength implements Comparator<collatz>{

	public int compare( collatz a, collatz b ){

		return a.getLength() - b.getLength();
	}

}

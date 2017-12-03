import java.util.*;

public class sortByLength_arb implements Comparator<collatz_arb>{

	public int compare( collatz_arb a, collatz_arb b ){

		return a.getLength() - b.getLength();
	}

}

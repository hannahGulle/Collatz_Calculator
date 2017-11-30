// Hannah Gulle
// Project 3 -- The Collatz Conjecture
// Given a starting integer within the compiler max integer range,
// the Collatz sequence for the beginning value will be computed 
// and the sequence size printed to the screen.
// Additionally, for the max integer range given gcc 6.4.0
// restrictions in c++, the 10 numbers producing the longest 
// Collatz Sequences will be determined.
// Consider c++MaxIntegerValues.txt for gcc 6.4.0 integer
// range restrictions, as considered in this program.

#include<iostream>
#include<vector>
#include<algorithm>

using namespace std;

struct Collatz{
	unsigned long long int start;
	int length;
};

bool lengthSort(Collatz const& lhs, Collatz const& rhs);
vector<unsigned long long int> collatz( unsigned long long int start );
int main(){

	// The height of the sequence start values
	unsigned long long int end = 10000;
	cout << "Finding 10 longest sequences between 1 and " << end << "." << endl;

	vector<Collatz> all;
	vector<unsigned long long int> sequence;
	int size;
	for(unsigned long long int i = 2; i < end; i++){
		sequence = collatz(i);
		size = sequence.size()-1;
		
		Collatz c = {i, size};
		all.push_back(c);
		
		sequence.clear();	

	}

	// Sorts collatz structs by length of sequence
	sort( all.begin(), all.end(), &lengthSort );

	int top = 1;
	for(int i = all.size()-1; i > 1; i--){

		if( all[i].length > all[i-1].length ){
			
			cout << all[i].start << " " << all[i].length << endl;
			top++;
		}
		if( top > 10 ){
			break;
		}
	}

	return 0;
}

bool lengthSort(Collatz const& lhs, Collatz const& rhs){
	return lhs.length < rhs.length;
}

vector<unsigned long long int> collatz( unsigned long long int start ){

	vector<unsigned long long int> sequence;
	sequence.push_back(start);

	while( start != 1 ){

		if( start % 2 == 0 ){
			start /= 2;
		}
		else{
			start = ( 3 * start ) + 1;
		}
		sequence.push_back(start);
	}

	return sequence;
}

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

// Collatz Struct holds sequence start and sequence length
struct Collatz{
	unsigned long long int start;
	int length;
};

// Sorting Methods
bool startSort(Collatz const& lhs, Collatz const& rhs);
bool lengthSort(Collatz const& lhs, Collatz const& rhs);

// Collatz Method
vector<unsigned long long int> collatz( unsigned long long int start );

// Main Program
int main(){

	// Retrieves the highest starting value from the user
	unsigned long long int end;
	cout << "Enter Highest Starting Value: ";
	cin >> end;

	// collatz struct vector holds all objects within computation starting range
	vector<Collatz> all;
	// vector holds all sequence values for a given start
	vector<unsigned long long int> sequence;

	// determines and constructs the collatz structs to fill the collatz vector
	// for each starting value and sequence length after collatz construction
	int size;
	for(unsigned long long int i = 2; i < end; i++){
		sequence = collatz(i);
		size = sequence.size()-1;
		
		Collatz c = {i, size};
		all.push_back(c);
		
		sequence.clear();	

	}

	cout << "Top 10 Starting Values After Sorting by Length" << endl;

	// Sorts collatz structs by length of sequence
	sort( all.begin(), all.end(), &lengthSort );

	// Outputs the top 10 starting values after Sorting by length
	vector<Collatz> topTen;
	int top = 1;
	for(int i = all.size()-1; i > 1; i--){

		if( all[i].length > all[i-1].length ){
			topTen.push_back(all[i]);
			cout << all[i].start << " " << all[i].length << endl;
			top++;
		}
		if( top > 10 ){
			break;
		}
	}

	// Sorts collatz struct vector of top 10 objects by starting value
	sort( topTen.begin(), topTen.end(), &startSort );

	cout << "\n Top 10 Starting Values After Sorting By Start" << endl;

	// outputs top 10 starting values after sorting by start
	for( int i = 9; i > 0; i-- ){
		cout << topTen[i].start << " " << topTen[i].length << endl;
	}

	return 0;
}

// sorting function: sorts by collatz object start value
bool startSort(Collatz const& lhs, Collatz const& rhs ){
	return lhs.start < rhs.start;
}

// sorting function: sorts by collatz object length value
bool lengthSort(Collatz const& lhs, Collatz const& rhs){
	return lhs.length < rhs.length;
}

// calculates the collatz sequence for a given start value
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

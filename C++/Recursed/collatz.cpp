// Hannah Gulle
// Computes the top 10 starting values from 2 to a given positive index
// by collatz sequence length and starting value recursively

#include<iostream>
#include<vector>
#include<algorithm>

using namespace std;

// collatz struct holds sequence start and sequence length
struct Collatz{
	unsigned long long int start;
	unsigned long long int length;
};

// Sorting Methods
bool startSort(Collatz const& lhs, Collatz const& rhs);
bool lengthSort(Collatz const& lhs, Collatz const& rhs);

// Collatz Computation Method
vector<unsigned long long int> collatz( vector<unsigned long long int> sequence, unsigned long long int start );

// Main Program
int main(){

	// Retrieves the maximum starting integer from the keyboard
	unsigned long long int max;
	cout << "Enter the Highest Starting Integer: ";
	cin >> max;

	// vector of all collatz objects within computation range
	vector<Collatz> all;
	// vector of all collatz sequence values for a given starting value
	vector<unsigned long long int> sequence;
	// length of a given sequence
	unsigned long long int length;
	
	// computes the collatz sequence for each starting value within range
	for(unsigned long long int i = 2; i < max; i++ ){
		sequence.push_back(i);
		sequence = collatz( sequence, i );
	
		length = sequence.size()-1;
		Collatz c = {i, length};
		all.push_back(c);

		sequence.clear();
	}

	cout << "Top 10 Starting Values After Sorting by Length" << endl;
	// sorts all collatz objects by sequence length
	sort( all.begin(), all.end(), &lengthSort );

	// Calculates and Outputs the top 10 starting values after sorting by length
	int top = 1;
	vector<Collatz> topTen;
	for(int i = all.size()-1; i > 1; i--){
		if( all[i].length > all[i-1].length){
			topTen.push_back( all[i] );
			cout << all[i].start << " " << all[i].length << endl;
			top++;
		}
		
		if( top > 10 ){
			break;
		}
	}	

	cout << "\n Top 10 Starting Values After Sorting by Start" << endl;
	// sorts top 10 collatz objects by sequence start
	sort( topTen.begin(), topTen.end(), &startSort );

	for( int i = 9; i > 0; i-- ){
		cout << topTen[i].start << " " << topTen[i].length << endl;
	}
	
	return 0;
}

// Sorting Method: Sorts collatz objects by starting value
bool startSort(Collatz const& lhs, Collatz const& rhs){
	return lhs.start < rhs.start;
}

// Sorting Method: sorts collatz objects by length
bool lengthSort(Collatz const& lhs, Collatz const& rhs){
	return lhs.length < rhs.length;
}

// recursively determines the collatz sequence for a given starting value
vector<unsigned long long int> collatz( vector<unsigned long long int> sequence, unsigned long long int start ){

	if( start == 1 ){
		return sequence;
	}
	else if( start % 2 == 0 ){
		sequence.push_back( start/2 );
		return collatz( sequence, start/2 );
	}
	else{
		sequence.push_back( (3 * start) + 1 );
		return collatz( sequence, (3 * start) + 1 );
	}
}

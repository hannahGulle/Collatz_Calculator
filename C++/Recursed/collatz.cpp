#include<iostream>
#include<vector>
#include<algorithm>

using namespace std;

struct Collatz{
	unsigned long long int start;
	unsigned long long int length;
};

bool lengthSort(Collatz const& lhs, Collatz const& rhs);
vector<unsigned long long int> collatz( vector<unsigned long long int> sequence, unsigned long long int start );
int main(){

	// Retrieve 
	unsigned long long int max;
	cout << "Enter the maximum positive integer: ";
	cin >> max;

	vector<Collatz> all;
	vector<unsigned long long int> sequence;
	unsigned long long int length;
	
	for(unsigned long long int i = 2; i < max; i++ ){
		sequence.push_back(i);
		sequence = collatz( sequence, i );
	
		length = sequence.size()-1;
		Collatz c = {i, length};
		all.push_back(c);

		sequence.clear();
	}

	sort( all.begin(), all.end(), &lengthSort );

	int top = 1;
	for(int i = all.size()-1; i > 1; i--){
		if( all[i].length > all[i-1].length){
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

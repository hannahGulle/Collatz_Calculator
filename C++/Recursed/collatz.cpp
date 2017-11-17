#include<iostream>
#include<vector>

using namespace std;

vector<long> collatz( long start );
int main(){

	// Retrieve 
	long start;
	cout << "Enter the starting positive integer: ";
	cin >> start;

	vector<long> sequence = collatz( start );

	for( int i = 0; i < sequence.size(); i++ ){
		
		cout << i << " " << sequence[i] << endl;
	}

	return 0;
}

vector<long> collatz( long start ){

	vector<long> sequence;

	if( start == 1 ){
		return start;
	}
	else if( start % 2 == 0 ){
		sequence.push_back(collatz( start/2 ));
	}
	else{
		sequence.push_back(collatz( (3 * start) + 1 ));
	}
}

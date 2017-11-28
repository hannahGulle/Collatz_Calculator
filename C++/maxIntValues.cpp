#include<iostream>
#include<climits>
#include<fstream>
using namespace std;

int main(){

	ofstream ofile;
	ofile.open("c++IntegerMaxValues.txt");
	
	ofile << "C++ Unsigned Integer Type Max Values" << endl;
	ofile << "===================================" << endl;
	ofile << "Signed Int Max:\t\t\t" << INT_MAX << endl;
	ofile << "Unsigned Int Max:\t\t" << UINT_MAX << endl;
	ofile << "Signed Long Max:\t\t" << LONG_MAX << endl;
	ofile << "Unsigned Long Max:\t\t" << ULONG_MAX << endl;
	ofile << "Signed Long Long Max:\t\t" << LLONG_MAX << endl;
	ofile << "Unsigned Long Long Max: \t" << ULLONG_MAX << endl;

	ofile.close();
	return 0;
}

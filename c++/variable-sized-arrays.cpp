#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <sstream>
#include <algorithm>
using namespace std;

/*
 * Solution for: https://www.hackerrank.com/challenges/variable-sized-arrays/problem
 */

int main() {
    string input;
    vector<string> inputVectorN, inputVectorQ;
    long n, q;
    vector<vector<long>> elements;
    getline(cin, input);
    sscanf(input.c_str(), "%ld %ld", &n, &q);
    for(long i = 0; i < n; i++) {
        getline(cin, input);
        inputVectorN.push_back(input);
    }
    for(long i = 0; i < q; i++) {
        getline(cin, input);
        inputVectorQ.push_back(input);
    }
    for(auto &element : inputVectorN) {
        istringstream iss(element);
        vector<long> temp;
        while(getline(iss, input, ' ')) {
            temp.push_back(stoi(input));
        }
        elements.push_back(temp);
    }
    for(auto &element : inputVectorQ) {
        long i = 0, j = 0;
        istringstream iss(element);
        iss >> i >> j; j++;
        cout << elements[i][j] << endl;
    }
    return 0;
}

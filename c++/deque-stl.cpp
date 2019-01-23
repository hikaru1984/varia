#include <iostream>
#include <deque> 

using namespace std;

/*
 *  Solution for: https://www.hackerrank.com/challenges/deque-stl/problem
 */

void debugDeque(deque<int> &d) {
    for(int &i : d) {
        cout << i << " ";
    }
    cout << endl;
}

void printKMax(int arr[], int n, int k){
    deque<int> d;
    deque<int> max;
    max.push_back(0);
    for(int i = 0; i < k; i++) {
        d.push_back(arr[i]);
        if(arr[i] > max[0])
            max[0] = arr[i];
    }
    int v = 0, j = 1;
    for(int i = k; i < n; i++) {
        d.push_back(arr[i]);
        int removed = d.front();
        d.pop_front();
        if(arr[i] > max[j - 1])
            v = arr[i];
        else {
            if(removed == max[j - 1]) {
                v = 0;
                for(int &el : d) {
                    if(el > v)
                        v = el;
                } 
            } else {
                v = max[j - 1];
            }
        }
        max.push_back(v);
        ++j;
    }
    for(int &el : max) {
        cout << el << " ";
    }
    cout << endl;
}

int main(){
  
	int t;
	cin >> t;
	while(t>0) {
		int n,k;
    	cin >> n >> k;
    	int i;
    	int arr[n];
    	for(i=0;i<n;i++)
      		cin >> arr[i];
    	printKMax(arr, n, k);
    	t--;
  	}
  	return 0;
}

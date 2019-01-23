#include <bits/stdc++.h>
#include <iostream>
#include <vector>
#include <string>

using namespace std;

vector<string> split_string(string);

// Complete the surfaceArea function below.
int surfaceArea(vector<vector<int>> A) {
    int updown = A.size() * A[0].size();
    
    int front_wall = 0;
    for(int &a : A[0]) {
        front_wall += a;
    }

    int back_wall = 0;
    for(int &a : A[A.size() - 1]) {
        back_wall += a;
    }

    int left_wall = 0, right_wall = 0;
    for(vector<int> &row : A) {
        left_wall += row[0];
        right_wall += row[row.size() - 1];
    }

    int internal = 0;
    for(int j = 0; j < A.size() - 1; j++) {
        for(int i = 0; i < A[j].size() - 1; i++) {
            int side1 = abs(A[j][i] - A[j][i + 1]);
            int side2 = abs(A[j][i] - A[j + 1][i]);
            internal += side1 + side2;
        }
    }
    for(int j = 0; j < A.size() - 1; j++) {
        int i = A[0].size() - 1;
        internal += abs(A[j][i] - A[j + 1][i]);
    }
    for(int i = 0; i < A[0].size() - 1; i++) {
        int j = A.size() - 1;
        internal += abs(A[j][i] - A[j][i + 1]);
    }

    int sum = 2 * updown + front_wall + back_wall + left_wall + right_wall + internal;
    return(sum);
}

int main()
{
    ofstream fout(getenv("OUTPUT_PATH"));
    string HW_temp;
    getline(cin, HW_temp);
    vector<string> HW = split_string(HW_temp);
    int H = stoi(HW[0]);
    int W = stoi(HW[1]);
    vector<vector<int>> A(H);
    for (int i = 0; i < H; i++) {
        A[i].resize(W);
        for (int j = 0; j < W; j++) {
            cin >> A[i][j];
        }
        cin.ignore(numeric_limits<streamsize>::max(), '\n');
    }
    int result = surfaceArea(A);
    fout << result << "\n";
    fout.close();
    return 0;
}

vector<string> split_string(string input_string) {
    string::iterator new_end = unique(input_string.begin(), input_string.end(), [] (const char &x, const char &y) {
        return x == y and x == ' ';
    });
    input_string.erase(new_end, input_string.end());
    while (input_string[input_string.length() - 1] == ' ') {
        input_string.pop_back();
    }
    vector<string> splits;
    char delimiter = ' ';
    size_t i = 0;
    size_t pos = input_string.find(delimiter);
    while (pos != string::npos) {
        splits.push_back(input_string.substr(i, pos - i));

        i = pos + 1;
        pos = input_string.find(delimiter, i);
    }
    splits.push_back(input_string.substr(i, min(pos, input_string.length()) - i + 1));
    return splits;
}


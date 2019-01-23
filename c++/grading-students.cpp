#include <vector>
#include <bits/stdc++.h>
/*
 * Solution for: https://www.hackerrank.com/challenges/grading/problem
 */


using namespace std;

/*
 * Complete the gradingStudents function below.
 */

int roundUp(int a) {
    if(a % 5 != 0) {
        int n = 5 - (a % 5);
        if(n < 3)
            return(a + n);
    }
    return(a);
}

vector<int> gradingStudents(vector<int> grades) {
    vector<int> result;
    for(int &el : grades) {
        if(el > 100 || el < 0)
            result.push_back(-1);
        if(el >= 38) {
            result.push_back(roundUp(el));
        } else {
            result.push_back(el);
        }
    }
    return(result);
}

int main()
{
    ofstream fout(getenv("OUTPUT_PATH"));

    int n;
    cin >> n;
    cin.ignore(numeric_limits<streamsize>::max(), '\n');

    vector<int> grades(n);

    for (int grades_itr = 0; grades_itr < n; grades_itr++) {
        int grades_item;
        cin >> grades_item;
        cin.ignore(numeric_limits<streamsize>::max(), '\n');

        grades[grades_itr] = grades_item;
    }

    vector<int> result = gradingStudents(grades);

    for (int result_itr = 0; result_itr < result.size(); result_itr++) {
        fout << result[result_itr];

        if (result_itr != result.size() - 1) {
            fout << "\n";
        }
    }

    fout << "\n";

    fout.close();

    return 0;
}

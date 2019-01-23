// Solution for: https://www.hackerrank.com/challenges/organizing-containers-of-balls/problem

#include <bits/stdc++.h>
#include <algorithm>
#include <string>
#include <vector>

using namespace std;

// Complete the organizingContainers function below.
string organizingContainers(vector<vector<int>> container) {
    vector<int> sum_for_container;
    vector<int> sum_for_type(container[0].size(), 0);
    for(auto &c : container) {
        sum_for_container.push_back(std::accumulate(c.begin(), c.end(), 0));
        for(int i = 0; i < c.size(); i++) {
            sum_for_type[i] += c[i];
        }
    }
    std::sort(sum_for_container.begin(),
            sum_for_container.end(),
            [] (int i, int j) { return(i > j); });
    std::sort(sum_for_type.begin(),
            sum_for_type.end(),
            [] (int i, int j) { return(i > j); });
    if(std::equal(sum_for_container.begin(), sum_for_container.end(), sum_for_type.begin()))
        return("Possible");
    return("Impossible");
}

int main()
{
    ofstream fout(getenv("OUTPUT_PATH"));

    int q;
    cin >> q;
    cin.ignore(numeric_limits<streamsize>::max(), '\n');

    for (int q_itr = 0; q_itr < q; q_itr++) {
        int n;
        cin >> n;
        cin.ignore(numeric_limits<streamsize>::max(), '\n');

        vector<vector<int>> container(n);
        for (int i = 0; i < n; i++) {
            container[i].resize(n);

            for (int j = 0; j < n; j++) {
                cin >> container[i][j];
            }

            cin.ignore(numeric_limits<streamsize>::max(), '\n');
        }

        string result = organizingContainers(container);

        fout << result << "\n";
    }

    fout.close();

    return 0;
}

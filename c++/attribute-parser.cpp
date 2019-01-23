#include <algorithm>
#include <cmath>
#include <cstdio>
#include <iostream>
#include <map>
#include <sstream>
#include <string>
#include <vector>

using namespace std;

/*
 * Solution for: https://www.hackerrank.com/challenges/attribute-parser/problem
 */

class Tag {
    public:
        string marker;
        vector<string> prevTagMarkers;
        map<string, string> attributes;

        Tag(string marker) : marker(marker) {}
};

void split(const string &str, vector<string> &cont, const string &delim = " ") {
    int c, p;
    c = str.find_first_of(delim);
    while(c != string::npos) {
        cont.push_back(str.substr(p, c - p));
        p = c + 1;
        c = str.find_first_of(delim, p);
    }
    cont.push_back(str.substr(p, c - p));
}

int main() {
    int a, b;
    vector<string> hrmlLines;
    vector<string> queries;
    string input;
    getline(cin, input);
    stringstream s(input);
    s >> a >> b;
    for(int i = 0; i < a; i++) {
        getline(cin, input);
        hrmlLines.push_back(input);
    }
    for(int i = 0; i < b; i++) {
        getline(cin, input);
        queries.push_back(input);
    }
    
    vector<Tag> tags;
    vector<string> openTagsSeq;
    for (string &line : hrmlLines) {
        line = line.substr(1, line.length() - 2);
        string marker = line.substr(0, line.find_first_of(" "));
        if(marker.find("/") == string::npos) {
            tags.push_back(marker);
            if(openTagsSeq.size() > 0)
                tags.back().prevTagMarkers = openTagsSeq;
            openTagsSeq.push_back(marker);
            string attrs = line.substr(line.find_first_of(" ") + 1);
            vector<string> splAttrs;
            split(attrs, splAttrs);
            for(vector<string>::iterator it = splAttrs.begin();
                it != splAttrs.end(); it++) {
                    if(it->compare("=") == 0) {
                        string first = *(it - 1);
                        string second = *(it + 1);
                        second = second.substr(1, second.length() - 2);
                        tags.back().attributes.insert(pair<string, string>(first, second));
                    }
            }
        } else {
            marker = marker.substr(1);
            openTagsSeq.erase(remove(openTagsSeq.begin(), openTagsSeq.end(), marker),
                openTagsSeq.end());
        }
    }

    for(string &line : queries) {
        int pos = line.find_first_of("~");
        string prevTags = line.substr(0, pos);
        string attrName = line.substr(pos + 1);
        vector<string> prevTagMSpl;
        split(prevTags, prevTagMSpl, ".");
        string parentTagMarker = prevTagMSpl.back();
        prevTagMSpl.erase(prevTagMSpl.end());

        string message = "Not Found!";
        for(auto tag : tags) {
            if(parentTagMarker.compare(tag.marker) == 0) {
                if(tag.prevTagMarkers.size() != prevTagMSpl.size())
                    break;
                
                bool found = true;
                for (int i = 0; i < tag.prevTagMarkers.size(); i++) {
                    if (tag.prevTagMarkers[i].compare(prevTagMSpl[i]) != 0)
                        found = false;
                }

                if(found && tag.attributes.find(attrName) != tag.attributes.end())
                    message = tag.attributes.find(attrName)->second;
            }
        }
        cout << message << endl;

    }
    return 0;
}

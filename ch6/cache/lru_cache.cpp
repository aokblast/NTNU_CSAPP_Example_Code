class LRUCache {
public:
    LRUCache(int capacity) {
        cap = capacity;
    }
    
    int get(int key) {
        auto iter = m.find(key);
        if(iter == m.end()) return -1;
        l.splice(l.begin(), l, iter->second);
        return iter->second->second;
    }
     
    void put(int key, int value) {
        auto iter = m.find(key);
        if(iter != m.end())l.erase(iter->second);

        l.push_front(make_pair(key, value));
        m[key] = l.begin();
        if(m.size() > cap){
                m.erase(l.rbegin()->first);
                l.pop_back();
        }

    }
private:
    int cap;
    list<pair<int, int>> l;
    unordered_map<int, list<pair<int,int>>::iterator> m; 
};

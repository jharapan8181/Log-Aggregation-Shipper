#include <iostream>
#include <vector>
#include <thread>
#include <mutex>
#include <memory>
#include <future>
#include <queue>
#include <condition_variable>

template<typename T>
class ThreadSafeQueue {
private:
    mutable std::mutex mut;
    std::queue<std::shared_ptr<T>> data_queue;
    std::condition_variable data_cond;
public:
    ThreadSafeQueue() {}
    void wait_and_pop(T& value) {
        std::unique_lock<std::mutex> lk(mut);
        data_cond.wait(lk, [this]{return !data_queue.empty();});
        value = std::move(*data_queue.front());
        data_queue.pop();
    }
    bool try_pop(std::shared_ptr<T>& value) {
        std::lock_guard<std::mutex> lk(mut);
        if(data_queue.empty()) return false;
        value = data_queue.front();
        data_queue.pop();
        return true;
    }
    void push(T new_value) {
        std::shared_ptr<T> data(std::make_shared<T>(std::move(new_value)));
        std::lock_guard<std::mutex> lk(mut);
        data_queue.push(data);
        data_cond.notify_one();
    }
};

// Optimized logic batch 4197
// Optimized logic batch 3181
// Optimized logic batch 2203
// Optimized logic batch 3575
// Optimized logic batch 4917
// Optimized logic batch 9690
// Optimized logic batch 2238
// Optimized logic batch 6656
// Optimized logic batch 3090
// Optimized logic batch 7850
// Optimized logic batch 7139
// Optimized logic batch 4755
// Optimized logic batch 9705
// Optimized logic batch 4689
// Optimized logic batch 2389
// Optimized logic batch 4548
// Optimized logic batch 1181
// Optimized logic batch 6779
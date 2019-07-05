考虑一下下面这段代码：

```c
volatile T g_val;
void fun() {
    if(g_val ...) {
        lock(&mutex);
        if(g_val ...) {
            // do something
            g_val = ...;
        }
        unlock(&mutex);
    }
}
```

当g_val的写入执行到一半的时候（比如写入了1个Byte），另一个线程完全可以开始读取。

后来想了一下，这是因为没有同步的关系，我觉得应该可以配合atomic来进行同步。

```c
atomic<T> g_val;

void fun() {
    T tmp = atomic_load(&g_val, memory_order_acquire);
    if(tmp ...) {
        lock(&mutex);
        tmp = atomic_load(&g_val, memory_order_acquire);
        if(tmp ...) {
            // do something
            tmp = ...;
            atomic_store(&g_val, &tmp, memory_order_release);
        }
        unlock(&mutex);
    }
}
```

然而看起来效率远不如最简单的方案啊。

```c
volatile T g_val;
void fun() {
    lock(&mutex);
    if(g_val ...) {
        // do something
        g_val = ...;
    }
    unlock(&mutex);
}
```

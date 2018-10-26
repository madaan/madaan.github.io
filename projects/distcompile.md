---
layout: page
title: Distributed Compilation as a Service
---

### Objective
It was 2012 and I was really interested in dsitributed computing. One of the first projects we undertook was comparing the performance of a cluster of junk machines vs. the comparitively state of the art intel i-series processors. At the same time, I was actively contributing to Calligra which took a long time to compile. I also noticed that the machines in our labs are free almost all the time. These seemingly disjoint ideas led to the question of whether we can use the idle time on the machines for distributed compilation. 

This was also the first proper research project I undertook. We got a good paper out of it ([IEEE link](https://ieeexplore.ieee.org/document/6637374/), [PDF](https://docs.google.com/viewer?url=https://madaan.github.io/res/papers/distcc-cluster.pdf){:target="_blank"}), and learned a lot about system design and implementation. Also, the build times improved drastically and I was able to contribute a [feature](https://git.reviewboard.kde.org/r/109746/) to Calligra! 

### Objective 

To build a system that can provide the idle CPU time of the machines in a computer lab as a service to the users.

### Solution
The idea of using the idle resources of a system for some other useful purpose is not new. seti@home pioneered this concept of “public resource computing” by bringing together millions of users worldwide who were ready to donate their idle CPU cycles to the cause of searching the extra terrestrial intelligence. We designed a system that uses the same concept for reducing build times by using free cycles on idle computer systems in labs of our institute. The challenge of distributing compilation is tackled by a distributing compiler. We used distcc for the purpose. The system keeps track of free helpers, divides the work fairly among the helpers and most importantly, provides an intuitive interface to the clients who would use the system oblivious of the complexities of the back end.


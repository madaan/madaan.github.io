---
permalink: "/projects/moviesim"
title: "MovieSim"
---

### Objective
- [Gran Torino](https://www.imdb.com/title/tt1205489/) and [Harry Brown](https://www.imdb.com/title/tt1289406/) are _similar movies_. If you like one, you _may_ like the other<a href="#comment">¹</a>. The similarity is not based on "similar users" rating both the movies highly (though that could be happening), but is based on the fact that both the movies involve a lonely, retired person with a military background takes the responsibbility of delivering justice to those who have been wronged in their own hands.

- Given a movie, recommend other movies that have similar plots.

### Solution

- Wikipedia dump of movie pages was used to extract movie plots. The topics were identified using Latent Dirichlet Allocation and KL-Divergence was used to find out similar movies.

- Although we didn't get great results, the struggle did help us in getting some interesting insights into the problem.

- The data source, methodology, discussion of results and error analysis is available in the report [here](https://docs.google.com/viewer?url=https://github.com/madaan/madaan.github.io/raw/master/res/papers/moviesim.pdf){:target="_blank"}


---
<span id="comment">¹ both great movies btw, you'll probably like them both in any case but I have to make a point here.</span>

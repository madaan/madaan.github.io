---
layout: post
title: The case for inference-time compute
root: "../"
blog: "true"
---
<script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML"></script>

---
*The next generation of AI systems for reasoning will likely rely on a powerful base language model at its core, with a number of inference time techniques that make it more useful.*

### Next token prediction is awesome
I'm in the _next token-prediction is awesome_ camp. I think despite whatever the naysayers say, the ability to coherently complete a series of tokens grounded in some context is highly non-trivial, and I think humans do it all the time as well. While chatgpt helped in making debates around this stuff mainstream, it has been going around for a whle now. Here is a quote from .

### Next token prediction is not enough

As awesome as it is, I think the ability to do good next-token prediction is only a necessary condition to build systems that tackle difficult reasoning problems. It is also true that humans don't just do next-token prediction for all but the most mundane tasks. Even if we focus on tasks that involve a single human generating some textual output, it is clear that the next token prediction exercise goes beyond just generation. For more challenging, creative tasks, we do next-token prediction + `X`. Here, `X` is a number of things, including:

1. **Generate many candidates:** We generate a lot of candidates and then pick the best one. Example, when suggesting a movie to watch that fits a certain criteria.

2. **Iterate:** Generate some output, then think about it, then generate some more output. Example, when writing a blog post.

3. **Go beyond context:** We don't just use the context, but use the broader world knowledge to generate the output. Often, this involves learnings from the past (a *memory* of mistakes or cultural conditioning). Example, answering a question within our domain of expertise.

4. **Use tools:** we realize when we reach a point where doing things manually doesn't make sense. At those points, we invoke a tool, and use the output from the tool to continue with the task. Example, we use spell checkers, calculators, etc.

5. **Rephrase the question:** Sometimes when we are stuck, we rephrase the question to make it easier to answer. Example, when we are stuck on a math problem, we try to rephrase it in terms of a problem we know how to solve.

6. **Solve the easy bits first:** We solve the easy bits first, and then focus on the hard bits. Example, solving a programming puzzle is often best done by coming up with a brute force solution first, and then optimizing it.

The examples above make a couple of things pretty clear:

A. Next-token prediction is not the only thing we do.
B  Next-token prediction machinery *better* be good, because it is the base on which all of the above is built. If the base is not good, then the rest of the stuff is not going to be good either.


There are now LLM techniques for realizing all of the above techniques, and are more commonly called search, memory, retrieval and alignment (going beyond context), tool-usage, prompting, and question decomposition. I think these techniques are going to be the next frontier of research in language models, and will be the key to building systems that can do reasoning. Together, these techniques require "throwing more compute" at the problem at inference time, using a good base model.


### Distribution Transformation Perspective

My favorite way of looking at this is in terms of a distribution transformation. The base LM gives you a strong but simple distribution over the text on the internet. This is powerful, because you already have a great prior on to complete the text for a wide range of contexts. Let's say this is the distribution $$P_{lm}(x)$$. Now we *can* draw samples from this distribution, but it is likely not going to be very useful, as anyone who has played with models that have not been instruction-tuned will tell you.
It is more interesting to parameterize a different distribution $$P_{lm + X}(x)$$, where $$X$$ is some transformation that we apply to the base distribution. 




---

**Acknowledgements:** Thanks to [Omar Khattab](https://omarkhattab.com/) for the helpful brainstorming meetings. We were planning to write a paper on this back in December 2023 (after meeting at Neurips), but couldn't find the time.

<!-- 
### How do you create such transforms?


Prompting and p
- DSPy
- Langchain
- 

### Isn't this just neuro-symbolic?

- Sure, but it's not just that. First, the definition of what exactly is I've always been confused 



---


* Some real tension we are resolving.
* Go against: thinking about distributions. 
* You'll never fully get there. 

---
- Autoregressive vs. non-symbolic camp
- Autoregressive vs. planning camp
- 

* First camp we are against: the base llm will not be enough.

* Second camp: RAG is not enough.

* Third camp: Agents are unreliable.

- Good names are important.
  
- Hallucination.

- Optimization camp: could you parameterize these steps, can you actually optimize objectives?

- *Surface-level Gradient descent*: can you do gradient descent on these objectives?


- Agents

- Compilers.

- The same program can be compiled into a finetuned or a simple prompt or p-tuning. 

- A huge step over the standard approach is to think of LLMs as a compilers. Then can you shift oart of the compiler outside of the model.

- RASPy -->